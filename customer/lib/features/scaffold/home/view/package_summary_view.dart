import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_theme.dart';

@RoutePage()
class PackageSummaryView extends StatelessWidget {
  const PackageSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Send a package',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.normal),
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey[300], height: 1.0),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Package Information Section
                  _buildSectionHeader('Package Information', Colors.blue),
                  _buildInfoItem('Origin details', '358 Xuan Dinh, Bac Tu Liem, Ha Noi, Viet Nam'),
                  _buildInfoItem('', '+841900 299 933'),
                  const SizedBox(height: 8),

                  _buildInfoItem('Destination details', '1 Bis, Vo Van Kiet, 8 District, HCMC, Viet Nam'),
                  _buildInfoItem('', '+84909313131'),
                  const SizedBox(height: 8),

                  _buildInfoItem('Other details', ''),
                  _buildInfoItemWithValue('Package Items', 'Books ans stationery'),
                  _buildInfoItemWithValue('Weight of items', '1000kg'),
                  _buildInfoItemWithValue('Tracking Number', 'THL-7458-452'),

                  // Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(height: 1, color: Colors.grey[300]),
                  ),

                  // Charges Section
                  _buildSectionHeader('Charges', Colors.blue),
                  _buildChargeItem('Delivery Charges', '1,500,000₫'),
                  _buildChargeItem('Instant delivery', '500,000₫'),
                  _buildChargeItem('Tax and Service Charges', '200,000₫'),
                  _buildChargeItem('Package total', '2,200,000₫', isBold: true),
                ],
              ),
            ),
          ),

          // Bottom Buttons
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.withValues(alpha: 0.1), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, -3))],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      side: const BorderSide(color: Colors.blue),
                      padding: AppTheme.paddingButtonTheme,
                    ),
                    child: const Text('Edit package', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: () {},

                    child: const Text('Make payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty) Text(label, style: const TextStyle(color: Colors.black87, fontSize: 14)),
          if (label.isNotEmpty) const SizedBox(height: 4),
          Text(value, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildInfoItemWithValue(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          Text(value, style: const TextStyle(color: Colors.red, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildChargeItem(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[700], fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            amount,
            style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
