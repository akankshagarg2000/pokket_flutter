import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokket_final/screens/servicesHome.dart';
import 'package:pokket_final/screens/welcome.dart';

void main() => runApp(Pokket());

class Pokket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      home :  WelcomeScreen() ,
    //   routes: {
    //     'welcome_screen': (context) => WelcomeScreen(),
    //     'login_screen': (context) => LoginScreen(),
    //     'registration_screen': (context) => RegistrationScreen(),
    // // 'welcome_screen': (context) => ChatScreen(),
    //
    // },

    );
  }
}
