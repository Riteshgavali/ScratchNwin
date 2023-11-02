// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//todo Import images

  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage lucky = const AssetImage("images/rupee.png");
  AssetImage unlucky = const AssetImage("images/sadFace.png");

//todo Get an array

  late List<String> itemArray;
  late int luckyNumber;

//todo Initialize array with 25 elements

  @override
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);

    setState(() {
      luckyNumber = random;
    });
  }

//todo Get Image Method

  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
        // ignore: dead_code
        break;

      case "unlucky":
        return unlucky;
        // ignore: dead_code
        break;
    }
    return circle;
  }

//todo Play Game method
  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = "lucky";
      });
    } else {
      setState(() {
        itemArray[index] = "unlucky";
      });
    }
  }

//todo Showall
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

//todo Reset all

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch and Win"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (Context, i) => SizedBox(
                width: 50.0,
                height: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(
                    image: getImage(i),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: MaterialButton(
              onPressed: () {
                showAll();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Show All",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: MaterialButton(
              onPressed: () {
                resetGame();
              },
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Reset",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
