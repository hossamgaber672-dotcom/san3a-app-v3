import 'package:flutter/material.dart';

import 'account_store.dart';

class PrivacySecurityScreen extends StatelessWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخصوصية والأمان'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: accountStore,
        builder: (context, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _SwitchCard(
                title: 'التحقق بخطوتين',
                subtitle: 'حماية إضافية عند تسجيل الدخول',
                value: accountStore.twoFactor,
                onChanged: accountStore.setTwoFactor,
              ),
              _SwitchCard(
                title: 'تنبيهات تسجيل الدخول',
                subtitle: 'إشعار عند الدخول من جهاز جديد',
                value: accountStore.loginAlerts,
                onChanged: accountStore.setLoginAlerts,
              ),
              _SwitchCard(
                title: 'بصمة الوجه/الإصبع',
                subtitle: 'تفعيل الدخول السريع باستخدام البصمة',
                value: accountStore.biometric,
                onChanged: accountStore.setBiometric,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SwitchCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchCard({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
