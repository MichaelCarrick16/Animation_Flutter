import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // animation = Tween<double>(begin: 12.0, end: 50.0).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       print('HiepPD Animation');
    //     });
    //   });
    animation = Tween<double>(begin: 10.0, end: 50.0).animate(controller);
  }

  void increaseFontSize() {
    controller.isCompleted ? controller.reverse() : controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Flutter - tutorialkart.com')),
      ),
      body: ListView(children: <Widget>[
        AnimatedBuilder(
            animation: controller,
            builder: (context,child){
              return Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        'Hello! Welcome to TutorialKart. This is a basic demonstration of animation in Flutter.',
                        style: TextStyle(fontSize: animation.value),
                      )
                  ),
                  const SizedBox(height: 30),
                  Container(
                      margin: const EdgeInsets.all(20),
                      child: Text(
                        'This is a basic demonstration of animation in Flutter 2.',
                        style: TextStyle(fontSize: animation.value),
                      )
                  )
                ],
              );
            }
        ),
        RaisedButton(
          onPressed: () => {
            increaseFontSize()
          },
          child: const Text('Bigger Font'),
        )
      ]),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
