import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/HomeScreens/HomepageAITools.dart';
import 'package:graduation_project/PlantData/PlantManagementDashboard.dart';
import 'package:graduation_project/HomeScreens/chatbot.dart'; // Make sure this import is correct

class HomePageMainWidget extends StatefulWidget {
  const HomePageMainWidget({super.key});

  @override
  State<HomePageMainWidget> createState() => _HomePageMainWidgetState();
}

class _HomePageMainWidgetState extends State<HomePageMainWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.network(
              'https://images.unsplash.com/photo-1545830790-68595959c491?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8ZmFybWVyfGVufDB8fHx8MTc0MzgwNjYzMHww&ixlib=rb-4.0.3&q=80&w=1080',
              width: 45,
              height: 45,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Text(
              'Hello Chiong!',
              style: GoogleFonts.enriqueta(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF026500),
                fontSize: 26,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 10),
            child: Icon(
              Icons.notifications_rounded,
              color: const Color(0xFF0AAD0A),
              size: 30,
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            Padding(
               padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle: GoogleFonts.inter(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFCCF1CC),
                ),
                style: GoogleFonts.inter(),
                cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),

            // Crop Care / AI Tools Toggle
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xFFCCF1CC),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0AAD0A),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(
                            'Crop Care',
                            style: GoogleFonts.enriqueta(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomepageAITools()),
                          );
                        },
                        child: Container(
                          height: 54,
                          decoration: BoxDecoration(
                            color: const Color(0xFFCCF1CC),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              'AI Tools',
                              style: GoogleFonts.enriqueta(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF026500),
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

            // Crop Cards Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              padding: const EdgeInsets.all(16),
              children: [
                _buildCropCard(
                  imageUrl: 'https://images.unsplash.com/photo-1582284540020-8acbe03f4924?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHx0b21hdG98ZW58MHx8fHwxNzQzNzc5ODUxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                  name: 'Tomato',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlantManagementdashboardWidget(),
                      ),
                    );
                  },
                ),
                _buildCropCard(
                  imageUrl: 'https://images.unsplash.com/photo-1518977676601-b53f82aba655?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxwb3RhdG98ZW58MHx8fHwxNzQzNzc5OTQzfDA&ixlib=rb-4.0.3&q=80&w=1080',
                  name: 'Potato',
                ),
                _buildCropCard(
                  imageUrl: 'https://images.unsplash.com/photo-1449300079323-02e209d9d3a6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxDdWN1bWJlcnxlbnwwfHx8fDE3NDM3ODA1MzF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                  name: 'Cucumber',
                ),
                _buildCropCard(
                  imageUrl: 'https://images.unsplash.com/photo-1590868309235-ea34bed7bd7f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8VmVnZXRhYmxlcyUyMHxlbnwwfHx8fDE3NDM3ODA1Njh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                  name: 'Carrot',
                ),
                _buildCropCard(
                  imageUrl: 'https://images.unsplash.com/photo-1560252030-9fc63cb78dac?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw4fHxiZWFuc3xlbnwwfHx8fDE3NDM4OTgzODB8MA&ixlib=rb-4.0.3&q=80&w=1080',
                  name: 'Beans',
                ),
                _buildCropCard(
                  imageUrl: 'https://images.unsplash.com/photo-1608737637507-9aaeb9f4bf30?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8cGVwcGVyfGVufDB8fHx8MTc0Mzg5ODQ2NXww&ixlib=rb-4.0.3&q=80&w=1080',
                  name: 'Pepper',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCropCard({
    required String imageUrl,
    required String name,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                name,
                style: GoogleFonts.interTight(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}