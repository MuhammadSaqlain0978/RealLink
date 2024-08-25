import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Notification', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffFF7E5F).withOpacity(0.6),
                borderRadius: BorderRadius.circular(12)),
            child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(
                  CupertinoIcons.back,
                  size: 28.sp,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ongoing Booking',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            buildNotificationItem(
              icon: Icons.error_outline,
              iconColor: Colors.redAccent,
              title: 'Your Request is Being Processed',
              time: '10:45 AM, 20 Mar 202X',
              onTap: () {
                // Handle the tap
                print('First Notification Clicked');
              },
            ),
            const SizedBox(height: 16),
            buildNotificationItem(
              icon: Icons.chat_bubble_outline,
              iconColor: Colors.orangeAccent,
              title: 'Agent Kunle Replied to Your Message',
              time: '12:29 PM, 27 Mar 202X',
              onTap: () {
                // Handle the tap
                print('Second Notification Clicked');
              },
            ),
            const SizedBox(height: 16),
            buildNotificationItem(
              icon: Icons.check_circle_outline,
              iconColor: Colors.greenAccent,
              title: 'House Posted Successfully',
              time: '08:48 PM, 04 Apr 202X',
              onTap: () {
                // Handle the tap
                print('Third Notification Clicked');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String time,
    required VoidCallback onTap,
    double iconSize = 24.0,
    TextStyle? titleStyle,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF2E7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: iconSize),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle ??
                        const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
