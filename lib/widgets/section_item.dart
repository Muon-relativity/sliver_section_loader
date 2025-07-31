import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

abstract class SectionItem {
  Widget buildItem(BuildContext context);
}

class TextItem extends SectionItem {
  final String text;
  TextItem(this.text);

  @override
  Widget buildItem(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text(text, style: const TextStyle(fontSize: 20)),
      );
}

class ImageItem extends SectionItem {
  final String imageUrl;
  ImageItem(this.imageUrl);

  @override
  Widget buildItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: StatefulBuilder(
        builder: (context, setState) {
          return CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(height: 200, color: Colors.white),
                );
              },
              errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 100),
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) {
                return Image(image: imageProvider, fit: BoxFit.cover);
              });
        },
      ),
    );
  }
}

class CarouselItem extends SectionItem {
  final List<String> items;
  CarouselItem(this.items);

  @override
  Widget buildItem(BuildContext context) => SizedBox(
        height: 150,
        child: PageView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.primaries[index % Colors.primaries.length],
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(child: Text(items[index])),
          ),
        ),
      );
}

class CustomWidgetItem extends SectionItem {
  final Widget widget;
  CustomWidgetItem(this.widget);

  @override
  Widget buildItem(BuildContext context) => widget;
}
