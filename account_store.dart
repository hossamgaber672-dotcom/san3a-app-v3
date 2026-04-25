import 'package:flutter/material.dart';

class AccountAddress {
  final String id;
  final String label;
  final String details;

  const AccountAddress({
    required this.id,
    required this.label,
    required this.details,
  });

  AccountAddress copyWith({
    String? label,
    String? details,
  }) {
    return AccountAddress(
      id: id,
      label: label ?? this.label,
      details: details ?? this.details,
    );
  }
}

class AccountPaymentMethod {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool removable;

  const AccountPaymentMethod({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.removable = true,
  });
}

class AccountStore extends ChangeNotifier {
  String _name = 'أحمد محمد';
  String _email = 'ahmed@example.com';
  String _phone = '01000000000';

  List<AccountAddress> _addresses = const [
    AccountAddress(
      id: 'addr_home',
      label: 'المنزل',
      details: 'القاهرة، مدينة نصر، شارع الطيران',
    ),
    AccountAddress(
      id: 'addr_work',
      label: 'العمل',
      details: 'القاهرة، المعادي، شارع 9',
    ),
  ];

  List<AccountPaymentMethod> _paymentMethods = const [
    AccountPaymentMethod(
      id: 'pm_card_4242',
      title: 'بطاقة بنكية',
      subtitle: '**** **** **** 4242',
      icon: Icons.credit_card,
    ),
    AccountPaymentMethod(
      id: 'pm_cash',
      title: 'الدفع عند الاستلام',
      subtitle: 'ادفع بعد تنفيذ الخدمة',
      icon: Icons.money,
      removable: false,
    ),
  ];

  String _selectedPaymentMethodId = 'pm_card_4242';

  bool _twoFactor = true;
  bool _loginAlerts = true;
  bool _biometric = false;

  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  List<AccountAddress> get addresses => List.unmodifiable(_addresses);
  List<AccountPaymentMethod> get paymentMethods => List.unmodifiable(_paymentMethods);
  String get selectedPaymentMethodId => _selectedPaymentMethodId;
  bool get twoFactor => _twoFactor;
  bool get loginAlerts => _loginAlerts;
  bool get biometric => _biometric;

  void updateProfile({
    required String name,
    required String email,
    required String phone,
  }) {
    _name = name.trim();
    _email = email.trim();
    _phone = phone.trim();
    notifyListeners();
  }

  void addAddress({
    required String label,
    required String details,
  }) {
    _addresses = [
      ..._addresses,
      AccountAddress(
        id: 'addr_${DateTime.now().microsecondsSinceEpoch}',
        label: label.trim(),
        details: details.trim(),
      ),
    ];
    notifyListeners();
  }

  void updateAddress({
    required String id,
    required String label,
    required String details,
  }) {
    final index = _addresses.indexWhere((item) => item.id == id);
    if (index == -1) return;
    _addresses = [..._addresses]
      ..[index] = _addresses[index].copyWith(
        label: label.trim(),
        details: details.trim(),
      );
    notifyListeners();
  }

  void removeAddress(String id) {
    _addresses = _addresses.where((item) => item.id != id).toList();
    notifyListeners();
  }

  void addCard({
    required String label,
    required String cardNumber,
  }) {
    final digits = cardNumber.replaceAll(RegExp(r'\D'), '');
    final last4 = digits.length >= 4 ? digits.substring(digits.length - 4) : '0000';
    final cardTitle = label.trim().isEmpty ? 'بطاقة بنكية جديدة' : label.trim();

    _paymentMethods = [
      ..._paymentMethods,
      AccountPaymentMethod(
        id: 'pm_${DateTime.now().microsecondsSinceEpoch}',
        title: cardTitle,
        subtitle: '**** **** **** $last4',
        icon: Icons.credit_card,
      ),
    ];
    _selectedPaymentMethodId = _paymentMethods.last.id;
    notifyListeners();
  }

  void selectPaymentMethod(String id) {
    if (!_paymentMethods.any((method) => method.id == id)) return;
    _selectedPaymentMethodId = id;
    notifyListeners();
  }

  void removePaymentMethod(String id) {
    final index = _paymentMethods.indexWhere((item) => item.id == id);
    if (index == -1 || !_paymentMethods[index].removable) return;

    _paymentMethods = [..._paymentMethods]..removeAt(index);

    if (!_paymentMethods.any((method) => method.id == _selectedPaymentMethodId)) {
      _selectedPaymentMethodId = _paymentMethods.first.id;
    }
    notifyListeners();
  }

  void setTwoFactor(bool value) {
    _twoFactor = value;
    notifyListeners();
  }

  void setLoginAlerts(bool value) {
    _loginAlerts = value;
    notifyListeners();
  }

  void setBiometric(bool value) {
    _biometric = value;
    notifyListeners();
  }
}

final AccountStore accountStore = AccountStore();
