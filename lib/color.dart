import 'package:flutter/material.dart';
import 'dart:math';

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() {
    return _ColorChangerState();
  }
}

class _ColorChangerState extends State<ColorChanger> {
  int red = 0;
  int green = 0;
  int blue = 0;
  AlignmentGeometry beginAlignment = Alignment.topLeft;
  AlignmentGeometry endAlignment = Alignment.bottomRight;
  int directionIndex = 0;

  void changeC() {
    setState(() {
      final random = Random();
      red = random.nextInt(256);
      green = random.nextInt(256);
      blue = random.nextInt(256);
    });
  }

  void changeD() {
    setState(() {
      directionIndex = (directionIndex + 1) % 4;

      switch (directionIndex) {
        case 0:
          beginAlignment = Alignment.topCenter;
          endAlignment = Alignment.bottomCenter;
          break;
        case 1:
          beginAlignment = Alignment.centerLeft;
          endAlignment = Alignment.centerRight;
          break;
        case 2:
          beginAlignment = Alignment.topLeft;
          endAlignment = Alignment.bottomRight;
          break;
        case 3:
          beginAlignment = Alignment.topRight;
          endAlignment = Alignment.bottomLeft;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, red, green, blue),
              Colors.black,
            ],
            begin: beginAlignment,
            end: endAlignment,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Red: $red',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Green: $green',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'Blue: $blue',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: changeC,
                    child: const Text('Change Color'),
                  ),
                  ElevatedButton(
                    onPressed: changeD,
                    child: const Text('Change Direction'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
