import 'package:ColorSwap/components/logo_container.dart';
import 'package:ColorSwap/functional/color_generation.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin, ColorGeneration {
  ///create controller for an animation
  AnimationController _controller;

  ///create a variable for motion tween
  Animation<double> _rotation;
  Animation<double> _moveX;
  Animation<double> _moveY;
  Animation<double> _scale;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
// spin container
    _rotation = Tween(begin: 0.0, end: 30.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    ///resizes the container
    _scale = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
    // moves the animation container to the x coordita
    _moveX = Tween(begin: 0.0, end: 290.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    /// moves the animation container to the right
    _moveY = Tween(begin: 30.0, end: 645.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutQuad));

    /// add to controller reverse function when controller status is completed
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    /// destroy controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //starting animation
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
        child: LogoContainer(), //container that is animated
        builder: (context, childContainer) {
          return Transform.translate(
            offset: Offset(-140.0, -350),
            child: Transform.translate(
                offset: Offset(
                  _moveX.value,
                  0.0,
                ),
                child: Transform.translate(
                    offset: Offset(0.0, _moveY.value - 20),
                    child: Transform.rotate(
                        angle: _rotation.value,
                        child: Transform.scale(
                          scale: _scale.value,
                          child: childContainer,
                        )))),
          );
        });
  }
}
