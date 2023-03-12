import 'package:flutter/material.dart';

class TestVisibility extends StatefulWidget {
  const TestVisibility({Key? key}) : super(key: key);

  @override
  State<TestVisibility> createState() => _TestVisibilityState();
}

class _TestVisibilityState extends State<TestVisibility> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Visibility(
              visible: isVisible,
              child: GestureDetector(
                onPanUpdate: (details) {
                  //print("onPan cuando la visibilidad esta $isVisible");
                  print("Estado $isVisible Position ${details.localPosition}");
                },
                child: Container(
                  width: 400,
                  height: 400,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
              print("Visible se cambió a $isVisible");
            });
          },
        ),
      ),
    );
  }
}