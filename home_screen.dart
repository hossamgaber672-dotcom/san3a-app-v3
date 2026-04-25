import 'package:flutter/material.dart';

import 'services/ac_screen.dart';
import 'services/carpentry_screen.dart';
import 'services/cleaning_screen.dart';
import 'services/electrical_screen.dart';
import 'services/painting_screen.dart';
import 'services/plumbing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الرئيسية'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'أهلاً بك في صنعة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'اختار الخدمة المناسبة ليك واضغط عليها',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'الخدمات',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              children: [
                _ServiceCard(
                  title: 'سباكة',
                  subtitle: 'صيانة مواسير وتسريب',
                  icon: Icons.plumbing,
                  color: const Color(0xFFE3F2FD),
                  onTap: () => _open(context, const PlumbingScreen()),
                ),
                _ServiceCard(
                  title: 'كهرباء',
                  subtitle: 'أعطال وتمديدات',
                  icon: Icons.electrical_services,
                  color: const Color(0xFFFFF8E1),
                  onTap: () => _open(context, const ElectricalScreen()),
                ),
                _ServiceCard(
                  title: 'نظافة',
                  subtitle: 'تنظيف شامل للمنازل',
                  icon: Icons.cleaning_services,
                  color: const Color(0xFFE8F5E9),
                  onTap: () => _open(context, const CleaningScreen()),
                ),
                _ServiceCard(
                  title: 'نجارة',
                  subtitle: 'تصليح وتجميع أثاث',
                  icon: Icons.handyman,
                  color: const Color(0xFFFFF3E0),
                  onTap: () => _open(context, const CarpentryScreen()),
                ),
                _ServiceCard(
                  title: 'نقاشة',
                  subtitle: 'دهانات وتشطيب',
                  icon: Icons.format_paint,
                  color: const Color(0xFFF3E5F5),
                  onTap: () => _open(context, const PaintingScreen()),
                ),
                _ServiceCard(
                  title: 'تكييف',
                  subtitle: 'صيانة وتنظيف تكييف',
                  icon: Icons.ac_unit,
                  color: const Color(0xFFE0F7FA),
                  onTap: () => _open(context, const AcScreen()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _open(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Icon(icon),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
