import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import your other pages if needed
// Make sure the chatbot and detection pages are added in your project
// and registered in main.dart routes
// import 'detection_page.dart';

class HomepageAITools extends StatefulWidget {
  const HomepageAITools({super.key});

  static const String routeName = '/homepageAITools';

  @override
  State<HomepageAITools> createState() => _HomepageAIToolsState();
}

class _HomepageAIToolsState extends State<HomepageAITools> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Color(0xFF0AAD0A),
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                    width: 350,
                    height: 54.8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFCCF1CC),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.pushNamed(context, '/home');
                          },
                          child: Container(
                            width: 175,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Center(
                              child: Text(
                                'Crop Care',
                                style: TextStyle(
                                  fontFamily: 'Enriqueta',
                                  color: Color(0xFF026500),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 170.8,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0AAD0A),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Center(
                            child: Text(
                              'AI Tools',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Enriqueta',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 328.7,
                  height: 400.8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Chat Bot Section
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 146.91,
                                  height: 146.91,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFCEF1CC),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/chatbot_1.png',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/chatbot');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0AAD0A),
                                minimumSize: const Size(111, 53),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Chat Bot',
                                style: GoogleFonts.interTight(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Detection Section
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 146.91,
                                  height: 146.91,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFCEF1CC),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 15),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/images/disease_1.png',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/detection');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0AAD0A),
                                minimumSize: const Size(111, 53),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Detection',
                                style: GoogleFonts.interTight(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
