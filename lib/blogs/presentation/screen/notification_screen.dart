import 'package:flutter/material.dart';
import 'package:gearbox/blogs/presentation/widget/notification_row.dart';
import 'package:gearbox/core/style/style_extensions.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      NotificationRow(
        avatarUrl: 'assets/images/profile_picture.png',
      ),
      NotificationRow(
        avatarUrl: 'assets/images/profile_picture3.png',
      ),
      NotificationRow(
        avatarUrl: 'assets/images/profile_picture3.png',
      ),
      NotificationRow(
        avatarUrl: 'assets/images/profile_picture3.png',
      ),
      NotificationRow(
        avatarUrl: 'assets/images/profile_picture3.png',
      ),
      NotificationRow(
        avatarUrl: 'assets/images/profile_picture3.png',
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notifications',
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
