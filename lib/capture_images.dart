import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class CameraApp extends StatefulWidget {
  List<CameraDescription> cameras;

  CameraApp(this.cameras);

  @override
  _CameraAppState createState() => new _CameraAppState(cameras);
}

class _CameraAppState extends State<CameraApp> {
  CameraController controller;
  List<CameraDescription> cameras;

  _CameraAppState(this.cameras);

  @override
  void initState() {
    super.initState();
    controller = new CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double widthScreen = MediaQuery.of(context).size.width;
    final double heightScreen = MediaQuery.of(context).size.height;

    if (!controller.value.isInitialized) {
      return new Container();
    }
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.cyanAccent,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Disease Detection',
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
              width: widthScreen,
              height: heightScreen * 0.5,
              child: Card(
                child: new AspectRatio(
                    aspectRatio:
                    controller.value.aspectRatio,
                    child: new CameraPreview(controller)
                ),
              ),
            ),
            Center(
              child: Text(
                'Capture Images',
                style: new TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: (){
                      onTakePictureButtonPressed();
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Capture',
                      style: new TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: RaisedButton(
                      onPressed: (){

                      },
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        'Identify',
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();

  void onTakePictureButtonPressed() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await new Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    print(filePath);
  }
}