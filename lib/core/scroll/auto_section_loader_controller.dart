import 'dart:async';

import 'package:flutter/widgets.dart';

class AutoSectionLoaderController {
  final ScrollController scrollController;
  final int maxSectionCount;
  final int Function() getCurrentSectionCount; // ✅ getter로 변경
  final void Function(int nextSection) onSectionAdded;
  final bool debugLog;

  bool _isAutoLoading = false;

  AutoSectionLoaderController({
    required this.scrollController,
    required this.getCurrentSectionCount,
    required this.maxSectionCount,
    required this.onSectionAdded,
    this.debugLog = false,
  });

  void start() {
    Future.microtask(() => _autoLoadIfNeeded());
  }

  void _autoLoadIfNeeded() {
    final currentCount = getCurrentSectionCount();
    if (_isAutoLoading || currentCount >= maxSectionCount) return;
    if (!scrollController.hasClients) return;

    _isAutoLoading = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!scrollController.hasClients) {
        _isAutoLoading = false;
        return;
      }

      if (debugLog) debugPrint('[AutoLoader] Checking scroll position...');

      final canScroll = scrollController.position.maxScrollExtent > 0;

      if (debugLog) {
        debugPrint('[AutoLoader] Current section count: $currentCount');
        debugPrint('[AutoLoader] Can scroll: $canScroll');
      }

      if (!canScroll) {
        final next = currentCount + 1;
        if (debugLog) debugPrint('[AutoLoader] Load section $next');
        onSectionAdded(next);

        _isAutoLoading = false;
        _autoLoadIfNeeded();
      } else {
        _isAutoLoading = false;
      }
    });
  }
}
