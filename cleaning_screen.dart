import 'package:flutter/material.dart';

import 'service_template_screen.dart';

class CleaningScreen extends StatelessWidget {
  const CleaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceTemplateScreen(
      title: 'نظافة',
      icon: Icons.cleaning_services,
      accentColor: Color(0xFF2E7D32),
      description: 'تنظيف شامل للمنازل والمكاتب باستخدام أدوات ومواد آمنة.',
      tasks: [
        'تنظيف عميق للأرضيات والأسطح',
        'تنظيف المطابخ والحمامات',
        'تنظيف الزجاج والشبابيك',
        'تعقيم الأماكن عالية الاستخدام',
      ],
      providers: [
        ServiceProvider(
          name: 'منة هشام',
          imageUrl: 'https://randomuser.me/api/portraits/women/28.jpg',
          rating: 4.9,
          completedJobs: 210,
        ),
        ServiceProvider(
          name: 'سارة مروان',
          imageUrl: 'https://randomuser.me/api/portraits/women/47.jpg',
          rating: 4.8,
          completedJobs: 188,
        ),
        ServiceProvider(
          name: 'ريم عادل',
          imageUrl: 'https://randomuser.me/api/portraits/women/62.jpg',
          rating: 4.7,
          completedJobs: 154,
        ),
      ],
    );
  }
}
