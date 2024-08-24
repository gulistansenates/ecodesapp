import 'package:ekodlariapp/screen/productdetay.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot> _searchResults = [];
  bool _isSearching = false;

  void _search(String query) async {
    setState(() {
      _isSearching = true;
    });

    // Küçük harfli sorgu
    final lowerCaseQuery = query.toLowerCase();

    // 'tuz' ve 'snacks' koleksiyonlarından veri çekiyoruz
    final tuzCollection = FirebaseFirestore.instance.collection('tuz');
    final snacksCollection = FirebaseFirestore.instance.collection('snacks');

    final tuzSnapshot = await tuzCollection.get();
    final snacksSnapshot = await snacksCollection.get();

    final List<QueryDocumentSnapshot> allProducts = [
      ...tuzSnapshot.docs,
      ...snacksSnapshot.docs,
    ];

    // Arama işlemi
    final results = allProducts.where((doc) {
      // 'name_lowercase' alanının varlığını kontrol et
      final data = doc.data() as Map<String, dynamic>?;
      final nameLowerCase = data?['name_lowercase'] as String? ?? '';
      // Küçük harfli arama
      return nameLowerCase.contains(lowerCaseQuery);
    }).toList();

    setState(() {
      _searchResults = results;
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
          child: AppBar(
            elevation: 50,
            title: const Center(
              child: Text(" E CODES",
                  style: TextStyle(
                      fontFamily: "Myfont",
                      fontSize: 35,
                      color: Color.fromARGB(210, 255, 255, 255))),
            ),
            automaticallyImplyLeading: true,
            backgroundColor: Color.fromARGB(135, 7, 135, 255),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ürün Ara...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: _isSearching ? CircularProgressIndicator() : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  _search(query);
                } else {
                  setState(() {
                    _searchResults = [];
                  });
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final product = _searchResults[index];
                final imgUrl = product['img_url'];
                final name = product['name'];

                return ListTile(
                  leading: imgUrl != null
                      ? Image.network(imgUrl,
                          width: 50, height: 50, fit: BoxFit.cover)
                      : Icon(Icons.image_not_supported),
                  title: Text(name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Productdetay(
                          img_url: product['img_url']!,
                          name: product['name']!,
                          text: product['text']!,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
