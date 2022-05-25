import 'package:city_guide_app/models/base_info.dart';
import 'package:city_guide_app/screens/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemCard extends ConsumerWidget {
  final String title;
  final String desc;
  final Icon type;
  final String image;
  final BaseInfo item;
  const ItemCard(
      {required this.title,
      required this.type,
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
            MaterialPageRoute(builder: (context) => DescriptionScreen(item))),
        child: Card(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              image,
              height: 75,
              fit: BoxFit.contain,
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
            Flexible(
                child: Center(
              child: type,
            ))
          ],
        )),
      ),
    );
  }
}
