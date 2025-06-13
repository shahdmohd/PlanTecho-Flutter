import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = 'Profile';
  static const String routePath = '/profile';

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          child: Image.asset(
                            'assets/images/Farmer.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
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
                            'Gomaa',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Gomaa@gmail.com',
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
            icon: 'assets/icons/person_26dp_9EEF9E_FILL0_wght0_GRAD0_opsz24 1.png', // Updated to use your custom icon
            title: 'Personal Information',
          ),
          _buildSettingsItem(
            icon: 'assets/icons/language_24dp_48752C_FILL0_wght400_GRAD0_opsz24.png', // Updated to use your custom icon
            title: 'Country',
          ),
          _buildSettingsItem(
            icon: 'assets/icons/notifications_24dp_48752C_FILL0_wght400_GRAD0_opsz24.png', // Updated to use your custom icon
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
            icon: 'assets/icons/contact_support_24dp_48752C_FILL0_wght400_GRAD0_opsz24.png', // Updated to use your custom icon
            title: 'Support',
          ),
          _buildSettingsItem(
            icon: 'assets/icons/privacy_tip_24dp_48752C_FILL0_wght400_GRAD0_opsz24.png', // Updated to use your custom icon
            title: 'Terms of Service',
          ),
          _buildSettingsItem(
            icon: 'assets/icons/ios_share_24dp_48752C_FILL0_wght400_GRAD0_opsz24.png', // Updated to use your custom icon
            title: 'Invite Friends',
            iconColor: Colors.grey,
            arrowColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required String icon, // Changed from IconData to String for asset path
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
              Image.asset(
                icon,
                width: 24,
                height: 24,
                color: iconColor,
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
              Image.asset(
                'assets/icons/arrow_forward_ios_24dp_48752C_FILL0_wght400_GRAD0_opsz24.png', // Using your custom arrow icon
                width: 18,
                height: 18,
                color: arrowColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}