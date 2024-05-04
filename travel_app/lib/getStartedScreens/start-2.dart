import 'package:flutter/material.dart';

class StartPage2 extends StatelessWidget {
  const StartPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/intro2.gif',
            width: 200, // Adjust the width as needed
            height: 200, // Adjust the height as needed
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Uncover Hidden Gems',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Travel Day and Night, we promise you\'ll keep asking for more!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}