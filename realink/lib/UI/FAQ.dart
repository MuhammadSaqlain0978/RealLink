import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
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
                        context.pop();
                      }),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            buildFAQItem(
              'What is Realink Really About?',
              'Realink is a platform that connects users with real estate services...',
            ),
            buildFAQItem(
              'What regions is it Available in?',
              'Realink is available in multiple regions across the globe...',
            ),
            buildFAQItem(
              'How does payment Work?',
              'You can make payments via multiple methods...',
            ),
            buildFAQItem(
              'Can I Chat with agents & Landlords?',
              'Yes, users can chat directly with agents and landlords...',
            ),
            buildFAQItem(
              'Who can use the RealinkApp?',
              'Anyone can use the Realink app to find properties...',
            ),
            buildFAQItem(
              'How can I Check my Balance?',
              'Users can check their balance in the account section of the app...',
            ),
            buildFAQItem(
              'Can I see live video of House?',
              'Yes, live video tours of houses are available...',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFAQItem(String question, String answer) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFF5EE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ExpansionTile(
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                answer,
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
