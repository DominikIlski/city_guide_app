import 'package:city_guide_app/components/item_card.dart';
import 'package:city_guide_app/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SleepScreen extends ConsumerStatefulWidget {
  const SleepScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SleepScreenState();
}

class _SleepScreenState extends ConsumerState<SleepScreen> {
  @override
  Widget build(BuildContext context) {
    var sleeps = ref.watch(accomodation_provider);
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView.separated(
          itemBuilder: ((ctx, i) {
            var item = sleeps[i];
            return Card(
              child: ItemCard(
                title: item.name,
                desc: item.description,
                image: item.images[0],
                type: Icon(Icons.event_note_outlined),
                item: item,
                key: Key(i.toString()),
              ),
            );
          }),
          separatorBuilder: (ctx, i) => Divider(),
          itemCount: sleeps.length),
    );
  }
}
