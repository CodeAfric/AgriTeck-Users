import 'package:agriteck_user/Toast/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

Future loadModel() async {
  Tflite.close();
  try {
    String res = await Tflite.loadModel(
      model: "assets/model.tflite",
      labels:
          "assets/labels.txt", // defaults to false, set to true to use GPU delegate
    );
    return res;
  } catch (e) {
    print('Failed to load model. $e');
    return e;
  }
}

Future predictDesease(var image) async {
  try {
    // Start a timer for the process
    int startTime = new DateTime.now().millisecondsSinceEpoch;
    // Load the model

    loadModel().then((val) {
      print('object Model Loaded');
    });

// Run the Model on the image the is selested
// Return a List of Predictions a map datatype
    var prediction = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.05,
      imageMean: 255.0,
      imageStd: 255.0,
    );

    // Record the end time for the process
    int endTime = new DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");

    // Dispose the Tflite to free up resources
    Tflite.close();

    // Return the prediction
    return prediction;
  } catch (e) {
    return e;
  }
}
