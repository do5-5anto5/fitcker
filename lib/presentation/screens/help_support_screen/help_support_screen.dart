import 'package:flutter/material.dart';

import 'components/expandable_faq.dart';
import 'components/support_section.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: ListView(
        children: [
          const SupportSection(
            title: 'Frequently Asked Questions',
            children: [
              ExpandableFAQ(
                question: 'How do I track my workouts?',
                answer:
                    'To track your workouts, go to the home screen and tap the "+" button. Fill in your workout details and save.',
              ),
              ExpandableFAQ(
                question: 'How do I view my progress?',
                answer:
                    'Your progress is displayed on the home screen through the calendar graph. Each colored cell represents a workout day.',
              ),
              ExpandableFAQ(
                question: 'Can I edit my profile?',
                answer:
                    'Yes! Go to Profile tab and tap "Edit Profile" to update your information.',
              ),
            ],
          ),
          const Divider(),
          SupportSection(
            title: 'Contact Support',
            children: [
              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: const Text('Email Support'),
                subtitle: const Text('support@fitnesstracker.com'),
                onTap: () {
                  // TODO: Implement email support
                },
              ),
              ListTile(
                leading: const Icon(Icons.chat_outlined),
                title: const Text('Live Chat'),
                subtitle: const Text('Chat with our support team'),
                onTap: () {
                  // TODO: Implement live chat
                },
              ),
            ],
          ),
          const Divider(),
          SupportSection(
            title: 'Resources',
            children: [
              ListTile(
                leading: const Icon(Icons.book_outlined),
                title: const Text('User Guide'),
                onTap: () {
                  // TODO: Implement user guide
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_library_outlined),
                title: const Text('Video Tutorials'),
                onTap: () {
                  // TODO: Implement video tutorials
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
