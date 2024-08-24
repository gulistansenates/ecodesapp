import 'package:ekodlariapp/screen/favorite.dart';
import 'package:ekodlariapp/screen/productcard.dart';

import 'package:ekodlariapp/screen/productdetay.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: favoritesProvider.favorites.length,
        itemBuilder: (context, index) {
          final product = favoritesProvider.favorites[index];
          return GestureDetector(
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
            child: Productcard(
              img_url: product['img_url']!,
              name: product['name']!,
              text: product['text']!,
            ),
          );
        },
      ),
    );
  }
}
