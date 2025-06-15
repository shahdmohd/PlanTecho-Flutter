import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CVNavigationScreen extends StatelessWidget {
  final Uri _cvModelUri = Uri.parse('http://192.168.1.7:5000/');


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
          child: Text("Start Live Detection"),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class CVModelWebView extends StatefulWidget {
//   @override
//   _CVModelWebViewState createState() => _CVModelWebViewState();
// }

// class _CVModelWebViewState extends State<CVModelWebView> {
//   late final WebViewController controller;
//   final String cvModelUrl = 'http://192.168.1.7:5000/';

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar if needed
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//         ),
//       )
//       ..loadRequest(Uri.parse(cvModelUrl));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('CV Model')),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }