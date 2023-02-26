import 'package:flutter/material.dart';

class ChoozyScreen extends StatefulWidget {
  const ChoozyScreen({Key? key}) : super(key: key);

  @override
  State<ChoozyScreen> createState() => _ChoozyScreenState();
}

class _ChoozyScreenState extends State<ChoozyScreen> {

  List<bool> listGestures = [false,false,false];

  int currentStack = 0;

  double widthContainer = 400;
  double heightContainer = 400;

  List<Offset> listCurrentPositions = [
    const Offset(-100,-100),
    const Offset(-100,-100),
    const Offset(-100,-100)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Choozy"),
        ),
        body: Column(
          children: [
            IndexedStack(
              index: currentStack,
              children: [
                gestureDetectorFinger(
                  gesture: listGestures[0],
                  index: 0,
                  position: listCurrentPositions[0],
                ),
                gestureDetectorFinger(
                  gesture: listGestures[1],
                  index: 1,
                  position: listCurrentPositions[1],
                ),
                gestureDetectorFinger(
                  gesture: listGestures[2],
                  index: 2,
                  position: listCurrentPositions[2],
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: listGestures[0],
                  child: const Square(index: 0,),
                ),
                Visibility(
                  visible: listGestures[1],
                  child: const Square(index: 1,),
                ),
                Visibility(
                  visible: listGestures[2],
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

  GestureDetector gestureDetectorFinger({
    required bool gesture,
    required Offset position,
    required int index,
  }) {
    return GestureDetector(
      onDoubleTap: (){
        setState(() {
          listGestures[1] = true;
          currentStack = 2;
        });
      },
      onTap: (){
        setState(() {
          listGestures[0] = true;
          currentStack = 1;
        });
      },
      onPanEnd: (details){
        setState(() {
          listGestures[index] = false;
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
            listGestures[index] = true;
            listCurrentPositions[index] = position;
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
              visible: gesture,
              child: PositionedCircle(
                index: index, 
                position: position,
              ),
            ),
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