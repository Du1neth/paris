import 'package:flutter/material.dart';

class StartPage1 extends StatelessWidget {
  const StartPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/intro1.gif',
            width: 200, // Adjust the width as needed
            height: 200, // Adjust the height as needed
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Discover Paris',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Explore the enchanting city of Paris, known for its iconic landmarks, exquisite cuisine, and rich history.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
