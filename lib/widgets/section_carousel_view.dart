import 'package:flutter/material.dart';

class SectionCarouselView extends StatelessWidget {
  const SectionCarouselView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: 5,
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                'Carousel $index',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
