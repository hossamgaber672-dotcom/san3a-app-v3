import 'package:flutter/material.dart';

import 'account_store.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  Future<void> _showAddCardDialog() async {
    final formKey = GlobalKey<FormState>();
    final labelController = TextEditingController();
    final cardNumberController = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('إضافة بطاقة جديدة'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: labelController,
                  decoration: const InputDecoration(
                    labelText: 'اسم البطاقة (اختياري)',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'رقم البطاقة',
                  ),
                  validator: (value) {
                    final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
                    if (digits.length < 4) {
                      return 'اكتب رقم بطاقة صحيح (4 أرقام على الأقل)';
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
                accountStore.addCard(
                  label: labelController.text,
                  cardNumber: cardNumberController.text,
                );
                Navigator.pop(dialogContext);
              },
              child: const Text('إضافة'),
            ),
          ],
        );
      },
    );

    labelController.dispose();
    cardNumberController.dispose();
  }

  Future<void> _confirmRemoveMethod(AccountPaymentMethod method) async {
    final shouldDelete =
        await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('حذف طريقة الدفع'),
            content: Text('هل تريد حذف "${method.title}"؟'),
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

    accountStore.removePaymentMethod(method.id);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تم حذف طريقة الدفع')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طرق الدفع'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: accountStore,
        builder: (context, child) {
          final methods = accountStore.paymentMethods;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: methods.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final method = methods[index];
                      final isSelected =
                          accountStore.selectedPaymentMethodId == method.id;

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: isSelected ? Colors.blue.shade200 : Colors.grey.shade200,
                          ),
                        ),
                        child: ListTile(
                          onTap: () => accountStore.selectPaymentMethod(method.id),
                          leading: Icon(method.icon),
                          title: Text(method.title),
                          subtitle: Text(method.subtitle),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isSelected)
                                const Icon(Icons.check_circle, color: Colors.blue),
                              if (method.removable)
                                IconButton(
                                  onPressed: () => _confirmRemoveMethod(method),
                                  icon: const Icon(Icons.delete_outline),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: _showAddCardDialog,
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة طريقة دفع'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
