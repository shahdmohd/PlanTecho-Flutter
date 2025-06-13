import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CVNavigationScreen extends StatelessWidget {
  final Uri _cvModelUri = Uri.parse('http://127.0.0.1:5000/');

  Future<void> _launchCVModel() async {
    if (await canLaunchUrl(_cvModelUri)) {
      await launchUrl(_cvModelUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $_cvModelUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Start Live Detection")),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchCVModel,
          child: Text("Click"),
        ),
      ),
    );
  }
}