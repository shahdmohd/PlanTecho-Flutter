import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart'; // Updated import
import 'dart:isolate';
import 'dart:io';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class LiveDetectionScreen extends StatefulWidget {
  const LiveDetectionScreen({Key? key}) : super(key: key);

  @override
  State<LiveDetectionScreen> createState() => _LiveDetectionScreenState();
}

class _LiveDetectionScreenState extends State<LiveDetectionScreen> with WidgetsBindingObserver {
  CameraController? cameraController;
  List<CameraDescription>? cameras;
  bool isDetecting = false;
  List<dynamic> recognitions = [];
  Interpreter? interpreter;
  bool _cameraPermissionGranted = false;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _requestCameraPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    cameraController?.dispose();
    interpreter?.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cameraController == null || !_isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      cameraController?.stopImageStream();
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (cameraController != null) {
        _initCameraController(cameraController!.description);
      }
    }
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _cameraPermissionGranted = status == PermissionStatus.granted;
    });

    if (_cameraPermissionGranted) {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    try {
      cameras = await availableCameras();
      if (cameras!.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('No Camera Found'),
            content: const Text('No camera was found on this device.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      await _initCameraController(cameras![0]);
      await loadModel();
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _initCameraController(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController!.dispose();
    }

    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );

    try {
      await cameraController!.initialize();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      print('Error initializing camera controller: $e');
      setState(() {
        _isInitialized = false;
      });
    }
  }

  Future<void> loadModel() async {
    try {
      interpreter = await Interpreter.fromAsset('assets/models/best.tflite');
      print('TFLite model loaded successfully');
    } catch (e) {
      print('Error loading TFLite model: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Model Loading Error'),
          content: Text('Failed to load the TFLite model: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void startDetection() {
    if (cameraController == null || !cameraController!.value.isInitialized) return;

    cameraController!.startImageStream((image) {
      if (!isDetecting) {
        isDetecting = true;
        detectObjectsOnFrame(image);
      }
    });
  }

  Future<void> detectObjectsOnFrame(CameraImage image) async {
    try {
      // Simulate detection delay
      await Future.delayed(const Duration(milliseconds: 100));

      if (mounted) {
        setState(() {
          recognitions = [
            {'label': 'Sample detection', 'confidence': 0.85}
          ];
          isDetecting = false;
        });
      }
    } catch (e) {
      print('Error during object detection: $e');
      isDetecting = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraPermissionGranted) {
      return Scaffold(
        appBar: AppBar(title: const Text('Live Detection')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Camera permission is required for this app'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _requestCameraPermission,
                child: const Text('Request Permission'),
              ),
            ],
          ),
        ),
      );
    }

    if (cameraController == null || !_isInitialized) {
      return Scaffold(
        appBar: AppBar(title: const Text('Live Detection')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Live Detection')),
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(cameraController!),
          ),
          ElevatedButton(
            onPressed: startDetection,
            child: const Text('Start Detecting'),
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
                    style: const TextStyle(color: Colors.white),
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