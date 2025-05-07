import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBotWidget extends StatefulWidget {
  const ChatBotWidget({super.key});

  @override
  State<ChatBotWidget> createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF026500)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'AI Tools',
          style: GoogleFonts.enriqueta(
            color: const Color(0xFF026500),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
                      GestureDetector(
                        onTap: () {
                          // Optionally navigate back to home
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 175,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              'Crop Care',
                              style: GoogleFonts.enriqueta(
                                color: const Color(0xFF026500),
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
                        child: Center(
                          child: Text(
                            'AI Tools',
                            style: GoogleFonts.enriqueta(
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
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAIToolCard(
                        imageAsset: 'assets/images/chatbot.png',
                        label: 'ChatBot',
                        onPressed: () {
                          // Handle ChatBot button press
                        },
                      ),
                      _buildAIToolCard(
                        imageAsset: 'assets/images/disease.png',
                        label: 'Detection',
                        onPressed: () {
                          // Handle Detection button press
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAIToolCard({
    required String imageAsset,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
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
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageAsset,
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
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0AAD0A),
            minimumSize: const Size(160.7, 39),
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
      ],
    );
  }
}