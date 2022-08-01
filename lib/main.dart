import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 114, 114, 189),
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 114, 114, 189),
            elevation: 8,
            title: Text("Roll the Dice"),
            centerTitle: true,
          ),
          body: BodyPage()),
    );
  }
}

class BodyPage extends StatefulWidget {
  const BodyPage({Key? key}) : super(key: key);

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  int leftdicenumber = 1;
  int rightdicenumber = 1;

  @override
  Widget build(BuildContext context) {
    var changedicenumber = () {
      setState(() {
        leftdicenumber = Random().nextInt(6) + 1;
        rightdicenumber = Random().nextInt(6) + 1;
      });
    };
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        changedicenumber();
                      });
                    },
                    child: Image.asset("assets/dice/dice$leftdicenumber.png")),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        changedicenumber();
                      });
                    },
                    child: Image.asset("assets/dice/dice$rightdicenumber.png")),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Tap on the dice to roll it",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
