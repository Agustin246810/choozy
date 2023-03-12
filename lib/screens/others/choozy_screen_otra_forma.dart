// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'dart:math';

class ChoozyScreen2 extends StatefulWidget {
  const ChoozyScreen2({Key? key}) : super(key: key);

  @override
  State<ChoozyScreen2> createState() => _ChoozyScreen2State();
}

class _ChoozyScreen2State extends State<ChoozyScreen2> {
  int counter = 0;
  bool isCounting = false;

  int maxPlayersAmount = 10, currentPlaying = 0;
  int countDetector = 0;

  List<bool> isOnList = [];
  List<Offset> positionList = [];
  // late List<Widget> listVisibiities;

  @override
  void initState() {
    isOnList = List.generate(maxPlayersAmount, (index) => false);
    positionList =
        List.generate(maxPlayersAmount, (index) => const Offset(0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listVisibiities = List.generate(
            maxPlayersAmount,
            (index) {
              return index == 0
                  ? GeneralGestureDetector(index)
                  : Visibility(
                      visible: isOnList[index - 1],
                      child: GeneralGestureDetector(index),
                    );
            },
          );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Choozy"),
        ),
        body: Stack(
          children: listVisibiities,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              isOnList[5] = true;
            });
          },
        ),
      ),
    );
  }

  GeneralGestureDetector(int index) {
    print("Generando un nuevo detector [$index]");
    return GestureDetector(
      onPanEnd: (details) {
        setState(() {
          // isOnList[index] = false;
          currentPlaying = index;
          // for (int i = index; i < maxPlayersAmount; i++) {
          //   isOnList[i] = false;
          // }
          isOnList[index] = false;
        });
      },
      onPanStart: (details) {
        currentPlaying = index + 1;
        positionList[index] = details.localPosition;
        if (currentPlaying > 1) {
          // _counterRestart();
          counter++;
          //_counterStart(counter);
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
        width: 380 - (5 * index).toDouble(),
        height: 720 - (5 * index).toDouble(),
        color: Colors.transparent,//Colors.primaries[index].withOpacity(0.6),
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
          color: Colors.primaries[index],//Colors.black,//Colors.primaries[index],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

late List<Widget> listVisibiities;