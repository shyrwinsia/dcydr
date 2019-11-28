import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final double fromAlpha, toAlpha;
  final int duration;

  FadeIn({@required this.child, fromAlpha, toAlpha, duration})
      : this.fromAlpha = fromAlpha ?? 0.0,
        this.toAlpha = toAlpha ?? 1.0,
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
      begin: this.widget.fromAlpha,
      end: this.widget.toAlpha,
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
    _controller.forward(from: this.widget.fromAlpha);
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
  final double fromAlpha, toAlpha;
  final int duration;

  FadeOut({@required this.child, fromAlpha, toAlpha, duration})
      : this.fromAlpha = fromAlpha ?? 1.0,
        this.toAlpha = toAlpha ?? 0.0,
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
      begin: this.widget.fromAlpha,
      end: this.widget.toAlpha,
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
    _controller.forward(from: this.widget.fromAlpha);
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
