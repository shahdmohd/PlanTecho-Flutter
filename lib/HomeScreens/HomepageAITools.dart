import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/HomeScreens/home_page_main.dart'; // Import your home page widget

class HomepageAITools extends StatefulWidget {
  const HomepageAITools({super.key});

  @override
  State<HomepageAITools> createState() => _HomepageAITools();
}

class _HomepageAITools extends State<HomepageAITools> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF0AAD0A),
            size: 30,
          ),
          // Here's the fix: Navigate directly to HomePageMainWidget and clear navigation stack
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePageMainWidget()),
              (Route<dynamic> route) => false, // Remove all previous routes
            );
          },
        ),
        title: Text(
          'AI Tools',
          style: GoogleFonts.enriqueta(
            color: const Color(0xFF026500),
            fontWeight: FontWeight.bold,
            fontSize: isSmallScreen ? 20 : 24,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 16 : 32,
              vertical: 16,
            ),
            child: Column(
              children: [
                // Top segmented control
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(maxWidth: 500),
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCCF1CC),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          // Here's the fix: Navigate directly to HomePageMainWidget
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => const HomePageMainWidget()),
                              (Route<dynamic> route) => false, // Remove all previous routes
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Center(
                              child: Text(
                                'Crop Care',
                                style: GoogleFonts.enriqueta(
                                  color: const Color(0xFF026500),
                                  fontWeight: FontWeight.bold,
                                  fontSize: isSmallScreen ? 16 : 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF0AAD0A),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              'AI Tools',
                              style: GoogleFonts.enriqueta(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: isSmallScreen ? 16 : 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: isSmallScreen ? 30 : 40),
                
                // AI Tools cards
                LayoutBuilder(
                  builder: (context, constraints) {
                    final cardSize = constraints.maxWidth * 0.4;
                    return Wrap(
                      spacing: isSmallScreen ? 16 : 32,
                      runSpacing: 32,
                      alignment: WrapAlignment.center,
                      children: [
                        _buildAIToolCard(
                          size: cardSize,
                          imageAsset: 'assets/images/chatbot.png',
                          label: 'ChatBot',
                          onPressed: () {
                            Navigator.pushNamed(context, '/chatbot');
                          },
                        ),
                        _buildAIToolCard(
                          size: cardSize,
                          imageAsset: 'assets/images/disease.png',
                          label: 'Detection',
                          onPressed: () {
                            Navigator.pushNamed(context, '/choose_detection');
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAIToolCard({
    required double size,
    required String imageAsset,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: size,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size * 0.9,
                height: size * 0.9,
                decoration: const BoxDecoration(
                  color: Color(0xFFCEF1CC),
                  shape: BoxShape.circle,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageAsset,
                  width: size * 0.7,
                  height: size * 0.7,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0AAD0A),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                label,
                style: GoogleFonts.interTight(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}