import 'package:flutter/material.dart';

import 'account_store.dart';

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  Future<void> _showAddressDialog({AccountAddress? address}) async {
    final formKey = GlobalKey<FormState>();
    final labelController = TextEditingController(text: address?.label ?? '');
    final detailsController = TextEditingController(text: address?.details ?? '');

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(address == null ? 'إضافة عنوان' : 'تعديل عنوان'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: labelController,
                  decoration: const InputDecoration(labelText: 'اسم العنوان'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'اكتب اسم العنوان';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: detailsController,
                  decoration: const InputDecoration(labelText: 'تفاصيل العنوان'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'اكتب تفاصيل العنوان';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () {
                if (!(formKey.currentState?.validate() ?? false)) return;
                if (address == null) {
                  accountStore.addAddress(
                    label: labelController.text,
                    details: detailsController.text,
                  );
                } else {
                  accountStore.updateAddress(
                    id: address.id,
                    label: labelController.text,
                    details: detailsController.text,
                  );
                }
                Navigator.pop(dialogContext);
              },
              child: Text(address == null ? 'إضافة' : 'حفظ'),
            ),
          ],
        );
      },
    );

    labelController.dispose();
    detailsController.dispose();
  }

  Future<void> _confirmDeleteAddress(AccountAddress address) async {
    final shouldDelete =
        await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('حذف العنوان'),
            content: Text('هل تريد حذف "${address.label}"؟'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                child: Text('حذف', style: TextStyle(color: Colors.red.shade700)),
              ),
            ],
          ),
        ) ??
        false;

    if (!shouldDelete) return;

    accountStore.removeAddress(address.id);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم حذف العنوان')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العناوين المحفوظة'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: accountStore,
        builder: (context, child) {
          final addresses = accountStore.addresses;

          if (addresses.isEmpty) {
            return Center(
              child: Text(
                'لا يوجد عناوين محفوظة حالياً',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: addresses.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final item = addresses[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: ListTile(
                  leading: const Icon(Icons.location_on_outlined),
                  title: Text(item.label),
                  subtitle: Text(item.details),
                  trailing: SizedBox(
                    width: 96,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => _showAddressDialog(address: item),
                          icon: const Icon(Icons.edit_outlined),
                        ),
                        IconButton(
                          onPressed: () => _confirmDeleteAddress(item),
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddressDialog(),
        icon: const Icon(Icons.add_location_alt_outlined),
        label: const Text('إضافة عنوان'),
      ),
    );
  }
}
