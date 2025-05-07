import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart'; // Updated import
import 'dart:isolate';
import 'dart:io';

class LiveDetectionScreen extends StatefulWidget {
  const LiveDetectionScreen({Key? key}) : super(key: key);

  @override
  State<LiveDetectionScreen> createState() => _LiveDetectionScreenState();
}

class _LiveDetectionScreenState extends State<LiveDetectionScreen> {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  bool isDetecting = false;
  List<dynamic> recognitions = [];
  Interpreter? interpreter;
  
  @override
  void initState() {
    super.initState();
    initCamera();
    loadModel();
  }

  @override
  void dispose() {
    cameraController.dispose();
    if (interpreter != null) {
      interpreter!.close();
    }
    super.dispose();
  }

  // Initialize camera
  void initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await cameraController.initialize();
    if (!mounted) return;
    
    setState(() {});
    
    cameraController.startImageStream((image) {
      if (!isDetecting) {
        isDetecting = true;
        detectObjectsOnFrame(image);
      }
    });
  }

  // Load the TFLite model
  Future<void> loadModel() async {
    try {
      // Load model from assets
      interpreter = await Interpreter.fromAsset('assets/models/best.tflite');
      print('TFLite model loaded successfully');
    } catch (e) {
      print('Error loading TFLite model: $e');
    }
  }

  // Process each frame for object detection
  Future<void> detectObjectsOnFrame(CameraImage image) async {
    try {
      // Here you would convert your CameraImage to the format expected by your model
      // This is a simplified example - you'll need to implement proper image processing
      
      // Example pseudo-code for detection
      // final input = prepareInput(image);
      // final output = runInference(input);
      // final results = processOutput(output);
      
      // For now, just simulate detection results
      await Future.delayed(const Duration(milliseconds: 100));
      
      setState(() {
        recognitions = [
          {'label': 'Sample detection', 'confidence': 0.85}
        ];
        isDetecting = false;
      });
    } catch (e) {
      print('Error during object detection: $e');
      isDetecting = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Detection'),
      ),
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(cameraController),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            color: Colors.black54,
            child: ListView(
              children: recognitions.map((result) {
                return ListTile(
                  title: Text(
                    '${result['label']} (${(result['confidence'] * 100).toStringAsFixed(0)}%)',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}