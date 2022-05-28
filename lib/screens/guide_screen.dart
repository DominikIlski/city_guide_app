import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/guide_card.dart';
import '../providers/provider.dart';

class GuideScreen extends ConsumerStatefulWidget {
  GuideScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends ConsumerState<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    var guides = ref.watch(guide_provider);
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView.separated(
          itemBuilder: ((ctx, i) {
            var item = guides[i];
            return Card(
              child: GuideCard(
                title: item.name,
                desc: item.description,
                image: item.list[0].images[1],
                item: item,
                key: Key(i.toString()),
              ),
            );
          }),
          separatorBuilder: (ctx, i) => Divider(),
          itemCount: guides.length),
    );
  }
}
