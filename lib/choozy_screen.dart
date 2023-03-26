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

  List<bool> isOnList = [];
  List<Offset> positionList = [];
  List<Widget> gestureDetectors = [];

  late Widget generalGestureDetectorTest;

  @override
  void initState() {
    isOnList = List.generate(maxPlayersAmount, (index) => false);
    positionList =
        List.generate(maxPlayersAmount, (index) => const Offset(0, 0));
    super.initState();
    generalGestureDetectorTest = GeneralGestureDetector(
      index: 0,
      onPanEnd: (following) {
        setState(() {
          generalGestureDetectorTest = following;
        });
      },
    );
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
          // children: List.generate(
          //   maxPlayersAmount,
          //   (index) {
          //     return index == 0
          //         ? generalGestureDetector(index)
          //         : Visibility(
          //             visible: isOnList[index - 1],
          //             child: generalGestureDetector(index),
          //           );
          //   },
          // ),
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: generalGestureDetectorTest,
            ),
          ],
        ),
      ),
    );
  }

  generalGestureDetector(int index) {
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

class GeneralGestureDetector extends StatefulWidget {
  GeneralGestureDetector({
    super.key,
    required this.index,
    required this.onPanEnd,
  });

  int index;
  Offset offset = const Offset(100, 100);
  Widget following = const SizedBox.shrink();
  Function(Widget following) onPanEnd;
  bool isTouching = false;

  @override
  State<GeneralGestureDetector> createState() => _GeneralGestureDetectorState();
}

class _GeneralGestureDetectorState extends State<GeneralGestureDetector> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Visibility(
            visible: widget.isTouching,
            child: PositionedCircle(
              index: widget.index,
              position: widget.offset,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onPanDown: (details) {
                widget.isTouching = true;
                widget.offset = details.localPosition;
                widget.following = GeneralGestureDetector(
                  index: widget.index + 1,
                  onPanEnd: (following) {
                    setState(() {
                      widget.following = following;
                    });
                  },
                );
                setState(() {});
              },
              onPanEnd: (details) {
                setState(() {
                  widget.isTouching = false;
                  widget.onPanEnd(widget.following);
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  widget.offset = details.localPosition;
                });
              },
            ),
          ),
          widget.following,
        ],
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
    this.widthPositionedCircle = 300,
    this.heightPositionedCircle = 300,
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
