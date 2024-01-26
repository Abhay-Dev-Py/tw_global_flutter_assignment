import 'package:flutter/material.dart';

class ShakeError extends StatefulWidget {
  final Widget child;

  const ShakeError({Key? key, required this.child}) : super(key: key);

  @override
  ShakeErrorState createState() => ShakeErrorState();
}

class ShakeErrorState extends State<ShakeError>
    with SingleTickerProviderStateMixin {
  late Animation<double> _doubleAnim;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 60),
      vsync: this,
    );
    _doubleAnim = Tween(begin: -5.0, end: 5.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_doubleAnim.value, 0),
      child: widget.child,
    );
  }

  Future<void> shake() async {
    await _animationController
        .forward(from: 0)
        .then((value) => _animationController.reverse());
    await _animationController
        .forward(from: 0)
        .then((value) => _animationController.reverse());
    await _animationController
        .forward(from: 0)
        .then((value) => _animationController.reverse());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
