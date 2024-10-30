import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gearbox/core/di.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:gearbox/core/utils/utils_common.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.read(localeNotifierProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.chooseLanguage,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: context.colorPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    locale.toString(),
                    textAlign: TextAlign.center,
                  ),
                  value: locale,
                  items: UtilsCommon.languages.map(
                    (language) {
                      return DropdownMenuItem<Locale>(
                        value: language['locale'],
                        child: Text(
                          language['name'],
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ).toList(),
                  iconStyleData: const IconStyleData(
                    iconEnabledColor: Colors.white,
                    iconDisabledColor: Colors.white,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      color: context.colorPrimary,
                    ),
                  ),
                  onChanged: (Locale? newLocale) =>
                      ref.read(localeNotifierProvider.notifier).setLocale(newLocale!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
