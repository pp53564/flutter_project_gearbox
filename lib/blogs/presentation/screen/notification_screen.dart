import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/notification_row.dart';
import 'package:gearbox/core/localization_extension.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      const NotificationRow(
        avatarUrl: 'assets/images/profile_picture.png',
        username: '@theresawalter',
        text: 'liked your blog.',
        imageBlogUrl: 'assets/images/car4.png',
      ),
      const NotificationRow(
        avatarUrl: 'assets/images/profile_picture3.png',
        username: '@tomtainor',
        text: 'liked your blog.',
        imageBlogUrl: 'assets/images/car4.png',
      ),
      const NotificationRow(
        avatarUrl: 'assets/images/profile_picture3.png',
        username: '@tomtainor',
        text: 'commented on your blog.',
        imageBlogUrl: 'assets/images/car4.png',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.notifications,
                style: context.textTitle,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: notifications.map((notification) => notification).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
