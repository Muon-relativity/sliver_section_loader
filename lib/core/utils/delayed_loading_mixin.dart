import 'dart:async';

import 'package:flutter/material.dart';

abstract class DelayedLoadable {
  Duration get delay;
}

mixin DelayedLoadingView<T extends StatefulWidget> on State<T> implements DelayedLoadable {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(delay).then((_) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Widget buildWithLoading(Widget child) {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return child;
  }
}
