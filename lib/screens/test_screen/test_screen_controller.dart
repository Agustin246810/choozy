import 'package:choozy/screens/test_screen/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TestPageController extends ControllerMVC {
  static late TestPageController _this;

  factory TestPageController() {
    _this = TestPageController._();
    return _this;
  }

  void initPage() {
    _addGestureLayer();
  }

  void _addGestureLayer() {
    gestureLayers.add(
      GestureLayer(
        key: GlobalKey(),
        onTapStart: () => _addGestureLayer(),
        onTapEnd: (id) {
          for (int i = 0; i < gestureLayers.length; i++) {
            if (gestureLayers[i].id == id) {
              gestureLayers.removeAt(i);
            }
          }
          setState(() {});
        },
      ),
    );
    setState(() {});
  }

  static TestPageController get con => _this;
  TestPageController._();

  List<GestureLayer> gestureLayers = [];
}
