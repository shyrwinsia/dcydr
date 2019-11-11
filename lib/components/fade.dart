import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final double from, to;
  final int duration;

  FadeIn({@required this.child, from, to, duration})
      : this.from = from ?? 0.0,
        this.to = to ?? 1.0,
        this.duration = duration ?? 200;

  @override
  createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: this.widget.duration),
    );

    _animation = Tween(
      begin: this.widget.from,
      end: this.widget.to,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FadeIn oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.forward(from: this.widget.from);
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

class FadeOut extends StatefulWidget {
  final Widget child;
  final double from, to;
  final int duration;

  FadeOut({@required this.child, from, to, duration})
      : this.from = from ?? 1.0,
        this.to = to ?? 0.0,
        this.duration = duration ?? 200;

  @override
  createState() => _FadeOutState();
}

class _FadeOutState extends State<FadeOut> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: this.widget.duration),
    );

    _animation = Tween(
      begin: this.widget.from,
      end: this.widget.to,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(FadeOut oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.forward(from: this.widget.from);
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
