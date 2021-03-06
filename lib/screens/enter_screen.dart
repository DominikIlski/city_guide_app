import 'package:city_guide_app/providers/provider.dart';
import 'package:city_guide_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterScreen extends ConsumerStatefulWidget {
  const EnterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends ConsumerState<EnterScreen> {
  int? _dropdownValue;

  void _dropdownCallback(int? selected) {
    if (selected is int) {
      setState(() {
        _dropdownValue = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'City guide',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            DropdownButton<int?>(
                hint: const Text('Choose a City'),
                value: _dropdownValue,
                items: const [
                  DropdownMenuItem(
                    child: Text('Warsaw'),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    enabled: false,
                    child: Text(
                      'More comming soon...',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
                onChanged: _dropdownCallback),
            ElevatedButton(
                onPressed: _dropdownValue != null
                    ? () {
                      ref.watch(auth).signInAnonymously();
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }
                    : null,
                child: const Text('Log in and Continue...'))
          ],
        ),
      ),
    );
  }
}
