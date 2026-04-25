import 'package:flutter/material.dart';

import 'service_template_screen.dart';

class CarpentryScreen extends StatelessWidget {
  const CarpentryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceTemplateScreen(
      title: 'نجارة',
      icon: Icons.handyman,
      accentColor: Color(0xFFEF6C00),
      description: 'خدمات النجارة المنزلية لتصليح وتجميع وتعديل الأثاث.',
      tasks: [
        'تصليح الأبواب والخزائن',
        'تجميع غرف النوم والمكاتب',
        'تعديل وفك وتركيب الأثاث',
        'صيانة مفصلات وأدراج',
      ],
      providers: [
        ServiceProvider(
          name: 'ياسر جلال',
          imageUrl: 'https://randomuser.me/api/portraits/men/23.jpg',
          rating: 4.9,
          completedJobs: 173,
        ),
        ServiceProvider(
          name: 'حازم شريف',
          imageUrl: 'https://randomuser.me/api/portraits/men/54.jpg',
          rating: 4.8,
          completedJobs: 149,
        ),
        ServiceProvider(
          name: 'عمر فؤاد',
          imageUrl: 'https://randomuser.me/api/portraits/men/88.jpg',
          rating: 4.7,
          completedJobs: 132,
        ),
      ],
    );
  }
}
