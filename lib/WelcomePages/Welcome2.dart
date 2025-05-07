import 'package:flutter/material.dart';

class WelcomescreenInfectedPlant extends StatelessWidget {
  const WelcomescreenInfectedPlant({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Texts
                const Text(
                  'Detecting Plant Diseases',
                  style: TextStyle(
                    fontFamily: 'Enriqueta',
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.35,
                    color: Color(0xFF0AAD0A),
                  ),
                ),
                const SizedBox(height: 30),
                // Chat bot image with circle
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.55,
                      height: screenWidth * 0.55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF79FE77).withOpacity(0.2),
                      ),
                    ),
                    Image.asset(
                      'assets/images/disease.png',
                      width: screenWidth * 0.5,
                      height: screenWidth * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Dots indicator
                // Container(
                //   width: screenWidth * 0.2,
                //   height: 10,
                //   alignment: Alignment.center,
                //   child: Image.network(
                //       'https://dashboard.codeparrot.ai/api/assets/Z18pjJs-923gCQmF'),
                // ),
                const SizedBox(height: 30),
                // Next button
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/welcome3');
                    },
                    child: Container(
                      width: screenWidth * 0.75,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Color(0xFF0AAD0A),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontFamily: 'Enriqueta',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
