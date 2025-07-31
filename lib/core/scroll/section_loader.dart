import 'package:flutter/material.dart';
import 'package:sliver_section_loader/core/scroll/auto_sliver_section_loader.dart';

import '../../widgets/section_carousel_view.dart';
import '../../widgets/section_item.dart';
import '../../widgets/section_item_builder.dart';
import '../../widgets/section_list_view.dart';
import '../../widgets/section_page_view.dart';
import '../../widgets/sliver_section_wrapper.dart';

class SliverLazyLoadPage extends StatefulWidget {
  const SliverLazyLoadPage({super.key});

  @override
  State<SliverLazyLoadPage> createState() => _SliverLazyLoadPageState();
}

class _SliverLazyLoadPageState extends State<SliverLazyLoadPage> {
  final List<SectionItem> sectionItems = [
    ImageItem('https://picsum.photos/200'),
    TextItem('이건 텍스트 아이템입니다'),
    ImageItem('https://picsum.photos/id/101/300/200'),
    CarouselItem(['Page 1', 'Page 2', 'Page 3']),
    CustomWidgetItem(
      Container(
        height: 100,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orange.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(child: Text("커스텀 위젯")),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AutoSliverSectionLoader(
            initialSectionCount: 1,
            maxSectionCount: 10,
            sectionBuilder: (index) {
              switch (index % 4) {
                case 0:
                  return const SliverSectionWrapper(title: 'PageView', child: SectionPageView());
                case 1:
                  return const SliverSectionWrapper(title: 'ListView', child: SectionListView());
                case 2:
                  return const SliverSectionWrapper(title: 'CarouselView', child: SectionCarouselView());
                case 3:
                default:
                  return SliverSectionWrapper(
                      title: 'Mixed Section List',
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: sectionItems.length,
                          itemBuilder: (context, index) {
                            return SectionItemBuilder(item: sectionItems[index]);
                          }));
              }
            }),
      ),
    );
  }
}
