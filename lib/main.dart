import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageGrid(),
      ),
    );
  }
}

class ImageGrid extends StatelessWidget {
  final List<String> imagePaths = [
	"assets/images/b1-off.jpeg","assets/images/lv1-off.jpeg","assets/images/room-off.jpeg","assets/images/stairs-off.jpeg",
	"assets/images/dinner-off.jpeg","assets/images/stairs-off.jpeg","assets/images/bd2-off.jpeg",
  ];

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height*0.60, // Set the height to half of the screen
      width: MediaQuery.of(context).size.width*0.60, // Take full width
      child: Column(
        children: [
          // First row (3 images)
          Expanded(
            child: Row(
              children: List.generate(4, (index) => Image.asset(imagePaths[index])),
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(3, (index) => Image.asset(imagePaths[index+4])),
            ),
          ),
        ],
      ),
    );
  }
}
