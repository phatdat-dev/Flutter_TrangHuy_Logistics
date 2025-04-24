import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package_summary_view.dart';

@RoutePage()
class PackageDeliveryFormView extends StatefulWidget {
  const PackageDeliveryFormView({super.key});

  @override
  State<PackageDeliveryFormView> createState() => _PackageDeliveryFormViewState();
}

class _PackageDeliveryFormViewState extends State<PackageDeliveryFormView> {
  int _selectedDeliveryType = 0;

  void _onNextButtonPressed() {
    // Handle the next button press

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PackageSummaryView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Send a package', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.normal)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.blue), onPressed: () => Navigator.of(context).pop()),
        bottom: PreferredSize(preferredSize: const Size.fromHeight(1.0), child: Container(color: Colors.grey[300], height: 1.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Origin Details
            _buildSectionHeader(icon: Icons.circle_outlined, iconColor: Colors.blue, title: 'Origin Details'),
            _buildTextField(initialValue: '308 Xuan Dinh, Bac Tu Liem, Ha Noi', enabled: false),
            _buildTextField(initialValue: 'Viet Nam', enabled: false),
            _buildTextField(initialValue: '+84 902 293 512', enabled: false),
            _buildTextField(hintText: 'Detail'),

            // First Destination Details
            _buildSectionHeader(icon: Icons.location_on_outlined, iconColor: Colors.blue, title: 'Destination Details'),
            _buildTextField(initialValue: '1 No, Vo Van Kiet, District 1, HCMC', enabled: false),
            _buildTextField(initialValue: 'Viet Nam', enabled: false),
            _buildTextField(initialValue: '+84093113131', enabled: false),
            _buildTextField(initialValue: 'Books and stationery', enabled: false),

            // Second Destination Details
            _buildSectionHeader(icon: Icons.location_on_outlined, iconColor: Colors.blue, title: 'Destination Details'),
            _buildTextField(initialValue: '18 Vo Van Ngoc Trai, Binh Thanh, HCMC', enabled: false),
            _buildTextField(initialValue: 'Viet Nam', enabled: false),
            _buildTextField(initialValue: '+84972769352', enabled: false),
            _buildTextField(initialValue: 'VietThing Corp - VTP', enabled: false),

            // Package Details
            _buildSectionHeader(icon: Icons.inventory_2_outlined, iconColor: Colors.orange, title: 'Package Details'),
            _buildTextField(initialValue: 'Books and stationery', enabled: false),
            _buildTextField(initialValue: '1000g', enabled: false),
            _buildTextField(initialValue: 'NSHSSH', enabled: false),

            // Delivery Type Selection
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Select delivery type', style: TextStyle(color: Colors.grey[700], fontSize: 14)),
            ),

            // Delivery Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(child: _buildDeliveryOption(index: 0, icon: Icons.timer_outlined, title: 'Instant delivery')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDeliveryOption(index: 1, icon: Icons.calendar_month_outlined, title: 'Scheduled delivery')),
                  const SizedBox(width: 12),
                  Expanded(child: _buildDeliveryOption(index: 2, icon: Icons.local_shipping_outlined, title: 'Standard delivery')),
                ],
              ),
            ),

            // Next Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: _onNextButtonPressed,
                  child: const Text('Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({required IconData icon, required Color iconColor, required String title}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 8),
          Text(title, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildTextField({String? initialValue, String? hintText, bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        initialValue: initialValue,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Colors.grey[300]!)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Colors.grey[300]!)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide(color: Colors.grey[300]!)),
          filled: !enabled,
          fillColor: enabled ? Colors.white : Colors.grey[50],
        ),
        style: TextStyle(color: enabled ? Colors.black87 : Colors.grey[700], fontSize: 14),
      ),
    );
  }

  Widget _buildDeliveryOption({required int index, required IconData icon, required String title}) {
    final isSelected = _selectedDeliveryType == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDeliveryType = index;
        });
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey[300]!, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.blue : Colors.grey[600]),
            const SizedBox(height: 8),
            Text(title, style: TextStyle(color: isSelected ? Colors.blue : Colors.grey[700], fontSize: 12), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
