// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class ChoozyScreen extends StatefulWidget {
  const ChoozyScreen({Key? key}) : super(key: key);

  @override
  State<ChoozyScreen> createState() => _ChoozyScreenState();
}

class _ChoozyScreenState extends State<ChoozyScreen> {
  double widthContainer = 400;
  double heightContainer = 400;

  List<bool> isOnList = [false, false, false];

  List<Offset> position = [
    const Offset(100, 100),
    const Offset(100, 100),
    const Offset(100, 100),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Choozy"),
        ),
        body: Stack(
          children: [
            GeneralGestureDetector(0),
            Visibility(
              visible: isOnList[0],
              child: GeneralGestureDetector(1),
            ),
          ],
        ),
      ),
    );
  }

  GeneralGestureDetector(int index) {
    return GestureDetector(
      onPanEnd: (details) {
        setState(() {
          isOnList[index] = false;
        });
      },
      onPanStart: (details) {
        position[index] = details.localPosition;
        setState(() {
          isOnList[index] = true;
        });
      },
      onPanUpdate: (details) {
        setState(() {
          position[index] = details.localPosition;
        });
      },
      child: Container(
        width: widthContainer,
        height: heightContainer,
        color: Colors.transparent,
        child: Stack(
          children: [
            // PositionedCircle(
            //   index: index + 1,
            //   position: position[index - 1],
            // ),
            isOnList[index]
                ? PositionedCircle(index: index + 1, position: position[index])
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class PositionedCircle extends StatelessWidget {
  final int index;
  Offset position;
  final double widthPositionedCircle;
  final double heightPositionedCircle;

  PositionedCircle({
    Key? key,
    required this.index,
    required this.position,
    this.widthPositionedCircle = 100,
    this.heightPositionedCircle = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy - widthPositionedCircle / 2,
      left: position.dx - heightPositionedCircle / 2,
      child: Container(
        width: widthPositionedCircle,
        height: heightPositionedCircle,
        decoration: BoxDecoration(
          color: Colors.primaries[index],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  final int index;
  const Square({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: Colors.primaries[index],
    );
  }
}
