import 'package:flutter/material.dart';

import 'auto_section_loader_controller.dart';

typedef SliverSectionBuilder = Widget Function(int index);

class AutoSliverSectionLoader extends StatefulWidget {
  final int initialSectionCount;
  final int maxSectionCount;
  final SliverSectionBuilder sectionBuilder;
  final ScrollController? controller;
  final bool debugLog;

  const AutoSliverSectionLoader({
    super.key,
    required this.initialSectionCount,
    required this.maxSectionCount,
    required this.sectionBuilder,
    this.controller,
    this.debugLog = true,
  });

  @override
  State<AutoSliverSectionLoader> createState() => _AutoSliverSectionLoaderState();
}

class _AutoSliverSectionLoaderState extends State<AutoSliverSectionLoader> {
  late ScrollController _scrollController;
  int _currentSection = 0;
  late AutoSectionLoaderController _loaderController;

  bool get _canLoadMore => _currentSection < widget.maxSectionCount;

  @override
  void initState() {
    super.initState();
    _currentSection = widget.initialSectionCount;
    _scrollController = widget.controller ?? ScrollController();

    _scrollController.addListener(_handleScroll);

    _loaderController = AutoSectionLoaderController(
      scrollController: _scrollController,
      maxSectionCount: widget.maxSectionCount,
      getCurrentSectionCount: () => _currentSection,
      onSectionAdded: (next) {
        setState(() {
          _currentSection = next;
        });
      },
      debugLog: widget.debugLog,
    );

    _loaderController.start();
  }

  void _handleScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    const delta = 300.0;

    if (_canLoadMore && currentScroll > maxScroll - delta) {
      setState(() {
        _currentSection++;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: List.generate(_currentSection, widget.sectionBuilder),
    );
  }
}
