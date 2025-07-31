import 'package:flutter/material.dart';

class SectionAnimatedWrapper extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset offset;

  const SectionAnimatedWrapper({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.offset = const Offset(0, 0.1), // 아래에서 살짝 올라오는 애니메이션
  });

  @override
  State<SectionAnimatedWrapper> createState() => _SectionAnimatedWrapperState();
}

class _SectionAnimatedWrapperState extends State<SectionAnimatedWrapper> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animation;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _animation,
        child: widget.child,
      ),
    );
  }
}
