import 'package:flutter/material.dart';

class ChoozyScreen extends StatefulWidget {
  const ChoozyScreen({Key? key}) : super(key: key);

  @override
  State<ChoozyScreen> createState() => _ChoozyScreenState();
}

class _ChoozyScreenState extends State<ChoozyScreen> {

  bool gesture1 = false;
  bool gesture2 = false;
  bool gesture3 = false;

  double widthContainer = 400;
  double heightContainer = 400;

  Offset currentPosition1 = const Offset(-100,-100);
  Offset currentPosition2 = const Offset(-100,-100);
  Offset currentPosition3 = const Offset(-100,-100);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Choozy"),
        ),
        body: Column(
          children: [
            GestureDetector(
              onPanEnd: (details){
                setState(() {
                  gesture1 = false;
                  gesture2 = false;
                  gesture3 = false;
                });
              },
              onVerticalDragUpdate: (details) {
                Offset position = details.localPosition;
                setState(() {
                  if(position.dx >= 0 && 
                  position.dx <= widthContainer && 
                  position.dy >= 0 && 
                  position.dy <= heightContainer){
                    print(position);
                    gesture1 = true;
                    currentPosition1 = position;
                  }
                });
              },
              child: Container(
                width: widthContainer,
                height: heightContainer,
                color: Colors.grey,
                child: Stack(
                  children: [
                    Visibility(
                      visible: gesture1,
                      child: PositionedCircle(
                        index: 0, 
                        position: currentPosition1
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: gesture1,
                  child: const Square(index: 0,),
                ),
                Visibility(
                  visible: gesture2,
                  child: const Square(index: 1,),
                ),
                Visibility(
                  visible: gesture3,
                  child: const Square(index: 2,),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class Square extends StatelessWidget {
  final int index;
  const Square({
    Key? key,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      color: Colors.primaries[index],
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
    required this.index, 
    required this.position, 
    this.widthPositionedCircle = 40, 
    this.heightPositionedCircle = 40,
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
          color: Colors.primaries[index],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}