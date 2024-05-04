import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/home_page.dart';
import 'package:travel_app/login1.dart';

class RegisterNow extends StatefulWidget {
  const RegisterNow({Key? key});

  @override
  State<RegisterNow> createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.waving_hand_outlined,
                  size: 100,
                ),
                SizedBox(height: 25),
                Text(
                  'Join Us!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Create an account to get started!',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 50),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'User Name',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Select Gender',
                    ),
                    items: ['Male', 'Female']
                        .map((gender) => DropdownMenuItem(
                          child: Text(gender),
                          value: gender,
                        ))
                        .toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: _signIn, // Call _signIn when the button is tapped
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    // Check if any field is empty
    if (_userNameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty ||
        _selectedGender == null) {
      // Show error dialog for empty fields
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all fields.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close error dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return; // Exit the method if any field is empty
    }

    // Check if passwords match
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      // Show error dialog for mismatched passwords
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Passwords do not match.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close error dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return; // Exit the method if passwords don't match
    }

    // Show loading dialog
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Create user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Close loading dialog
      Navigator.pop(context);

      // Navigate to the Home screen after successful sign up
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle sign up errors
      String errorMessage = '';

      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'An error occurred. Please try again later.';
      }

      Navigator.pop(context);

      // Show error dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
