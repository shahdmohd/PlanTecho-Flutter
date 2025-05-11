// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:graduation_project/SigningPages/Confirmpopup.dart';
import 'package:graduation_project/SigningPages/Errorpopup.dart';
import 'package:graduation_project/SigningPages/SignUp.dart';
import 'package:graduation_project/SigningPages/VerificationScreen.dart';
import 'package:graduation_project/SigningPages/ForgetPassword.dart'; // Import the ForgetPassword widget

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false; // State variable for password visibility

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 71),
                  // Logo and Title Section
                  const Column(
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/images/leaves-of-a-plant 2.png',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'PlanTecho',
                        style: TextStyle(
                          fontFamily: 'Enriqueta',
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0AAD0A),
                        ),
                      ),
                      Text(
                        'Plant Care assistant',
                        style: TextStyle(
                          fontFamily: 'Enriqueta',
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Color(0x6B000000),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Sign-in',
                        style: TextStyle(
                          fontFamily: 'Enriqueta',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0AAD0A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // Input Fields
                  Column(
                    children: [
                      _buildTextField('Email', usernameController),
                      const SizedBox(height: 15),
                      _buildPasswordField('Password', passwordController),
                      const SizedBox(height: 15),
                      const SizedBox(height: 20),
                      // Sign In Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            _createPageRoute(SignUpScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0AAD0A),
                          minimumSize: const Size(270, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontFamily: 'Enriqueta',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Forget Password
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            _createPageRoute(ForgetPasswordWidget()), // Use the ForgetPasswordWidget here
                          );
                        },
                        child: const Text(
                          'Forget password ?',
                          style: TextStyle(
                            fontFamily: 'Enriqueta',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF7A7A7A),
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
                      // Sign Up Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontFamily: 'Enriqueta',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF7A7A7A),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // navigate to sign up page (sign-up button)
                              Navigator.push(
                                context,
                                _createPageRoute(SignUpScreen()),
                              );
                            },
                            child: const Text(
                              'Sign-up',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0AAD0A),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String placeholder, TextEditingController controller) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F5FF),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontFamily: 'Enriqueta',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7A7A7A),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    String placeholder,
    TextEditingController controller,
  ) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F5FF),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: !isPasswordVisible, // Toggle obscureText
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: const TextStyle(
                  fontFamily: 'Enriqueta',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7A7A7A),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: const Color(0xFF7A7A7A),
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
        ],
      ),
    );
  }

  PageRouteBuilder _createPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  void _showDoneDialog(BuildContext context, String Ti, String message) {
    bool dialogOpen = true;

    // Show the dialog
    showDialog(
      context: context,
      builder: (context) => Confirmpopup(title: Ti, description: message),
    ).then((_) {
      // When the dialog is dismissed manually, set dialogOpen to false
      dialogOpen = false;
    });

    // Dismiss the dialog automatically after 2.5 seconds
    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      if (dialogOpen) {
        Navigator.of(context).pop(); // Dismiss the dialog only if still open
      }
    });
  }
}