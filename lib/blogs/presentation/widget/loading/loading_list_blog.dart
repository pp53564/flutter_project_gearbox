import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/loading/loading_card.dart';

class LoadingListBlog extends StatelessWidget {
  const LoadingListBlog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoadingCard(),
                LoadingCard(),
                LoadingCard(),
                LoadingCard(),
                LoadingCard(),
                LoadingCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
