// lib/tflite_helper.dart
import 'package:tflite/tflite.dart';

class TFLiteHelper {
  static Future<void> loadModel() async {
    String? res = await Tflite.loadModel(
      model: "assets/models/best.tflite",
      labels: "assets/models/classes.txt",
    );
    print("Model loaded: $res");
  }

  static Future<List?> detectImage(String path) async {
    var recognitions = await Tflite.detectObjectOnImage(
      path: path,
      model: "YOLO",
      imageMean: 0.0,
      imageStd: 255.0,
      threshold: 0.4,
      numResultsPerClass: 1,
    );
    return recognitions;
  }

  static void disposeModel() {
    Tflite.close();
  }
}
