import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import './capture_images.dart';

class PlantModel extends StatelessWidget {
  final String buttonText;
  final List<CameraDescription> cameras;

  PlantModel(this.buttonText, this.cameras);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CameraApp(cameras))
        );
      },
      color: Theme.of(context).primaryColor,
      child: Text(
        buttonText,
        style: new TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}