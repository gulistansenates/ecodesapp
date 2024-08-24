import 'package:ekodlariapp/screen/productcard.dart';
import 'package:ekodlariapp/screen/productdetay.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryPage extends StatelessWidget {
  final CollectionReference tuzCollection =
      FirebaseFirestore.instance.collection('tuz');
  final CollectionReference snacksCollection =
      FirebaseFirestore.instance.collection('snacks');

  Stream<List<QueryDocumentSnapshot>> _getProducts(
      CollectionReference collection) {
    return collection.snapshots().map((snapshot) => snapshot.docs);
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
          Expanded(
            child: Column(
              children: [
                Text(
                  'Tuz',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: _getProducts(tuzCollection),
                    builder: (context,
                        AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final products = snapshot.data!;

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product =
                              products[index].data() as Map<String, dynamic>;
                          final imgUrl = product['img_url'] as String?;
                          final name = product['name'] as String?;
                          final text = product['text'] as String?;

                          if (imgUrl == null || name == null || text == null) {
                            return SizedBox.shrink(); // Boş widget döndür
                          }
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Productdetay(
                                    img_url: product['img_url'],
                                    name: product['name'],
                                    text: product['text'],
                                  ),
                                ),
                              );
                            },
                            child: Productcard(
                              img_url: product['img_url'],
                              name: product['name'],
                              text: product['text'],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 1, height: 1),
          Expanded(
            child: Column(
              children: [
                Text(
                  'Atıştırmalık',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: _getProducts(snacksCollection),
                    builder: (context,
                        AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final products = snapshot.data!;

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product =
                              products[index].data() as Map<String, dynamic>;
                          final imgUrl = product['img_url'] as String?;
                          final name = product['name'] as String?;
                          final text = product['text'] as String?;

                          if (imgUrl == null || name == null || text == null) {}
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Productdetay(
                                    img_url: product['img_url'],
                                    name: product['name'],
                                    text: product['text'],
                                  ),
                                ),
                              );
                            },
                            child: Productcard(
                              img_url: product['img_url'],
                              name: product['name'],
                              text: product['text'],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
