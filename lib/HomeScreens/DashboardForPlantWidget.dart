import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlantDashboardWidget extends StatelessWidget {
  const PlantDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF026500),
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Dashboard',
          style: GoogleFonts.interTight(
            color: const Color(0xFF026500),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
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

            // Plant stats
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // First row of stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatCard('Temperature °C', '21%'),
                        _buildStatCard('Soil moisture %', '78%'),
                      ],
                    ),

                    // Second row of stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatCard('Humidity %', '25%'),
                        _buildStatCard('Rain Fall %', '8%'),
                      ],
                    ),

                    // Single wide stat card
                    _buildStatCard('Soil moisture Status', 'wet', width: 241),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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