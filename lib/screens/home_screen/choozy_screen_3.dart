// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'dart:math';

class ChoozyScreen3 extends StatefulWidget {
  const ChoozyScreen3({Key? key}) : super(key: key);

  @override
  State<ChoozyScreen3> createState() => _ChoozyScreen3State();
}

class _ChoozyScreen3State extends State<ChoozyScreen3> {
  int counter = 0;
  bool isCounting = false;
  bool isDragging = false;

  int maxPlayersAmount = 10, currentPlaying = 0;
  int countDetector = 0;
  double scaleButton = 1;

  late List<bool> isOnList = [];
  late List<Offset> positionList = [];
  late List<Widget> listStack = [];

  @override
  void initState() {
    isOnList = List.generate(maxPlayersAmount, (index) => false);
    positionList =
        List.generate(maxPlayersAmount, (index) => const Offset(0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listStack.add(textCenterApp());
    listStack = List.generate(
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
    listStack.addAll([
      buttonBottomHome(
        margin: const EdgeInsets.only(bottom: 30, left: 30),
        alignment: Alignment.bottomLeft,
        iconData: Icons.help_outline,
        titleButton: "Tutorial",
        function: () {
          //Navigator.pushNamed(context, const TutorialScreen01().id);
        },
        visible: !isDragging,
      ),
      buttonBottomHome(
        margin: const EdgeInsets.only(bottom: 30),
        alignment: Alignment.bottomCenter,
        iconData: Icons.format_paint,
        titleButton: "Temas",
        function: () {
          // Navigator.pushNamed(context, const TemmasScreen().id);
        },
        visible: !isDragging,
      ),
      buttonBottomHome(
        margin: const EdgeInsets.only(bottom: 30, right: 30,),
        alignment: Alignment.bottomRight,
        iconData: Icons.settings_outlined,
        titleButton: "Ajustes",
        function: () {
          // print("TapAjustes");
        },
        visible: !isDragging,
      ),
    ]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: listStack,
        ),
      ),
    );
  }
  
  Visibility textCenterApp() {
    return Visibility(
      visible: !isDragging,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: 1,//!gesture ? 1 : 0,
        onEnd: () {
          setState(() {
            isDragging = true;
          });
        },
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(
                height: 30,
              ),
              Text(
                "CHOOZY",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "COLOCA 2 O MÁS",
                style: TextStyle(
                  fontSize: 26,
                  letterSpacing: 1.5,
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Text(
                "DEDOS",
                style: TextStyle(
                  fontSize: 26,
                  letterSpacing: 1.5,
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Visibility buttonBottomHome({
    required EdgeInsetsGeometry margin,
    required AlignmentGeometry alignment,
    required IconData iconData,
    required String titleButton,
    required Function()? function,
    required bool visible,
  }) {
    return Visibility(
      visible: visible,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: counter > 0 ? 1 : 0,
        onEnd: () {
          setState(() {
            visible = false;
          });
        },
        child: Align(
          alignment: alignment,
          child: GestureDetector(
            onTap: function,
            onTapDown: (details) {
              print("TapDown: ${details.localPosition}");
              setState(() {
                scaleButton = 1.1;
              });
            },
            onTapUp: (details) {
              print("TapUp");
              setState(() {
                scaleButton = 1;                
              });
            },
            child: Container(
              margin: margin,//const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.all(10),
              width: 80,
              height: 100,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 100),
                scale: scaleButton,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Icon(
                        iconData,//Icons.help_outline ,//Icons.format_paint, //Icons.settings_outlined,
                        size: 60,
                        shadows: const <Shadow>[
                          Shadow(
                            blurRadius: 4.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      titleButton,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                        shadows: <Shadow>[
                          Shadow(
                            blurRadius: 4.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
          _counterRestart();
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
          color: Colors.primaries[index],//Colors.black,//Colors.primaries[index],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
