import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'core/scroll/section_loader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver Lazy Loader Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SliverLazyLoadPage(),
    );
  }
}
