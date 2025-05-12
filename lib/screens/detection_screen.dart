// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tflite_flutter/tflite_flutter.dart';
// import 'dart:io';
// //import 'package:image/image.dart' as img;
// import 'dart:math';

// class DetectionScreen extends StatefulWidget {
//   const DetectionScreen({Key? key}) : super(key: key);

//   @override
//   _DetectionScreenState createState() => _DetectionScreenState();
// }

// class _DetectionScreenState extends State<DetectionScreen> {
//   bool _isCameraInitialized = false;
//   late CameraController _cameraController;
  
//   // TFLite variables
//   Interpreter? _interpreter;
//   bool _isModelLoaded = false;
//   String _detectionResult = "No detection yet";
//   bool _isDetecting = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadModel();
//   }

//   @override
//   void dispose() {
//     if (_isCameraInitialized) {
//       _cameraController.dispose();
//     }
//     _interpreter?.close();
//     super.dispose();
//   }

//   Future<void> _loadModel() async {
//     try {
//       // Initialize interpreter with custom options
//       final interpreterOptions = InterpreterOptions();
      
//       _interpreter = await Interpreter.fromAsset(
//         'assets/models/model.tflite',
//         options: interpreterOptions,
//       );
      
//       // Inspect model input/output shapes
//       final inputTensors = _interpreter!.getInputTensors();
//       final outputTensors = _interpreter!.getOutputTensors();
      
//       print('Model Input Tensors:');
//       for (var tensor in inputTensors) {
//         print('  Shape: ${tensor.shape}, Type: ${tensor.type}');
//       }
      
//       print('Model Output Tensors:');
//       for (var tensor in outputTensors) {
//         print('  Shape: ${tensor.shape}, Type: ${tensor.type}');
//       }
      
//       setState(() {
//         _isModelLoaded = true;
//       });
//       print('Model loaded successfully');
//     } catch (e) {
//       print('Error loading model: $e');
//     }
//   }

//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     if (cameras.isEmpty) {
//       print("No cameras available");
//       return;
//     }
    
//     // Prefer back camera
//     final firstCamera = cameras.firstWhere(
//       (camera) => camera.lensDirection == CameraLensDirection.back,
//       orElse: () => cameras.first,
//     );
    
//     _cameraController = CameraController(
//       firstCamera,
//       ResolutionPreset.medium,
//       enableAudio: false,
//       imageFormatGroup: ImageFormatGroup.yuv420,
//     );
    
//     try {
//       await _cameraController.initialize();
      
//       // Set up image stream processing
//       _cameraController.startImageStream((CameraImage image) {
//         if (!_isDetecting && _isModelLoaded) {
//           _isDetecting = true;
//           _processImage(image);
//         }
//       });
      
//       setState(() {
//         _isCameraInitialized = true;
//       });
//     } catch (e) {
//       print("Error initializing camera: $e");
//     }
//   }

//   Future<void> _processImage(CameraImage image) async {
//     try {
//       // Get model input shape details
//       final inputShape = _interpreter!.getInputTensor(0).shape;
//       print("Model expects input shape: $inputShape");
      
//       // Convert CameraImage to a format suitable for TFLite
//       final inputData = _prepareInputData(image);
      
//       // Prepare output buffer based on model's output tensor shape
//       final outputTensor = _interpreter!.getOutputTensor(0);
//       final outputShape = outputTensor.shape;
//       print("Model expects output shape: $outputShape");
      
//       // Create output buffer with the correct shape
//       // For your model, it's [1, 11, 3549] based on the error message
//       final outputBuffer = List.filled(outputShape.reduce((a, b) => a * b), 0.0)
//           .reshape(outputShape);
      
//       // Run inference
//       _interpreter!.run(inputData, outputBuffer);
      
//       // Process results
//       final results = _processResults(outputBuffer);
      
//       setState(() {
//         _detectionResult = results;
//         _isDetecting = false;
//       });
//     } catch (e) {
//       print('Error during image processing: $e');
//       setState(() {
//         _detectionResult = "Error: $e";
//         _isDetecting = false;
//       });
//     }
//   }

//   List _prepareInputData(CameraImage image) {
//     try {
//       // Based on the error message, your model expects [1, 1, 416, 416, 3]
//       final int inputWidth = 416;
//       final int inputHeight = 416;
      
//       // Get image dimensions from the camera
//       final int imageWidth = image.width;
//       final int imageHeight = image.height;
      
//       // Create a tensor with the correct shape [1, 1, 416, 416, 3]
//       var inputBuffer = List.filled(1 * 1 * inputWidth * inputHeight * 3, 0.0);
      
//       // Convert YUV to RGB
//       final yPlane = image.planes[0].bytes;
//       final uPlane = image.planes[1].bytes;
//       final vPlane = image.planes[2].bytes;
      
//       final yRowStride = image.planes[0].bytesPerRow;
//       final uvRowStride = image.planes[1].bytesPerRow;
//       final uvPixelStride = image.planes[1].bytesPerPixel!;
      
