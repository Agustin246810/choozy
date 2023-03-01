// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'dart:math';

class ChoozyScreen extends StatefulWidget {
  const ChoozyScreen({Key? key}) : super(key: key);

  @override
  State<ChoozyScreen> createState() => _ChoozyScreenState();
}

class _ChoozyScreenState extends State<ChoozyScreen> {
  int counter = 0;
  bool isCounting = false;

  int maxPlayersAmount = 20, currentPlaying = 0;

  // double widthContainer = 400;
  // double heightContainer = 800;

  List<bool> isOnList = [];
  List<Offset> positionList = [];
  List<Widget> gestureDetectors = [];

  @override
  void initState() {
    isOnList = List.generate(maxPlayersAmount, (index) => false);
    positionList =
        List.generate(maxPlayersAmount, (index) => const Offset(0, 0));
    // gestureDetectors = List.generate(
    //   maxPlayersAmount,
    //   (index) {
    //     return index == 0
    //         ? GeneralGestureDetector(index)
    //         : Visibility(
    //             visible: isOnList[index - 1],
    //             child: GeneralGestureDetector(index),
    //           );
    //   },
    // );
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
          // children: gestureDetectors,
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
          // isOnList[index] = false;
          currentPlaying = index;
          for (int i = index; i < maxPlayersAmount; i++) {
            isOnList[i] = false;
          }
        });
      },
      onPanStart: (details) {
        currentPlaying = index + 1;
        positionList[index] = details.localPosition;
        if (currentPlaying > 1) {
          // _counterRestart();
          counter++;
          _counterStart(counter);
        }
        setState(() {
          isOnList[index] = true;
        });
      },
      onPanUpdate: (details) {
        setState(() {
          positionList[index] = details.localPosition;
          print(currentPlaying);
        });
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
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

  void _counterRestart() {}

  Future<void> _counterStart(int counter) async {
    isCounting = true;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isCounting && counter == this.counter) {
          int winer = Random().nextInt(currentPlaying);

          print("Ganó el ${winer}");
        }
      },
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
