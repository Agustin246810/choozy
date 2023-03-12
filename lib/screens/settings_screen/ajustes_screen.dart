import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final String id = "ajustes_screen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text(
            "Ajustes",
            style: TextStyle(
              fontSize: 46,
              shadows: <Shadow>[
                Shadow(
                  blurRadius: 4.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          actions: [
            SizedBox(
              width: 50,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}