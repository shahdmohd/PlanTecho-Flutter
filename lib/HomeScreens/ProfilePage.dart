import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'Profile';
  static const String routePath = '/profile';

  const ProfilePage({super.key});

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
            color: Color(0xFF0AAD0A),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Align(
          alignment: AlignmentDirectional(0, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 60, 0),
            child: Text(
              'Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF026500),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x33000000),
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
            Container(
  width: 90,
  height: 90,
  decoration: BoxDecoration(
    color: const Color(0xFFE8F5E9),
    shape: BoxShape.circle,
    border: Border.all(
      color: const Color(0xFF026500),
      width: 2,
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.all(2),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: CachedNetworkImage(
        imageUrl: 'https://images.unsplash.com/photo-1545830790-68595959c491?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNXx8ZmFybWVyfGVufDB8fHx8MTc0Mzk4NDY4OXww&ixlib=rb-4.0.3&q=80&w=1080',
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF0AAD0A),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.person,
          color: Color(0xFF0AAD0A),
          size: 40,
        ),
      ),
    ),
  ),
),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chiong',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                'chiong@augustin.com',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
              child: Text(
                'Account',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            _buildSettingsItem(
              icon: Icons.person_rounded,
              title: 'Personal Information',
            ),
            _buildSettingsItem(
              icon: Icons.language_outlined,
              title: 'Country',
            ),
            _buildSettingsItem(
              icon: Icons.notifications_none,
              title: 'Notification Settings',
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 16, 0, 0),
              child: Text(
                'General',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            _buildSettingsItem(
              icon: Icons.help_outline_rounded,
              title: 'Support',
            ),
            _buildSettingsItem(
              icon: Icons.privacy_tip_rounded,
              title: 'Terms of Service',
            ),
            _buildSettingsItem(
              icon: Icons.ios_share,
              title: 'Invite Friends',
              iconColor: Colors.grey,
              arrowColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    Color iconColor = const Color(0xFF0AAD0A),
    Color arrowColor = const Color(0xFF0AAD0A),
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3416202A),
              offset: Offset(0.0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: arrowColor,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}