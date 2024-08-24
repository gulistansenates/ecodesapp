import 'package:ekodlariapp/screen/productcard.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ProductPage extends StatelessWidget {
  final CollectionReference tuzCollection =
      FirebaseFirestore.instance.collection('tuz');
  final CollectionReference snacksCollection =
      FirebaseFirestore.instance.collection('snacks');

  Stream<List<QueryDocumentSnapshot>> _getProducts() {
    return CombineLatestStream.list([
      tuzCollection.snapshots(),
      snacksCollection.snapshots(),
    ]).map((snapshots) {
      List<QueryDocumentSnapshot> products = [];
      for (var snapshot in snapshots) {
        products.addAll(snapshot.docs);
      }
      return products;
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
      body: StreamBuilder(
        stream: _getProducts(),
        builder:
            (context, AsyncSnapshot<List<QueryDocumentSnapshot>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final products = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              return Productcard(
                img_url: product['img_url'],
                name: product['name'],
                text: product['text'],
              );
            },
          );
        },
      ),
    );
  }
}
