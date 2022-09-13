import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen>
    with TickerProviderStateMixin {
  late Animation _containerRadiusAnimation,
      _containerSizeAnimation,
      _containerColorAnimation;
  late AnimationController _containerAnimationController;

  @override
  void initState() {
    super.initState();
    _containerAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    _containerRadiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(100.0), end: BorderRadius.circular(0))
        .animate(_containerAnimationController);
    _containerSizeAnimation =
        Tween(begin: 0.0, end: 2.0).animate(_containerAnimationController);
    _containerColorAnimation =
        ColorTween(begin: Colors.black, end: Colors.white)
            .animate(_containerAnimationController);
    _containerAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Screen'),
        ),
        body: Center(
          child: AnimatedBuilder(
            animation: _containerAnimationController,
            builder: (context, index) {
              return Container(
                width: _containerSizeAnimation.value *
                    MediaQuery.of(context).size.width,
                height: _containerSizeAnimation.value *
                    MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: _containerRadiusAnimation.value,
                    color: _containerColorAnimation.value),
              );
            },
          ),
        ),
      ),
    );
  }
}
