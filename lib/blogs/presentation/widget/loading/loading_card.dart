import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_placeholder_card.dart';
import 'package:gearbox/core/style/style_extensions.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 2,
      color: context.colorBackground,
      shadowColor: const Color(0x59DADADA),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 130,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlaceholderCard(height: 10, width: 50),
                    SizedBox(height: 8),
                    PlaceholderCard(height: 40, width: 200),
                    Spacer(),
                    PlaceholderCard(height: 10, width: 100),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  PlaceholderCard(height: 100, width: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
