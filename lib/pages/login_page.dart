import 'package:flutter/material.dart';
import 'package:latkuis_124230037/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  bool isLoginSuccess = false;
  String errorMessage = "";

  void _login() {
    String username = usernameC.text;
    String password = passwordC.text;
    String text = "";

    if (password == '123') {
      setState(() {
        text = "Login Berhasil";
        isLoginSuccess = true;
        errorMessage = "";
      });
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context){
          return HomePage(username: username,);
        }),
      );
    } else {
      setState(() {
        text = "Login Gagal";
        isLoginSuccess = false;
        errorMessage = "Username / Password salah";
      });
    }

    SnackBar snackBar = SnackBar(
      content: Text(text),
      backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF02182B), 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            color: Color(0xFF0D2538),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            shadowColor: Color(0xFFD7263D),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                      child: Text(
                        errorMessage,
                        style: const TextStyle(
                          color: Color(0xFFD7263D), 
                        ),
                      ),
                    ),
                  const Icon(
                    Icons.movie,
                    size: 80,
                    color: Color(0xFFD7263D), 
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white70, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: usernameC,
                    style: const TextStyle(
                      color: Colors.white, 
                    ),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person_2_outlined, color: Colors.white70,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.white70, 
                        width: 1.5,
                        ),
                      ),
                      labelStyle: const TextStyle(color: Colors.white70),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: const Color(0xFFD7263D), 
                          width: 2,
                        ),
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Colors.white70, 
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: passwordC,
                    style: const TextStyle(
                      color: Colors.white, 
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                      suffix: Icon(Icons.remove_red_eye_outlined, color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.white70, 
                        width: 1.5,
                        ),
                      ),
                      labelStyle: const TextStyle(color: Colors.white70),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: const Color(0xFFD7263D), 
                          width: 2,
                        ),
                      ),
                      floatingLabelStyle: TextStyle(
                        color: Colors.white70, 
                      ),
                      
                    ),
                    
                    
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFD7263D),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: _login,
                    child: const Text('Login', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}