import 'package:ekodlariapp/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Productdetay extends StatelessWidget {
  final String img_url;
  final String name;
  final String text;

  Productdetay({
    required this.img_url,
    required this.name,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 225, 255),
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
            child: Container(
              margin: EdgeInsets.all(16.0), // Kenarlardan boşluk
              padding: EdgeInsets.all(16.0), // İçeriden boşluk
              decoration: BoxDecoration(
                color: Color.fromARGB(185, 255, 255, 255), // Beyaz arka plan
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        img_url,
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify, // Metni iki yana yasla
                      softWrap: true, // Metni yumuşak sarma ile gösterir
                      overflow: TextOverflow.clip, // Metin taşmasını önler
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10), // Sayfanın altından biraz boşluk bırak
        ],
      ),
    );
  }
}
