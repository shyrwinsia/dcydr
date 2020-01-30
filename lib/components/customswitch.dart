library custom_switch;

import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final double width;
  final double height;
  final double padding;
  final double distance;
  final Gradient activeGradient;
  final Gradient inactiveGradient;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    @required this.value,
    this.activeGradient = const LinearGradient(colors: [
      const Color(0xFF1aa7cb),
      const Color(0xFF2297cb),
    ]),
    this.inactiveGradient = const LinearGradient(colors: [
      const Color(0x55000000),
      const Color(0x66000000),
    ]),
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.white,
    this.width = 32.0,
    this.padding = 1.0,
    this.onChanged,
  })  : assert(width > 0),
        this.distance = (width / 2) - padding,
        this.height = width / 2;

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _animation = Tween<double>(
      begin: widget.value ? this.widget.distance : 0,
      end: widget.value ? 0 : this.widget.distance,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    print(this.widget.value);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: this.widget.width,
              height: this.widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(this.widget.height),
                gradient: _animation.value == 0
                    ? this.widget.inactiveGradient
                    : this.widget.activeGradient,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: _animation.value,
                  ),
                  Padding(
                    padding: EdgeInsets.all(this.widget.padding),
                    child: Container(
                      height: this.widget.height - this.widget.padding,
                      width: this.widget.height - this.widget.padding,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: this.widget.value
                            ? this.widget.activeColor
                            : this.widget.inactiveColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
}
