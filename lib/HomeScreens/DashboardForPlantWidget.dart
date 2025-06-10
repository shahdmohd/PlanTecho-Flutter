import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantDashboardWidget extends StatelessWidget {
  const PlantDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Completely remove AppBar and rely on the page's own title handling
      appBar: null,
      body: SafeArea(
        child: Column(
          children: [
            // Top spacing - without any back button or header elements
            SizedBox(height: 16),
            
            // Plant selector and image
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dropdown menu
                  Container(
                    width: 250,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFCCF1CC),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: 'Tomato',
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: ['Tomato', 'Option 2', 'Option 3'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                  
                  // Plant image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1582284540020-8acbe03f4924?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxUb21hdG98ZW58MHx8fHwxNzQ0MTQ3MTc4fDA&ixlib=rb-4.0.3&q=80&w=1080',
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            // Plant stats - wrapped in Expanded + SingleChildScrollView
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80), // Added bottom padding for navbar
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 10), // Top spacing
                      // First row of stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatCard('Temperature °C', '21%'),
                          _buildStatCard('Soil moisture %', '78%'),
                        ],
                      ),
                      const SizedBox(height: 15), // Spacing between rows

                      // Second row of stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatCard('Humidity %', '25%'),
                          _buildStatCard('Rain Fall %', '8%'),
                        ],
                      ),
                      const SizedBox(height: 15), // Spacing between rows

                      // Single wide stat card
                      Center(child: _buildStatCard('Soil moisture Status', 'wet', width: 241)),
                      const SizedBox(height: 15), // Bottom spacing
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Important: Set bottomNavigationBar to null to let parent widget handle navigation
      // This prevents duplicate navigation bars
      bottomNavigationBar: null,
    );
  }

  Widget _buildStatCard(String title, String value, {double? width}) {
    return Container(
      width: width ?? 150,
      height: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFCCF1CC),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: GoogleFonts.enriqueta(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.enriqueta(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}