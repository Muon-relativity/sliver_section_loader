import 'package:flutter/material.dart';

import 'section_item.dart';

class SectionItemBuilder extends StatelessWidget {
  final SectionItem item;

  const SectionItemBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context) => item.buildItem(context);
}
