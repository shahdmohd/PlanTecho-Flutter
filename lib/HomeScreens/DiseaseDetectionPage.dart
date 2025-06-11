import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/HomeScreens/home_page_main.dart'; // Import your home page widget

class DiseaseDetectionPage extends StatefulWidget {
  const DiseaseDetectionPage({super.key});

  @override
  State<DiseaseDetectionPage> createState() => _DiseaseDetectionPageState();
}

class _DiseaseDetectionPageState extends State<DiseaseDetectionPage> {
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
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePageMainWidget()),
              (Route<dynamic> route) => false, // Remove all previous routes
            );
          },
        ),
        title: Text(
          'Disease Detection',
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
                              'Plant Health',
                              style: GoogleFonts.enriqueta(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: isSmallScreen ? 14 : 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: isSmallScreen ? 40 : 60),
                
                // Header text
                Text(
                  'Detect Plant Diseases',
                  style: GoogleFonts.enriqueta(
                    color: const Color(0xFF026500),
                    fontWeight: FontWeight.bold,
                    fontSize: isSmallScreen ? 24 : 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 16),
                
                Text(
                  'Use our AI-powered detection to identify diseases and get treatment recommendations for your crops',
                  style: GoogleFonts.inter(
                    color: Colors.grey[600],
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: isSmallScreen ? 40 : 60),
                
                // Detection options
                Column(
                  children: [
                    _buildDetectionCard(
                      context: context,
                      icon: Icons.camera_alt_rounded,
                      title: 'Camera Detection',
                      subtitle: 'Take a photo to detect diseases instantly',
                      color: const Color(0xFF0AAD0A),
                      onPressed: () {
                        Navigator.pushNamed(context, '/choose_detection');
                      },
                    ),
                    
                    SizedBox(height: 24),
                    
                    _buildDetectionCard(
                      context: context,
                      icon: Icons.photo_library_rounded,
                      title: 'Gallery Detection',
                      subtitle: 'Upload an existing photo from your gallery',
                      color: const Color(0xFF26A69A),
                      onPressed: () {
                        Navigator.pushNamed(context, '/choose_detection');
                      },
                    ),
                    
                    SizedBox(height: 24),
                    
                    _buildDetectionCard(
                      context: context,
                      icon: Icons.history_rounded,
                      title: 'Detection History',
                      subtitle: 'View your previous detection results',
                      color: const Color(0xFF66BB6A),
                      onPressed: () {
                        // Navigate to history page
                        // Navigator.pushNamed(context, '/detection_history');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetectionCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 400),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 30,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.enriqueta(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xFF026500),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}