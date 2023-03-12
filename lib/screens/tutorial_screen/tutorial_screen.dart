import 'package:choozy/screens/home_screen/choozy_screen_design.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class TutorialScreen01 extends StatelessWidget {
  final String id = "tutorial_screen_01";
  const TutorialScreen01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(56.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: const [
                    SizedBox(
                      height: 110,
                      child: Text(
                        "Esta aplicación te ayuda a elegir",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                          shadows: <Shadow>[
                            Shadow(
                              blurRadius: 4.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "CHOOZY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 56,
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
                    Spacer(),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MaterialButton(
                      color: Colors.purple,
                      elevation: 10,
                      height: 40,
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TutorialScreen02(),
                          ),
                        );
                        // Navigator.pushNamed(context, const TutorialScreen02().id);
                      },
                      child: const Center(
                        child: Text(
                          "Siguiente",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TutorialScreen02 extends StatelessWidget {
  final String id = "tutorial_screen_02";
  const TutorialScreen02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(56.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 110,
                      child: Text(
                        "Basta con colocar dos o más dedos en la pantalla...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                          shadows: <Shadow>[
                            Shadow(
                              blurRadius: 4.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Hero(
                            tag: "hand_01",
                            child: SlideInLeft(
                              delay: const Duration(milliseconds: 200),
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_image_hand_01.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Hero(
                            tag: "hand_02",
                            child: SlideInRight(
                              delay: const Duration(milliseconds: 200),
                              duration: const Duration(milliseconds: 500),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_image_hand_02.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FadeIn(
                            delay: const Duration(milliseconds: 700),
                            duration: const Duration(milliseconds: 400),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/tutorial_image_pulsations.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MaterialButton(
                      color: Colors.purple,
                      elevation: 10,
                      height: 40,
                      onPressed: (){
                        //Navigator.pop(context);
                        Navigator.pushNamed(context, const TutorialScreen03().id);
                      },
                      child: const Center(
                        child: Text(
                          "Siguiente",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TutorialScreen03 extends StatelessWidget {
  final String id = "tutorial_screen_03";
  const TutorialScreen03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(56.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 110,
                      child: Text(
                        "Y deja que la aplicacion elija por ti",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                          shadows: <Shadow>[
                            Shadow(
                              blurRadius: 4.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Hero(
                            tag: "hand_02",
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/tutorial_image_hand_02.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          FadeOutLeft(
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 500),
                            child: Hero(
                              tag: "hand_01",
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/tutorial_image_hand_01.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FadeIn(
                            delay: const Duration(milliseconds: 200),
                            duration: const Duration(milliseconds: 500),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/tutorial_image_winner.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MaterialButton(
                      color: Colors.purple,
                      elevation: 10,
                      height: 40,
                      onPressed: (){
                        Navigator.pushNamed(context, const ChoozyScreenDesign().id);
                      },
                      child: const Center(
                        child: Text(
                          "Anterior",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}