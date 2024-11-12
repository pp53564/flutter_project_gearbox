import 'package:flutter/material.dart';
import 'package:gearbox/common/presentation/widget/button/gearbox_back_button.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class GearboxAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  @override
  final Size preferredSize;

  const GearboxAppbar({super.key, this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 110,
      backgroundColor: context.colorBackground,
      title: title != null ? Text(title!, style: context.textTitleCard) : null,
      centerTitle: true,
      leading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GearboxBackButton(),
      ),
    );
  }
}