//       // Fill the tensor with image data, converting YUV to RGB
//       int inputBufferIndex = 0;
//       for (int y = 0; y < inputHeight; y++) {
//         for (int x = 0; x < inputWidth; x++) {
//           // Scale coordinates to match original image
//           final int sourceX = min((x * imageWidth) ~/ inputWidth, imageWidth - 1);
//           final int sourceY = min((y * imageHeight) ~/ inputHeight, imageHeight - 1);
          
//           // Calculate indices for YUV planes
//           final int yIndex = sourceY * yRowStride + sourceX;
//           final int uvIndex = (sourceY ~/ 2) * uvRowStride + (sourceX ~/ 2) * uvPixelStride;
          
//           // Get YUV values
//           int yValue = yPlane[yIndex];
//           int uValue = uPlane[uvIndex];
//           int vValue = vPlane[uvIndex];
          
//           // Convert YUV to RGB (standard conversion formulas)
//           // Normalize to 0-1 range for float32 input
//           double r = max(0, min(255, (yValue + 1.402 * (vValue - 128)))) / 255.0;
//           double g = max(0, min(255, (yValue - 0.344136 * (uValue - 128) - 0.714136 * (vValue - 128)))) / 255.0;
//           double b = max(0, min(255, (yValue + 1.772 * (uValue - 128)))) / 255.0;
          
//           // TFLite models typically expect RGB channels
//           int baseIndex = inputBufferIndex * 3;
//           inputBuffer[baseIndex] = r;
//           inputBuffer[baseIndex + 1] = g;
//           inputBuffer[baseIndex + 2] = b;
//           inputBufferIndex++;
//         }
//       }
      
//       // Reshape to the expected input format [1, 1, 416, 416, 3]
//       return [inputBuffer.reshape([1, 1, inputHeight, inputWidth, 3])];
//     } catch (e) {
//       print("Error in _prepareInputData: $e");
//       // Return a correctly shaped empty array in case of error
//       return [List.filled(1 * 1 * 416 * 416 * 3, 0.0).reshape([1, 1, 416, 416, 3])];
//     }
//   }

//   String _processResults(List outputBuffer) {
//     try {
//       // For your model, the output is float32[1, 11, 3549] based on the error message
//       // Simplified processing for demonstration
      
//       // Find the detection with highest confidence
//       double maxConfidence = 0.0;
//       int bestClassIndex = 0;
      
//       // Assuming the first dimension is batch, second is class, third contains confidence scores
//       for (int i = 0; i < outputBuffer[0].length; i++) {
//         // We'll look for the maximum value across the second dimension
//         double sum = 0.0;
//         for (int j = 0; j < outputBuffer[0][i].length; j++) {
//           sum += outputBuffer[0][i][j];
//         }
//         double avgConfidence = sum / outputBuffer[0][i].length;
        
//         if (avgConfidence > maxConfidence) {
//           maxConfidence = avgConfidence;
//           bestClassIndex = i; // The class index
//         }
//       }
      
//       // Map class index to label
//       List<String> labels = [
//         "التبقع السبتوري في ورقة الطماطم", "فيروس موزاييك في ورقة الطماطم",
//          "الندوة المبكرة في ورقة البطاطس", "الندوه المتأخرة في ورقة البطاطس", 
//         "ورقة بطاطس صحية", "التبقع البكتيري في ورقة الفلفل الرومي", "ورقة الفلفل الرومي صحية"
//       ];
      
//       String detectedClass = bestClassIndex < labels.length ? labels[bestClassIndex] : "Unknown";
      
//       return "Detected: $detectedClass (${(maxConfidence * 100).toStringAsFixed(1)}%)";
//     } catch (e) {
//       print("Error processing results: $e");
//       return "Processing error: $e";
//     }
//   }

//   Future<void> _checkCameraPermission() async {
//     final status = await Permission.camera.request();
//     if (status.isGranted) {
//       await _initializeCamera();
//       _navigateToCameraPreview();
//     } else {
//       _showPermissionDeniedDialog();
//     }
//   }

//   void _navigateToCameraPreview() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CameraDetectionScreen(
//           controller: _cameraController,
//           detectionResult: _detectionResult,
//           onClose: () {
//             // Stop the image stream when closing
//             _cameraController.stopImageStream();
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }

//   void _showPermissionDeniedDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Permission Denied'),
//         content: Text('Camera permission is required to use this feature.'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () => openAppSettings(),
//             child: Text('Open Settings'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//             icon: ImageIcon(
//               AssetImage('assets/icons/arrow_back.png'), // Your asset path
//               color: Color(0xFF0AAD0A),
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         title: Text('Plant Disease Detection',
//                       style: TextStyle(
//                         fontFamily: 'InterTight',
//                         color: Color(0xFF0AAD0A),
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                       ),),
//         backgroundColor:const Color.fromARGB(255, 243, 247, 243),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ImageIcon(
//               AssetImage('assets/icons/stream.png'),
//               size: 80,
//               color: const Color(0xFF0AAD0A),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Plant Disease Detection',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Point your camera at a plant to detect diseases',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: _isModelLoaded ? _checkCameraPermission : null,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
//                 child: Text(
//                   _isModelLoaded ? 'Start Detecting' : 'Loading model...',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF0AAD0A),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CameraDetectionScreen extends StatelessWidget {
//   final CameraController controller;
//   final String detectionResult;
//   final VoidCallback onClose;

