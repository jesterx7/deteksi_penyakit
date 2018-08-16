import 'package:flutter/material.dart';
import 'package:carousel/carousel.dart';

class CarouselView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselView();
  }
}

class _CarouselView extends State<CarouselView> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      height: 240.0,
      child: new Carousel(
        children: [
          new AssetImage('carousel_images/img1.jpg'),
          new AssetImage('carousel_images/img2.jpg'),
          new AssetImage('carousel_images/img3.jpg')
        ].map((netImage) => new Image(image: netImage, alignment: Alignment.center, fit: BoxFit.fill,)).toList(),
        displayDuration: const Duration(seconds: 3),
      ),
    );
  }

}