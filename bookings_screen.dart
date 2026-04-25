import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حجزاتي'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _BookingCard(
            serviceName: 'سباكة',
            workerName: 'أحمد حسن',
            dateTime: 'السبت 27 أبريل - 02:00 م',
            status: 'قادم',
            statusColor: Color(0xFF1565C0),
          ),
          SizedBox(height: 12),
          _BookingCard(
            serviceName: 'نظافة',
            workerName: 'فريق كلين برو',
            dateTime: 'الأربعاء 22 أبريل - 10:00 ص',
            status: 'مكتمل',
            statusColor: Color(0xFF2E7D32),
          ),
          SizedBox(height: 12),
          _BookingCard(
            serviceName: 'تكييف',
            workerName: 'محمود علي',
            dateTime: 'الإثنين 29 أبريل - 05:00 م',
            status: 'قيد التأكيد',
            statusColor: Color(0xFFE65100),
          ),
        ],
      ),
    );
  }
}

class _BookingCard extends StatelessWidget {
  final String serviceName;
  final String workerName;
  final String dateTime;
  final String status;
  final Color statusColor;

  const _BookingCard({
    required this.serviceName,
    required this.workerName,
    required this.dateTime,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                serviceName,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('الفني: $workerName'),
          const SizedBox(height: 4),
          Text(
            dateTime,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
