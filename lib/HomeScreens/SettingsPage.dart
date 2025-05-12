import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF026500),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0AAD0A)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please evaluate your options below.',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            
            _buildSectionTitle('Account'),
            _buildSettingsItem(
              icon: Icons.subscriptions,
              title: 'My Subscription',
            ),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: 'Getting Started',
            ),
            
            const SizedBox(height: 24),
            _buildSectionTitle('About'),
            _buildSettingsItem(
              icon: Icons.info_outline,
              title: 'About Us',
            ),
            _buildSettingsItem(
              icon: Icons.help_center_outlined,
              title: 'Help',
            ),
            
            const SizedBox(height: 24),
            _buildSectionTitle('Legal'),
            _buildSettingsItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
            ),
            _buildSettingsItem(
              icon: Icons.description_outlined,
              title: 'Terms & Conditions',
            ),
            
            const SizedBox(height: 24),
            _buildSectionTitle('Social'),
            _buildSocialRow(),
            
            const SizedBox(height: 24),
            Center(
              child: Text(
                'App Version v0.0.1',
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.logout, color: Colors.white),
                label: Text(
                  'Log Out',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0AAD0A),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Add logout functionality
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF026500),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0AAD0A)),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Add navigation functionality for each item
      },
    );
  }

  Widget _buildSocialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.facebook, size: 32, color: Color(0xFF0AAD0A)),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: Image.asset('assets/images/twitter.png', width: 32, height: 32),
          onPressed: () {},
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: Image.asset('assets/images/instagram.png', width: 32, height: 32),
          onPressed: () {},
        ),
      ],
    );
  }
}