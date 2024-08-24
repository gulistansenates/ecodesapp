import 'package:ekodlariapp/screen/login.dart';
import 'package:ekodlariapp/screen/userpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print("Giriş başarılı");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Login()), // Ana sayfa veya başka bir sayfa
      );
    } catch (e) {
      print("Giriş başarısız ");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Giriş başarısız")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Üst dikdörtgen
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5, // Sayfanın yarısı
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(135, 7, 135, 255),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Center(
                child: Text("GİRİŞ YAP",
                    style: TextStyle(
                        fontFamily: "Myfont",
                        fontSize: 35,
                        color: Color.fromARGB(210, 255, 255, 255))),
              ),
            ),
          ),
          // Alt dikdörtgen ve e-posta, şifre alanları
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35, // Yüksekliği ayarla
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(59.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Şifre'),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                          onPressed: _login,
                          child: Text('Giriş Yap'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Hesabın yok mu?"),
                          SizedBox(height: 10), // Metin ve buton arasına boşluk
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserPage()),
                              );
                            },
                            child: Text('Kayıt Ol'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
