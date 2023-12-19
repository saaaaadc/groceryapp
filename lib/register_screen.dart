import 'package:flutter/material.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(image: AssetImage("images/home-page-161.png")),
            TextField(),
            TextField(),
            TextField(),
            TextField()
          ],

        ),
      ),
    );
  }
}
