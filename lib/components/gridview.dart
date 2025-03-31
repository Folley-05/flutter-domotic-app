// ignore_for_file: prefer_expression_function_bodies

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridview extends StatefulWidget {
  const CustomGridview({super.key});

  @override
  State<CustomGridview> createState() => _CustomGridviewState();
}

class Tile extends StatelessWidget {
  Tile({Key? key}) : super(key: key);

  final Color color = _getRandomColor();

  static Color _getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        // borderRadius: BorderRadius.circular(10),
      ),
    //   margin: EdgeInsets.all(0),
    );
  }
}

class _CustomGridviewState extends State<CustomGridview> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 8,
    //   mainAxisSpacing: 0,
    //   crossAxisSpacing: 0,
      children: [
        const StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Image(image: AssetImage("assets/images/bc1.jpeg")),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 3,
          child: Image(image: AssetImage("assets/images/bc2.jpeg")),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 2,
          child: Image(image: AssetImage("assets/images/bc3.jpeg")),
        ),
        // StaggeredGridTile.count(
        //   crossAxisCellCount: 2,
        //   mainAxisCellCount: 2,
        //   child: Tile(),
        // ),
      ],
    );
  }
}