//   const CameraDetectionScreen({
//     Key? key, 
//     required this.controller, 
//     required this.detectionResult,
//     required this.onClose,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plant Analysis'),
//         backgroundColor: const Color(0xFF0AAD0A),
//         leading: IconButton(
//           icon: ImageIcon(AssetImage('assets/icons/arrow_back.png')),
//           onPressed: onClose,
//         ),
//       ),
//       body: Stack(
//         children: [
//           // Camera preview
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             child: CameraPreview(controller),
//           ),
          
//           // Detection overlay
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               color: Colors.black.withOpacity(0.5),
//               padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     detectionResult,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton.icon(
//                         icon: ImageIcon(
//                           AssetImage('assets/icons/capture.png'), // Path to your asset icon
//                           size: 24, // Optional: set the size to match your design
//                         ),
//                         label: Text('Capture'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF0AAD0A),
//                           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         onPressed: () {
//                           // Add capture functionality here
//                         },
//                       ),
//                       ElevatedButton.icon(
//                         icon: ImageIcon(
//                           AssetImage('assets/icons/delete_24dp_FFFFFFFF_FILL1_wght600_GRAD0_opsz24 1.png'), // Path to your asset icon
//                           size: 24, // Optional: set the size to match your design
//                         ),
//                         label: Text('Stop'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.red,
//                           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         onPressed: onClose,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
          
//           // Targeting overlay
//           Center(
//             child: Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 border: Border.all(color: const Color(0xFF0AAD0A), width: 2),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Extension to reshape lists (flattened 1D array to multidimensional)
// extension ListReshape<T> on List<T> {
//   List reshape(List<int> dimensions) {
//     assert(this.length == dimensions.reduce((a, b) => a * b), 'Total size must match');
    
//     if (dimensions.length == 1) {
//       return this;
//     }
    
//     int totalElements = dimensions.reduce((a, b) => a * b);
//     if (totalElements != this.length) {
//       throw Exception('Total elements in dimensions does not match list length');
//     }
    
//     if (dimensions.length == 2) {
//       List result = [];
//       int rows = dimensions[0];
//       int cols = dimensions[1];
      
//       for (int i = 0; i < rows; i++) {
//         List row = [];
//         for (int j = 0; j < cols; j++) {
//           row.add(this[i * cols + j]);
//         }
//         result.add(row);
//       }
//       return result;
//     } else if (dimensions.length == 3) {
//       List result = [];
//       int dim1 = dimensions[0];
//       int dim2 = dimensions[1];
//       int dim3 = dimensions[2];
      
//       for (int i = 0; i < dim1; i++) {
//         List slice = [];
//         for (int j = 0; j < dim2; j++) {
//           List row = [];
//           for (int k = 0; k < dim3; k++) {
//             row.add(this[i * dim2 * dim3 + j * dim3 + k]);
//           }
//           slice.add(row);
//         }
//         result.add(slice);
//       }
//       return result;
//     } else if (dimensions.length == 4) {
//       List result = [];
//       int dim1 = dimensions[0];
//       int dim2 = dimensions[1];
//       int dim3 = dimensions[2];
//       int dim4 = dimensions[3];
      
//       for (int i = 0; i < dim1; i++) {
//         List volume = [];
//         for (int j = 0; j < dim2; j++) {
//           List slice = [];
//           for (int k = 0; k < dim3; k++) {
//             List row = [];
//             for (int l = 0; l < dim4; l++) {
//               row.add(this[i * dim2 * dim3 * dim4 + j * dim3 * dim4 + k * dim4 + l]);
//             }
//             slice.add(row);
//           }
//           volume.add(slice);
//         }
//         result.add(volume);
//       }
//       return result;
//     } else if (dimensions.length == 5) {
//       List result = [];
//       int dim1 = dimensions[0];
//       int dim2 = dimensions[1];
//       int dim3 = dimensions[2];
//       int dim4 = dimensions[3];
//       int dim5 = dimensions[4];
      
//       for (int i = 0; i < dim1; i++) {
//         List hypervolume = [];
//         for (int j = 0; j < dim2; j++) {
//           List volume = [];
//           for (int k = 0; k < dim3; k++) {
//             List slice = [];
//             for (int l = 0; l < dim4; l++) {
//               List row = [];
//               for (int m = 0; m < dim5; m++) {
//                 row.add(this[i * dim2 * dim3 * dim4 * dim5 + 
//                             j * dim3 * dim4 * dim5 + 
//                             k * dim4 * dim5 + 
//                             l * dim5 + m]);
//               }
//               slice.add(row);
//             }
//             volume.add(slice);
//           }
//           hypervolume.add(volume);
//         }
//         result.add(hypervolume);
//       }
//       return result;
//     } else {
//       throw Exception('Unsupported number of dimensions: ${dimensions.length}');
//     }
//   }
// }