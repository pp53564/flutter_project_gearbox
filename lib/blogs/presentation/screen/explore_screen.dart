import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/gearbox_search_bar.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExploreScreen extends StatefulHookConsumerWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<StatefulHookConsumerWidget> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(context.explore, style: context.textTitle),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: GearboxSearchBar(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Users", style: context.textSmallTitle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
