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

    var objectType = await detectImage(image).then((value) => null);

    print(objectType);

    await loadModel().then((value) => null);

    // Run the Model on the image the is selested
    // Return a List of Predictions a map datatype
    var prediction = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      // threshold: 0.05,
      imageMean: 224.0,
      imageStd: 224.0,
    );

    // Record the end time for the process
    int endTime = new DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");

    // Dispose the Tflite to free up resources
    Tflite.close();

    // Return the predictionop
    print(
        '=================from first============\n${prediction}\n==============================');
    return prediction;
  } catch (e) {
    print(e);
  }
}

Future detectImage(var image) async {
  try {
    String res = await Tflite.loadModel(
        model: "assets/mobilenet_model/ssd_mobilenet_v1_1_metadata_1.tflite",
        labels:
            "assets/mobilenet_model/labels_mobilenet.txt" // defaults to false, set to true to use GPU delegate
        );

    var prediction;

    if (res == 'success') {
      prediction = await Tflite.detectObjectOnImage(
        path: image.path,
        // model: 'MobileNet',
        // threshold: 0.05,
        imageMean: 224.0,
        imageStd: 224.0,
      );
    }

    // Dispose the Tflite to free up resources
    Tflite.close();

    // Return the predictionop
    print(
        '=================from first============\n$prediction\n==============================');
    return prediction;
  } catch (e) {
    print(e);
  }
}
