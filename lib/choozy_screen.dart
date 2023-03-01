// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class ChoozyScreen extends StatefulWidget {
  const ChoozyScreen({Key? key}) : super(key: key);

  @override
  State<ChoozyScreen> createState() => _ChoozyScreenState();
}

class _ChoozyScreenState extends State<ChoozyScreen> {
  int maxPlayersAmount = 20;

  double widthContainer = 400;
  double heightContainer = 800;

  List<bool> isOnList = [];

  List<Offset> positionList = [];

  @override
  void initState() {
    isOnList = List.generate(maxPlayersAmount, (index) => false);
    positionList =
        List.generate(maxPlayersAmount, (index) => const Offset(0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Choozy"),
        ),
        body: Stack(
          children: List.generate(
            maxPlayersAmount,
            (index) {
              return index == 0
                  ? GeneralGestureDetector(index)
                  : Visibility(
                      visible: isOnList[index - 1],
                      child: GeneralGestureDetector(index),
                    );
            },
          ),
        ),
      ),
    );
  }

  GeneralGestureDetector(int index) {
    return GestureDetector(
      onPanEnd: (details) {
        setState(() {
          for (int i = index; i < maxPlayersAmount; i++) {
            isOnList[i] = false;
          }
        });
      },
      onPanStart: (details) {
        positionList[index] = details.localPosition;
        setState(() {
          isOnList[index] = true;
        });
      },
      onPanUpdate: (details) {
        setState(() {
          positionList[index] = details.localPosition;
        });
      },
      child: Container(
        width: widthContainer,
        height: heightContainer,
        color: Colors.transparent,
        child: Stack(
          children: [
            isOnList[index]
                ? PositionedCircle(
                    index: index + 1, position: positionList[index])
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
