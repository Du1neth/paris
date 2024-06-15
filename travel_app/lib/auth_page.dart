import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/home_page.dart';
import 'package:travel_app/login1.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //user is logged in
          if (snapshot.hasData){
            return const HomePage(selectedPreferences: [],);
          }
          //user is not logged in
          else{
            return const LoginPage();
          }
        }
      ),
    );
  }
}