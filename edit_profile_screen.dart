import 'package:flutter/material.dart';

import 'account_store.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: accountStore.name);
    _emailController = TextEditingController(text: accountStore.email);
    _phoneController = TextEditingController(text: accountStore.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _save() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    accountStore.updateProfile(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم تحديث الملف الشخصي')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تعديل الملف الشخصي'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'الاسم',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'اكتب الاسم';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'البريد الإلكتروني',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty || !value.contains('@')) {
                  return 'اكتب بريد إلكتروني صحيح';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'رقم الهاتف',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().length < 8) {
                  return 'اكتب رقم هاتف صحيح';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _save,
                child: const Text('حفظ التغييرات'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
