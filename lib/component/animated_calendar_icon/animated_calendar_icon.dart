import 'package:flutter/material.dart';

/// [AnimatedCalendarIcon]
/// Component to create the animated calendar icon.
class AnimatedCalendarIcon extends StatefulWidget {
  @override
  _AnimatedCalendarIconState createState() => _AnimatedCalendarIconState();
}

class _AnimatedCalendarIconAnimation extends AnimatedWidget {
  const _AnimatedCalendarIconAnimation({
    Key key,
    AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Stack(children: [
        Transform.scale(
          scale: _progress.value,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Icon(
            Icons.calendar_today,
            color: Colors.blue,
          ),
        ),
      ]),
    );
  }
}

class _AnimatedCalendarIconState extends State<AnimatedCalendarIcon>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
        lowerBound: 0.7)
      ..repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AnimatedCalendarIconAnimation(
      controller: _controller,
    );
  }
}
