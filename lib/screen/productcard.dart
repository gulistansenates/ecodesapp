import 'package:ekodlariapp/constants/color.dart';
import 'package:ekodlariapp/screen/favorite.dart';
import 'package:ekodlariapp/screen/productdetay.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class Productcard extends StatelessWidget {
  final String img_url;
  final String name;
  final String text;

  const Productcard({
    required this.img_url,
    required this.name,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorited = favoritesProvider.isFavorited(img_url, name);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Productdetay(
              img_url: img_url,
              name: name,
              text: text,
            ),
          ),
        );
      },
      child: Card(
        color: Color.fromARGB(255, 194, 225, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4.0)),
                child: Container(
                  margin:
                      const EdgeInsets.all(8.0), // Üstten ve yanlardan boşluk
                  padding: const EdgeInsets.all(4.0), // İçeriden boşluk
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white, // Beyaz arka plan rengi
                    borderRadius: BorderRadius.circular(8.0), // Köşe yuvarlatma
                  ),
                  child: Image.network(
                    img_url,
                    fit: BoxFit.contain, // Resmin tam olarak görünmesini sağlar
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(219, 255, 255, 255)),
                    ),
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? Colors.blue : null,
                    ),
                    onPressed: () {
                      favoritesProvider.toggleFavorite(img_url, name, text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
