import 'package:flutter/material.dart';
import 'package:sliver_section_loader/widgets/animation/section_animated_wrapper.dart';

class SliverSectionWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  const SliverSectionWrapper({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SectionAnimatedWrapper(child: child),
        ],
      ),
    );
  }
}
