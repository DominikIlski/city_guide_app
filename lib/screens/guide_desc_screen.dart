import 'package:city_guide_app/components/item_card.dart';
import 'package:city_guide_app/providers/guide_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuideDescScreen extends ConsumerStatefulWidget {
  final Guide guide;

  const GuideDescScreen(this.guide, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GuideDescScreenState();
}

class _GuideDescScreenState extends ConsumerState<GuideDescScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.guide.name),
        backgroundColor: Colors.green[300],
      ),
      body: ListView.separated(
          itemBuilder: ((ctx, i) {
            var item = widget.guide.list[i];
            return Card(
              child: ItemCard(
                title: item.name,
                desc: item.description,
                image: item.images[0],
                type: item.typeIcon,
                item: item,
                key: Key(i.toString()),
              ),
            );
          }),
          separatorBuilder: (ctx, i) => Divider(),
          itemCount: widget.guide.list.length),
    );
  }
}
