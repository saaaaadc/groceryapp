import 'package:flutter/material.dart';
import 'package:groceryapp/onboard_screen.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Positioned(
        right: 0.0,
                top: 10.0,
                child: ElevatedButton(
                    child: Text("Skip",style: TextStyle(color: Colors.deepOrangeAccent),),
                onPressed: (){}),
            ),
              Column(
                children: [
                  Expanded(
                    child: OnBoardScreen(),
                  ),
                  Text("Ready to order from your nearest shop?"),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Set your Delivery location",style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Already a Customer ?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

            ],
        ),
      ),
    );
  }
}
