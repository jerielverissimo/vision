import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'src/ui/scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Scanner(),
        home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage;

  bool isImageLoaded = false;
  String result = "result";
  FirebaseVisionImage ourImage; 

  Future pickImage() async {
    var tempStore = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = tempStore;
      isImageLoaded = true;
      ourImage = FirebaseVisionImage.fromFile(pickedImage);
    });

    if (pickedImage == null) {
        throw Exception('File is not available');
      }
  }

  Future readText() async {
    await pickImage();
    if (ourImage == null) {
      print("Imagem nula");
    }
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await recognizeText.processImage(ourImage);

    String text = visionText.text;
    for (TextBlock block in visionText.blocks) {
      final Rect boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
          print(element.text);
          result += element.text;
        }
      }
    }
  }

  Future decode() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
    List barCodes = await barcodeDetector.detectInImage(ourImage);

    for (Barcode readableCode in barCodes) {
      print(readableCode.displayValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              isImageLoaded
              ? Center(
                  child: Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(pickedImage), fit: BoxFit.cover))),
              )
              : Container(),
              SizedBox(height: 10.0),
              RaisedButton(
                  child: Text('Pick an image'),
                  onPressed: pickImage,
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                  child: Text('Read Text'),
                  onPressed: readText,
              ),
              RaisedButton(
                  child: Text('Read Bar Code'),
                  onPressed: decode,
              ),
              SizedBox(height: 10.0),
              Text(result)
                  ],
                  ));
  }
}
