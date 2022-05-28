import 'package:cached_network_image/cached_network_image.dart';
import 'package:city_guide_app/models/base_info.dart';
import 'package:city_guide_app/screens/description_screen.dart';
import 'package:city_guide_app/screens/guide_desc_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/guide_provider.dart';

class GuideCard extends ConsumerWidget {
  final String title;
  final String desc;
  final String image;
  final Guide item;
  const GuideCard(
      {required this.title,
      required this.image,
      required this.desc,
      required this.item,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 80,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => GuideDescScreen(item))),
        child: Card(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            CachedNetworkImage(
              width: 100,
              fit: BoxFit.contain,
              imageUrl: image,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 150,
                        child: Text(
                          desc,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textWidthBasis: TextWidthBasis.parent,
                        ))
                  ]),
            ),
          ],
        )),
      ),
    );
  }
}
