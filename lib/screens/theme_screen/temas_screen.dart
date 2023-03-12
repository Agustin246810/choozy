import 'package:flutter/material.dart';

class TemmasScreen extends StatefulWidget {
  final String id = "temas_screen";
  const TemmasScreen({Key? key}) : super(key: key);

  @override
  State<TemmasScreen> createState() => _TemmasScreenState();
}

class _TemmasScreenState extends State<TemmasScreen> {
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
            "Temas",
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: listThemes,
          ),
        ),
      ),
    );
  }
}

class CustomListThemes extends StatefulWidget {
  final String titleList;
  final List<SquareButton> list;
  const CustomListThemes({
    Key? key,
    this.titleList = "Lista",
    required this.list,
  }) : super(key: key);
  
  @override
  State<CustomListThemes> createState() => _CustomListThemesState();
}

class _CustomListThemesState extends State<CustomListThemes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.titleList,
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
        ),
        SizedBox(
          height: 110,
          child: ListView.separated(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              return widget.list[index];
            },
          ),
        )
      ],
    );
  }
}

class SquareButton extends StatelessWidget {
  final Decoration decoration;
  final String titleButton;
  const SquareButton({
    Key? key,
    this.decoration = const BoxDecoration(
      color: Colors.purple,
    ),
    this.titleButton = "Color",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Container(
            width: 130,
            height: 90,
            decoration: decoration,
            child: MaterialButton(
              onPressed: (){},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                titleButton,
              ),
            ),
          ),
        ],
      )
    );
  }
}

const List<CustomListThemes> listThemes = [
  CustomListThemes(
    titleList: "Monocromatico",
    list: listMono,
  ),
  CustomListThemes(
    titleList: "Gradiente",
    list: listGradient,
  ),
  CustomListThemes(
    titleList: "Patron",
    list: []
  ),
];

const listMono = <SquareButton> [
  SquareButton(
    titleButton: "Purple",
    decoration: BoxDecoration(
      color: Colors.purple,
    ),
  ),
  SquareButton(
    titleButton: "Grey",
    decoration: BoxDecoration(
      color: Colors.grey,
    ),
  ),
  SquareButton(
    titleButton: "Indigo",
    decoration: BoxDecoration(
      color: Colors.indigo,
    ),
  ),
  SquareButton(
    titleButton: "Amber",
    decoration: BoxDecoration(
      color: Colors.amber,
    ),
  ),
  SquareButton(
    titleButton: "Green",
    decoration: BoxDecoration(
      color: Colors.green,
    ),
  ),
  SquareButton(
    titleButton: "Pink",
    decoration: BoxDecoration(
      color: Colors.pink,
    ),
  ),
];

const listGradient = <SquareButton> [
  SquareButton(
    titleButton: "Bloody Mary",
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Colors.orange,
          Colors.red,
          Colors.red,
        ],
        tileMode: TileMode.repeated,
      ),
    ),
  ),
  SquareButton(
    titleButton: "Sexy Blue",
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Colors.indigoAccent,
          Colors.lightBlueAccent,
          Colors.lightBlueAccent,
        ],
        tileMode: TileMode.repeated,
      ),
    ),
  ),
  SquareButton(
    titleButton: "Celestial",
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Colors.purple,
          Colors.pinkAccent,
          Colors.pinkAccent,
        ],
        tileMode: TileMode.repeated,
      ),
    ),
  ),
];
