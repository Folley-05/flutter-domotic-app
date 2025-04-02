import 'package:flutter/material.dart';

class HouseGrid extends StatefulWidget {
  // const HouseGrid({super.key, required})

  @override
  State<HouseGrid> createState() => _HouseGridState();
}

class _HouseGridState extends State<HouseGrid> {
  bool isOff = true;
  final List<String> imagePathsOff = [
    "assets/images/b1-off.jpeg",
    "assets/images/lv1-off.jpeg",
    "assets/images/room-off.jpeg",
    "assets/images/stairs-off.jpeg",
    "assets/images/dinner-off.jpeg",
    "assets/images/stairs-off.jpeg",
    "assets/images/bd2-off.jpeg",
  ];
  final List<String> imagePathsOn = [
    "assets/images/b1-on.jpeg",
    "assets/images/lv1-on.jpeg",
    "assets/images/room-on.jpeg",
    "assets/images/stairs-on.jpeg",
    "assets/images/dinner-on.jpeg",
    "assets/images/stairs-on.jpeg",
    "assets/images/bd2-on.jpeg",
  ];

  void switchLight() {
    setState(() {
      isOff = !isOff;
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height:
        MediaQuery.of(context).size.height *
        0.60, // Set the height to half of the screen
    width: MediaQuery.of(context).size.width * 0.60, // Take full width
    child: Column(
      children: [
        // First row (3 images)
        Expanded(
          child: Row(
            children: List.generate(
              4,
              (index) => Image.asset(
                isOff ? imagePathsOff[index] : imagePathsOn[index],
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: List.generate(
              3,
              (index) => Image.asset(
                isOff ? imagePathsOff[index + 4] : imagePathsOn[index + 4],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: switchLight,
                child: Text("Switch Light"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
