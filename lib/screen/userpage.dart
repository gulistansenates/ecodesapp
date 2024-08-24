import 'package:ekodlariapp/screen/login.dart';
import 'package:ekodlariapp/screen/userloginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print("Kayıt başarılı");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      print("Kayıt başarısız");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Kayıt başarısız")),
      );
    }
  }

  void _navigateToUserLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color.fromARGB(243, 123, 173, 220),
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
                child: Text("KAYIT OL",
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
                          onPressed: _register,
                          child: Text('Kayıt Ol'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Zaten bir hesabın var mı?"),
                          SizedBox(width: 20),
                          TextButton(
                            onPressed: _navigateToUserLoginPage,
                            child: Text('Giriş Yap'),
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

void main() {
  runApp(MaterialApp(
    home: UserPage(),
  ));
}
