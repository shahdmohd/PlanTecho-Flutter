import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class DeletePlant extends StatefulWidget {
  @override
  _DeletePlant createState() => _DeletePlant();
}

class _DeletePlant extends State<DeletePlant> {
  VideoPlayerController? _controller;
  final String baseUrl = ' http://127.0.0.1:5000'; // <-- CHANGE THIS

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('$baseUrl/video_feed')
      ..initialize().then((_) {
        setState(() {});
        _controller!.play();
        _controller!.setLooping(true);
      });
  }

  Future<void> startCamera() async {
    await http.post(Uri.parse('$baseUrl/start_camera'));
  }

  Future<void> stopCamera() async {
    await http.post(Uri.parse('$baseUrl/stop_camera'));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plant Detection')),
      body: Column(
        children: [
          if (_controller != null && _controller!.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller!.value.aspectRatio,
              child: VideoPlayer(_controller!),
            )
          else
            Center(child: CircularProgressIndicator()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: startCamera,
                child: Text('Start Camera'),
              ),
              ElevatedButton(
                onPressed: stopCamera,
                child: Text('Stop Camera'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
