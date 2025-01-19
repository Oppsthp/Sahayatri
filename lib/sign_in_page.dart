import 'package:flutter/material.dart';
import 'dart:math';
import 'sign_up_page.dart'; // Import the Sign-Up page

List<Widget> generateRandomBubbles() {
  final random = Random();
  final List<Widget> bubbles = [];
  for (int i = 0; i < 20; i++) { // Adjust the number of bubbles
    final size = random.nextDouble() * 50 + 20; // Random size between 20 and 70
    final topPosition = random.nextDouble() * 700; // Random top position
    final leftPosition = random.nextDouble() * 400; // Random left position
    bubbles.add(Positioned(
      top: topPosition,
      left: leftPosition,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.6), // Purple color with slight transparency
          shape: BoxShape.circle,
        ),
      ),
    ));
  }
  return bubbles;
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // Function to handle sign-in
  void _signIn() async {
    setState(() => _isLoading = true);
    try {
      // Mock success response for demo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Failed: $error')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,  // Disable resizing of the layout when the keyboard appears
      backgroundColor: Colors.deepPurple[50], // Lighter purple background
      body: Stack(
        children: [
          ...generateRandomBubbles(),
          // Background decoration with a darker purple
          Positioned(
            top: -380,
            left: -231,
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Dark purple background
                borderRadius: BorderRadius.circular(350),
              ),
            ),
          ),
          Positioned(
            bottom: -125,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.purpleAccent[400],
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create\nAccount',
                  style: TextStyle(
                    height: 1.2,
                    fontFamily: 'Preahvihear',
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 100),

                // Email input field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Your Email',
                    filled: true,
                    fillColor: Colors.deepPurple[100], // Light purple field color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password input field
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.deepPurple[100], // Light purple field color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Sign-In button with purple color
                ElevatedButton(
                  onPressed: _isLoading ? null : _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Purple button
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 100),

                // Navigate to Sign-Up
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
