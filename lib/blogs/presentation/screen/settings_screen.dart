import 'package:flutter/material.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Locale? _selectedLocale = Locale('en');
  final List<Map<String, dynamic>> _languages = [
    {'locale': Locale('en'), 'name': 'English'},
    {'locale': Locale('hr'), 'name': 'Croatian'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose language',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 50),
            DropdownButton(
              iconEnabledColor: context.colorPrimary,
              hint: Text(_selectedLocale.toString()),
              value: _selectedLocale,
              items: _languages.map(
                (language) {
                  return DropdownMenuItem<Locale>(
                    value: language['locale'],
                    child: Text(language['name']),
                  );
                },
              ).toList(),
              onChanged: (Locale? newValue) {
                setState(() {
                  _selectedLocale = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
