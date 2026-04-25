import 'package:flutter/material.dart';

import 'account/account_store.dart';
import 'account/edit_profile_screen.dart';
import 'account/payment_methods_screen.dart';
import 'account/privacy_security_screen.dart';
import 'account/saved_addresses_screen.dart';
import 'onboarding_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: accountStore,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('حسابي'),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person, size: 30),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          accountStore.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(accountStore.email),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _AccountTile(
                icon: Icons.person_outline,
                title: 'تعديل الملف الشخصي',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                ),
              ),
              _AccountTile(
                icon: Icons.location_on_outlined,
                title: 'العناوين المحفوظة',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SavedAddressesScreen()),
                ),
              ),
              _AccountTile(
                icon: Icons.credit_card_outlined,
                title: 'طرق الدفع',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PaymentMethodsScreen()),
                ),
              ),
              _AccountTile(
                icon: Icons.lock_outline,
                title: 'الخصوصية والأمان',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PrivacySecurityScreen()),
                ),
              ),
              _AccountTile(
                icon: Icons.support_agent_outlined,
                title: 'الدعم والمساعدة',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('راسلنا على support@sana3a.app'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              FilledButton.tonalIcon(
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                  (route) => false,
                ),
                icon: const Icon(Icons.logout),
                label: const Text('تسجيل الخروج'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AccountTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _AccountTile({
    required this.icon,
    required this.title,
    required this.onTap,
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
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_left),
      ),
    );
  }
}
