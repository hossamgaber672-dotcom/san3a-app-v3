import 'package:flutter/material.dart';

import 'service_template_screen.dart';

class PaintingScreen extends StatelessWidget {
  const PaintingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceTemplateScreen(
      title: 'نقاشة',
      icon: Icons.format_paint,
      accentColor: Color(0xFF7B1FA2),
      description: 'خدمة النقاشة والدهانات الداخلية والخارجية بألوان عصرية.',
      tasks: [
        'دهانات داخلية كاملة',
        'معالجة تشققات الجدران',
        'تجديد الدهانات القديمة',
        'تشطيب نهائي احترافي',
      ],
      providers: [
        ServiceProvider(
          name: 'طارق أمين',
          imageUrl: 'https://randomuser.me/api/portraits/men/44.jpg',
          rating: 4.9,
          completedJobs: 190,
        ),
        ServiceProvider(
          name: 'إياد فتحي',
          imageUrl: 'https://randomuser.me/api/portraits/men/15.jpg',
          rating: 4.8,
          completedJobs: 167,
        ),
        ServiceProvider(
          name: 'رامي صلاح',
          imageUrl: 'https://randomuser.me/api/portraits/men/95.jpg',
          rating: 4.7,
          completedJobs: 140,
        ),
      ],
    );
  }
}
