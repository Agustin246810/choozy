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

  Offset currentPosition1 = const Offset(-100, -100);
  Offset currentPosition2 = const Offset(-100, -100);
  Offset currentPosition3 = const Offset(-100, -100);

  Offset position = const Offset(100, 100);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Choozy"),
        ),
        body: Column(
          children: [
            Container(
              width: widthContainer,
              height: heightContainer,
              color: Colors.grey,
              child: _test(),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _test() {
    bool isOn = false;

    return SizedBox(
      width: widthContainer,
      height: heightContainer,
      child: GestureDetector(
        onPanEnd: (details) {
          setState(() {
            isOn = false;
          });
        },
        onPanStart: (details) {
          position = details.localPosition;
          setState(() {
            isOn = true;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            position = details.localPosition;
            print(position);
          });
        },
        child: Stack(
          children: [
            PositionedCircle(index: 0, position: position),
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
    this.widthPositionedCircle = 40,
    this.heightPositionedCircle = 40,
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
