// ignore_for_file: must_be_immutable

import 'package:choozy/screens/test_screen/test_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends StateMVC<TestPage> {
  late TestPageController _con;

  TestPageState() : super(TestPageController()) {
    _con = TestPageController.con;
  }

  @override
  void initState() {
    super.initState();
    _con.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: _con.gestureLayers,
    );
  }
}

class GestureLayer extends StatefulWidget {
  GestureLayer({
    super.key,
    required this.onTapStart,
    required this.onTapEnd,
  });

  static int nextID = 0;

  final int id = GestureLayer.nextID++;
  final Function(int id) onTapEnd;
  final Function() onTapStart;

  @override
  State<GestureLayer> createState() => _GestureLayerState();
}

class _GestureLayerState extends State<GestureLayer> {
  Offset _offset = const Offset(0, 0);
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomCircle(
          isVisible: _isVisible,
          position: _offset,
          index: widget.id,
        ),
        GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _offset = details.localPosition;
            });
          },
          onPanStart: (details) {
            _isVisible = true;
            widget.onTapStart();
          },
          onPanEnd: (details) {
            widget.onTapEnd(widget.id);
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}

class CustomCircle extends StatelessWidget {
  final int index;
  Offset position;
  final double circleRadius;
  bool isVisible;

  CustomCircle({
    Key? key,
    required this.index,
    required this.position,
    required this.isVisible,
    this.circleRadius = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(
        position.dx - circleRadius / 2,
        position.dy - circleRadius / 2,
      ),
      child: Visibility(
        visible: isVisible,
        child: Container(
          width: circleRadius,
          height: circleRadius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 8,
            ),
          ),
        ),
      ),
    );
  }
}
