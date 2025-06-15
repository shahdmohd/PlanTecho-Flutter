import 'dart:math';
import 'package:flutter/material.dart';
import 'package:graduation_project/SigningPages/Confirmpopup.dart';
import 'package:graduation_project/SigningPages/Errorpopup.dart';
import 'package:graduation_project/SigningPages/LoginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ConfirmpasswordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/leaves-of-a-plant 2.png'),
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
                      SizedBox(height: 5),
                      Text(
                        'Plant Care assistant',
                        style: TextStyle(
                          fontFamily: 'Enriqueta',
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                          color: Color(0x6B000000),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sign-up',
                        style: TextStyle(
                          fontFamily: 'Enriqueta',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0AAD0A),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                  child: Column(
                    children: [
                      _buildTextField('Username', usernameController),
                      const SizedBox(height: 14),
                      _buildTextField('E-mail', emailController),
                      const SizedBox(height: 14),
                      _buildPasswordField('Password', passwordController),
                      const SizedBox(height: 14),
                      _buildPasswordField('Confirm Password', ConfirmpasswordController),
                      const SizedBox(height: 14),
                      _buildTextField('Phone', mobileController),
                      const SizedBox(height: 26),
                      _buildSignUpButton(context),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                          fontFamily: 'Enriqueta',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF7A7A7A),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            _createPageRoute(LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Enriqueta',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0AAD0A),
                          ),
                        ),
                      ),
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

  Widget _buildTextField(String placeholder, TextEditingController controller) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F5FF),
        borderRadius: BorderRadius.circular(25),
      ),
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String placeholder, TextEditingController controller) {
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
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: placeholder,
                hintStyle: const TextStyle(
                  fontFamily: 'Enriqueta',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7A7A7A),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/visibility_off_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.png',
                width: 24,
                height: 24,
                color: const Color(0xFF7A7A7A),
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0AAD0A), Color(0xFF0AAD0A)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, _createPageRoute(LoginScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(270, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          'Sign-up',
          style: TextStyle(
            fontFamily: 'Enriqueta',
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
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

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}