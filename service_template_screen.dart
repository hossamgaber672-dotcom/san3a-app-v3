import 'package:flutter/material.dart';

class ServiceProvider {
  final String name;
  final String imageUrl;
  final double rating;
  final int completedJobs;

  const ServiceProvider({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.completedJobs,
  });
}

class ServiceTemplateScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color accentColor;
  final String description;
  final List<String> tasks;
  final List<ServiceProvider> providers;

  const ServiceTemplateScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.accentColor,
    required this.description,
    required this.tasks,
    required this.providers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(icon, color: accentColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    description,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'أبرز الأعمال',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 10),
          ...tasks.map(
            (task) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline, color: accentColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(child: Text(task)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'الفنيين المتاحين',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 10),
          ...providers.map(
            (provider) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      provider.imageUrl,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return CircleAvatar(
                          radius: 24,
                          backgroundColor: accentColor.withOpacity(0.15),
                          child: Icon(Icons.person, color: accentColor),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'تقييم ${provider.rating} • ${provider.completedJobs} خدمة',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('تم اختيار ${provider.name} لخدمة $title'),
                        ),
                      );
                    },
                    child: const Text('اختيار'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تم إرسال طلب خدمة $title')),
                );
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text('احجز الآن'),
            ),
          ),
        ],
      ),
    );
  }
}
