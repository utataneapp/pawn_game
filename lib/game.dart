import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class _GameState extends State<Game> {
  List myPos = [0, 0];
  List enemyPos = [5, 5];
  String colorCode = "797979";
  void movePawn(String dir) {
    switch (dir) {
      case "↑":
        myPos[1] += 1;
        break;
      case "←":
        myPos[0] -= 1;
        break;
      case "→":
        myPos[0] += 1;
        break;
      case "↓":
        myPos[1] -= 1;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(colorCode),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  movePawn('↑');
                },
                child: Text('↑')),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        movePawn('←');
                      },
                      child: Text('←')),
                  ElevatedButton(
                      onPressed: () {
                        movePawn('→');
                      },
                      child: Text('→')),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  movePawn('↓');
                },
                child: Text('↓')),
          ],
        ),
      ),
    );
  }
}
