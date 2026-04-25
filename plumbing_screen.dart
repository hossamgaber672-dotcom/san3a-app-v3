import 'package:flutter/material.dart';

import 'service_template_screen.dart';

class PlumbingScreen extends StatelessWidget {
  const PlumbingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceTemplateScreen(
      title: 'سباكة',
      icon: Icons.plumbing,
      accentColor: Color(0xFF1565C0),
      description: 'خدمة سباكة متكاملة لإصلاح التسريبات وتركيب وصيانة المواسير.',
      tasks: [
        'إصلاح تسريب الأحواض والحنفيات',
        'تغيير المواسير التالفة',
        'تسليك الأحواض والبالوعات',
        'تركيب خلاطات ومحابس جديدة',
      ],
      providers: [
        ServiceProvider(
          name: 'أحمد حسن',
          imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
          rating: 4.9,
          completedJobs: 182,
        ),
        ServiceProvider(
          name: 'محمود سعد',
          imageUrl: 'https://randomuser.me/api/portraits/men/41.jpg',
          rating: 4.8,
          completedJobs: 145,
        ),
        ServiceProvider(
          name: 'محمد ناصر',
          imageUrl: 'https://randomuser.me/api/portraits/men/65.jpg',
          rating: 4.7,
          completedJobs: 127,
        ),
      ],
    );
  }
}
