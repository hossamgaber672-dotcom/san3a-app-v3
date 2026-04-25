import 'package:flutter/material.dart';

import 'service_template_screen.dart';

class ElectricalScreen extends StatelessWidget {
  const ElectricalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceTemplateScreen(
      title: 'كهرباء',
      icon: Icons.electrical_services,
      accentColor: Color(0xFFF57F17),
      description: 'حلول الكهرباء المنزلية من فنيين متخصصين بسرعة وأمان.',
      tasks: [
        'إصلاح الأعطال الكهربائية',
        'تركيب مفاتيح وبرايز',
        'تأسيس وتمديدات كهرباء',
        'تركيب وحدات إضاءة حديثة',
      ],
      providers: [
        ServiceProvider(
          name: 'سامي طارق',
          imageUrl: 'https://randomuser.me/api/portraits/men/76.jpg',
          rating: 4.9,
          completedJobs: 196,
        ),
        ServiceProvider(
          name: 'خالد ربيع',
          imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg',
          rating: 4.8,
          completedJobs: 171,
        ),
        ServiceProvider(
          name: 'وائل كمال',
          imageUrl: 'https://randomuser.me/api/portraits/men/58.jpg',
          rating: 4.7,
          completedJobs: 133,
        ),
      ],
    );
  }
}
