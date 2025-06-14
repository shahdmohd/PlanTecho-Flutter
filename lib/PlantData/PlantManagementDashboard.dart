import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/PlantData/EditPlant.dart';

class PlantManagementdashboardWidget extends StatefulWidget {
  const PlantManagementdashboardWidget({super.key});

  @override
  State<PlantManagementdashboardWidget> createState() =>
      _PlantManagementdashboardWidgetState();
}

class _PlantManagementdashboardWidgetState
    extends State<PlantManagementdashboardWidget> {
  @override
  Widget build(BuildContext context) {
    Widget getCustomIcon(String assetPath, {double size = 24, Color? color}) {
      return ImageIcon(
        AssetImage(assetPath),
        size: size,
        color: color,
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: getCustomIcon(
            'assets/icons/arrow_back.png',
            size: 30,
            color: const Color(0xFF0AAD0A),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [],
        centerTitle: false,
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Plant Image and Name
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: 390,
                  height: 205,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              'https://images.unsplash.com/photo-1582284540020-8acbe03f4924?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHx0b21hdG98ZW58MHx8fHwxNzQzOTY0MTc3fDA&ixlib=rb-4.0.3&q=80&w=1080',
                              width: 136,
                              height: 128,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 113,
                            top: 100,
                            child: getCustomIcon(
                              'assets/icons/edit_24dp_48752C_FILL0_wght400_GRAD0_opsz24.png', // Replace with your edit icon asset
                              size: 24,
                              color: const Color(0xFF026500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Tomato',
                        style: GoogleFonts.enriqueta(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF026500),
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Plant Stats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: 390,
                  height: 205,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatRow('Temperature:', '21%'),
                      const SizedBox(height: 15),
                      _buildStatRow('Soil moisture %:', '78%'),
                      const SizedBox(height: 15),
                      _buildStatRow('Humidity %:', '25%'),
                      const SizedBox(height: 15),
                      _buildStatRow('Water Status:', 'Wet'),
                    ],
                  ),
                ),
              ),

              // Action Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: 394.4,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        customIcon: getCustomIcon(
                          'assets/icons/edit_24dp_48752C_FILL0_wght400_GRAD0_opsz24.png',
                          color: Colors.white,
                        ),
                        label: 'Edit',
                        color: const Color(0xFF0AAD0A),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditPlant()),
                          );
                        },
                      ),
                      _buildActionButton(
                        customIcon: getCustomIcon(
                          'assets/icons/delete_24dp_FFFFFFFF_FILL1_wght600_GRAD0_opsz24 1.png',
                          color: Colors.white,
                        ),
                        label: 'Delete',
                        color: const Color(0xFFFC0307),
                        onPressed: () => _showDeleteConfirmation(context),
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

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: DeleteConfirmationPopup(
            onConfirm: () {
              Navigator.pop(context); // Close the dialog
              // Add your delete logic here
              Navigator.pop(context); // Optionally go back after deletion
            },
            onCancel: () => Navigator.pop(context),
          ),
        );
      },
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: GoogleFonts.enriqueta(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: GoogleFonts.enriqueta(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required Widget customIcon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(105, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      icon: customIcon,
      label: Text(
        label,
        style: GoogleFonts.interTight(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class DeleteConfirmationPopup extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const DeleteConfirmationPopup({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });

  Widget getCustomIcon(String assetPath, {double size = 24, Color? color}) {
    return ImageIcon(
      AssetImage(assetPath),
      size: size,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFFCCF1CC),
                shape: BoxShape.circle,
              ),
              child: getCustomIcon(
                'assets/icons/warning_48dp_3CB734_FILL0_wght400_GRAD0_opsz48.png', // Replace with your warning icon asset
                size: 35,
                color: const Color(0xFF0AAD0A),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Text(
              'Are you sure you want to delete all information about this plant?',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0AAD0A),
                    minimumSize: const Size(105, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  child: Text(
                    'Yes',
                    style: GoogleFonts.interTight(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6D6161),
                    minimumSize: const Size(105, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  child: Text(
                    'No',
                    style: GoogleFonts.interTight(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}