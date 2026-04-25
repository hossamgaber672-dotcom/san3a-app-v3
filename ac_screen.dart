import 'package:flutter/material.dart';

import 'service_template_screen.dart';

class AcScreen extends StatelessWidget {
  const AcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceTemplateScreen(
      title: 'تكييف',
      icon: Icons.ac_unit,
      accentColor: Color(0xFF00838F),
      description: 'صيانة دورية وتنظيف وإصلاح أجهزة التكييف باحترافية.',
      tasks: [
        'تنظيف فلاتر ووحدات التكييف',
        'شحن فريون وفحص ضغط',
        'صيانة أعطال التبريد',
        'تركيب وفك وحدات تكييف',
      ],
      providers: [
        ServiceProvider(
          name: 'هشام بدوي',
          imageUrl: 'https://randomuser.me/api/portraits/men/61.jpg',
          rating: 4.9,
          completedJobs: 184,
        ),
        ServiceProvider(
          name: 'مينا سامح',
          imageUrl: 'https://randomuser.me/api/portraits/men/70.jpg',
          rating: 4.8,
          completedJobs: 160,
        ),
        ServiceProvider(
          name: 'إبراهيم زكي',
          imageUrl: 'https://randomuser.me/api/portraits/men/80.jpg',
          rating: 4.7,
          completedJobs: 136,
        ),
      ],
    );
  }
}
