import 'package:flutter/material.dart';

class TapAbleWidget extends StatefulWidget {
  final Function onTap;
  final Widget child;

  const TapAbleWidget({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  _TapAbleWidgetState createState() => _TapAbleWidgetState();
}

class _TapAbleWidgetState extends State<TapAbleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween(begin: 1.0, end: 0.92).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          tapped();
        }
      });

    super.initState();
  }

  void tapped() {
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        onTap: () => _controller.forward(),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
