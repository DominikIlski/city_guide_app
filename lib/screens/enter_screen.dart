import 'package:city_guide_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class EnterScreen extends StatefulWidget {
  const EnterScreen({Key? key}) : super(key: key);

  @override
  State<EnterScreen> createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
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
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
                child: Text('Continue'))
          ],
        ),
      ),
    );
  }
}
