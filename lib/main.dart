import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:carousel/carousel.dart';

import './plant_model.dart';
import './capture_images.dart';
import './carousel_view.dart';

List<CameraDescription> cameras;

void main() async {
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(0.0),
                    padding: EdgeInsets.all(0.0),
                    child: CarouselView(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/d2.png',
                        height: 30.0,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 0.0),
                        child: Text(
                          'Disease Detection',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PlantModel('Apel',cameras),
                              PlantModel('Jagung',cameras),
                              PlantModel('Kentang',cameras),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
        ),
      ),
    );
  }
}