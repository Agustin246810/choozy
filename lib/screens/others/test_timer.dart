// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:simple_timer/simple_timer.dart';

class TestTimer extends StatefulWidget {
  const TestTimer({Key? key}) : super(key: key);

  @override
  State<TestTimer> createState() => _TestTimerState();
}

class _TestTimerState extends State<TestTimer> with SingleTickerProviderStateMixin {

  late TimerController _timerController;

  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  void dispose() {
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(40),
                child: SimpleTimer(
                  duration: const Duration(seconds: 4),
                  controller: _timerController,
                  onStart: handleTimerOnStart,
                  onEnd: handleTimerOnEnd,
                  backgroundColor: Colors.grey.withOpacity(.2),
                  progressIndicatorColor: Colors.white.withOpacity(.2),
                  progressTextStyle: TextStyle(color: Colors.grey.withOpacity(.2)),
                  strokeWidth: 20,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                const Text("Timer Status", textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextButton(
                      onPressed: _timerController.start,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green
                      ),
                      child: const Text("Start", style: TextStyle(color: Colors.white))
                    ),
                    TextButton(
                      onPressed: _timerController.restart,
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.orange
                      ),
                      child: const Text("Restart", style: TextStyle(color: Colors.white))
                    ),
                  ],
                )
              ],
            ),
          ],
        )
      ),
    ),
    );
  }

  void handleTimerOnStart() {
    print("timer has just started");
  }

  void handleTimerOnEnd() {
    print("timer has ended");
  }
}