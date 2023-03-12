import 'package:choozy/screens/settings_screen/ajustes_screen.dart';
import 'package:choozy/screens/theme_screen/temas_screen.dart';
import 'package:choozy/screens/tutorial_screen/tutorial_screen.dart';
import 'package:flutter/material.dart';

class ChoozyScreenDesign extends StatefulWidget {
  final String id = "choozy_screen_design";
  const ChoozyScreenDesign({Key? key}) : super(key: key);

  @override
  State<ChoozyScreenDesign> createState() => _ChoozyScreenDesignState();
}

class _ChoozyScreenDesignState extends State<ChoozyScreenDesign> {

  bool gesture = false;
  bool visibilityText = true;

  int currentStack = 0;

  double widthContainer = 400;
  double heightContainer = 400;

  List<Offset> listCurrentPositions = [
    const Offset(-100,-100),
    const Offset(-100,-100),
    const Offset(-100,-100)
  ];

  int totalPeople = 3;

  double scaleButton = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            textCenterApp(),
            gestureDetectorFinger(
              // gesture: gesture,
              index: 0,
              position: listCurrentPositions[0],
            ),
            button(
              margin: const EdgeInsets.only(bottom: 30, left: 30),
              alignment: Alignment.bottomLeft,
              iconData: Icons.help_outline,
              titleButton: "Tutorial",
              function: () {
                Navigator.pushNamed(context, const TutorialScreen01().id);
              },
              visible: visibilityText,
            ),
            button(
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomCenter,
              iconData: Icons.format_paint,
              titleButton: "Temas",
              function: () {
                Navigator.pushNamed(context, const TemmasScreen().id);
              },
              visible: visibilityText,
            ),
            button(
              margin: const EdgeInsets.only(bottom: 30, right: 30,),
              alignment: Alignment.bottomRight,
              iconData: Icons.settings_outlined,
              titleButton: "Ajustes",
              function: () {
                Navigator.pushNamed(context, const SettingsScreen().id);
              },
              visible: visibilityText,
            ),
          ],
        ),
      ),
    );
  }

  Visibility textCenterApp() {
    return Visibility(
      visible: visibilityText,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: !gesture ? 1 : 0,
        onEnd: () {
          setState(() {
            visibilityText = false;
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

  Visibility button({
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
        opacity: !gesture ? 1 : 0,
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
                        fontSize: 11,
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

  GestureDetector gestureDetectorFinger({
    // required bool gesture,
    required Offset position,
    required int index,
  }) {
    return GestureDetector(
      onPanEnd: (details){
        // print(details.velocity);
        print(details.velocity);
        setState(() {
          gesture = false;
          visibilityText = true;
        });
      },
      onPanUpdate: (details) {
        Offset position = details.localPosition;
        print(position);
        setState(() {
          gesture = true;
          listCurrentPositions[index] = position;
        });
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,//Colors.grey.withOpacity(0.3),
        child: Stack(
          children: [
            Visibility(
              visible: gesture,
              child: PositionedCircle(
                //index: index, 
                position: position,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PositionedCircle extends StatelessWidget {
  final int index;
  final Offset position;
  final double widthPositionedCircle;
  final double heightPositionedCircle;

  const PositionedCircle({
    Key? key, 
    this.index = 0,
    required this.position,
    this.widthPositionedCircle = 100, 
    this.heightPositionedCircle = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy - widthPositionedCircle/2,
      left: position.dx - heightPositionedCircle/2,
      child: Container(
        width: widthPositionedCircle,
        height: heightPositionedCircle,
        decoration: BoxDecoration(
          //color: Colors.white,//Colors.primaries[index],
          shape: BoxShape.circle,
          border: Border.all(
            width: 10,
            color: Colors.white,
          )
        ),
      ),
    );
  }
}