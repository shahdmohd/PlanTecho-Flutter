// lib/screens/detection_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../TFLiteHelper.dart';

class DetectionScreen extends StatefulWidget {
  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  File? _image;
  List? _recognitions;

  @override
  void initState() {
    super.initState();
    TFLiteHelper.loadModel();
  }

  @override
  void dispose() {
    TFLiteHelper.disposeModel();
    super.dispose();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery); // or .camera
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
        _recognitions = null;
      });

      var results = await TFLiteHelper.detectImage(picked.path);
      setState(() {
        _recognitions = results;
      });
    }
  }

  Widget buildResults() {
    if (_recognitions == null) return Text("No detection yet.");
    if (_recognitions!.isEmpty) return Text("No objects detected.");

    return Column(
      children: _recognitions!.map((res) {
        return Text(
          "Detected: ${res['detectedClass']} - ${(res['confidenceInClass'] * 100).toStringAsFixed(2)}%",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plant Disease Detector')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _image != null
                ? Image.file(_image!, height: 200)
                : Placeholder(fallbackHeight: 200),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: pickImage,
              child: Text("Pick Image"),
            ),
            const SizedBox(height: 16),
            buildResults(),
          ],
        ),
      ),
    );
  }
}
