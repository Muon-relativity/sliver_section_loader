import 'package:flutter/material.dart';

import '../core/utils/delayed_loading_mixin.dart';

class SectionPageView extends StatefulWidget {
  const SectionPageView({super.key});

  @override
  State<SectionPageView> createState() => _SectionPageViewState();
}

class _SectionPageViewState extends State<SectionPageView> with DelayedLoadingView {
  @override
  Widget build(BuildContext context) {
    return buildWithLoading(
      SizedBox(
        height: 180,
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade200,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'Page $index',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement delay
  Duration get delay => const Duration(seconds: 3);
}
