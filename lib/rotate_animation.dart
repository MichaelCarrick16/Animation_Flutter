import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation _arrowAnimation;
  late AnimationController _arrowAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example Animations'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            firstChild(),
          ],
        ),
      ),
    );
  }

  Widget firstChild() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnimatedBuilder(
            animation: _arrowAnimationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _arrowAnimation.value,
                child: const Text(
                  'Hello! Welcome to TutorialKart. This is a basic demonstration of animation in Flutter.',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }),
        OutlinedButton(
            onPressed: () {
              _arrowAnimationController.isCompleted
                  ? _arrowAnimationController.reverse()
                  : _arrowAnimationController.forward();
            },
            child: const Text('Start Animation')
        )
      ],
    );
  }
}
