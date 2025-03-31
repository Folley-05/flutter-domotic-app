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
	"assets/images/bc1.jpeg","assets/images/bc.jpeg","assets/images/bc3.jpeg",
	"assets/images/bc3.jpeg","assets/images/bc2.jpeg","assets/images/bc1.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row (3 images)
        Row(
          children: List.generate(3, (index) => Expanded(
            child: Image.asset(imagePaths[index], fit: BoxFit.cover),
          )),
        ),
        // Second row (3 images)
        Row(
          children: List.generate(3, (index) => Expanded(
            child: Image.asset(imagePaths[index + 3], fit: BoxFit.cover),
          )),
        ),
      ],
    );
  }
}
