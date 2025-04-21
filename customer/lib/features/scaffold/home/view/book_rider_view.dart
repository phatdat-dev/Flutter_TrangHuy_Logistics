import 'package:flutter/material.dart';

class BookRiderView extends StatefulWidget {
  const BookRiderView({super.key});

  @override
  State<BookRiderView> createState() => _BookRiderViewState();
}

class _BookRiderViewState extends State<BookRiderView> {
  final TextEditingController _pickupController = TextEditingController(text: '358 Xuan Dinh, Bac Tu Liem, Ha Noi');
  final TextEditingController _destinationController = TextEditingController(text: '1 Bis, Vo Van Kiet, District 1, HCMC');

  @override
  void dispose() {
    _pickupController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Book a Rider', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500)),
          leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black87), onPressed: () => Navigator.of(context).pop()),
          bottom: PreferredSize(preferredSize: const Size.fromHeight(1.0), child: Container(color: Colors.grey[300], height: 1.0)),
        ),
        body: ListView(
          children: [
            // Pickup and Destination
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  _buildLocationField(controller: _pickupController, label: 'Pickup Location', icon: Icons.circle_outlined, iconColor: Colors.blue),
                  const SizedBox(height: 16),
                  _buildLocationField(
                    controller: _destinationController,
                    label: 'Destination',
                    icon: Icons.location_on_outlined,
                    iconColor: Colors.red,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Rider Profile Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your Rider', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                  const SizedBox(height: 16),

                  // Rider Profile Card
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rider Image
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(color: Colors.grey[300]!, width: 2),
                          image: const DecorationImage(image: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'), fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Rider Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Nguyen Van Minh', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 18),
                                const SizedBox(width: 4),
                                const Text('4.8', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                                const SizedBox(width: 4),
                                Text('(243 reviews)', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.grey[600], size: 16),
                                const SizedBox(width: 4),
                                Text('Rider since 2021', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.motorcycle, color: Colors.grey[600], size: 16),
                                const SizedBox(width: 4),
                                Text('Honda Wave • 59F1-23456', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Rider Stats
                  Row(
                    children: [
                      Expanded(child: _buildStatItem(value: '1,243', label: 'Deliveries', icon: Icons.local_shipping_outlined)),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      Expanded(child: _buildStatItem(value: '98%', label: 'On-time', icon: Icons.timer_outlined)),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      Expanded(child: _buildStatItem(value: '4.8', label: 'Rating', icon: Icons.star_outline)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Reviews Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                      TextButton(
                        onPressed: () {
                          // Navigate to all reviews
                        },
                        child: const Text('See all'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Review Items
                  _buildReviewItem(
                    name: 'Tran Thi Lan',
                    rating: 5,
                    date: 'July 15, 2023',
                    comment: 'Very professional and punctual. The package was delivered in perfect condition.',
                  ),
                  const Divider(),
                  _buildReviewItem(
                    name: 'Le Van Hung',
                    rating: 4,
                    date: 'July 10, 2023',
                    comment: 'Good service, but arrived a bit later than expected. Overall satisfied.',
                  ),
                  const Divider(),
                  _buildReviewItem(
                    name: 'Pham Minh Duc',
                    rating: 5,
                    date: 'July 5, 2023',
                    comment: 'Excellent service! Very friendly and professional. Would recommend.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Pricing Section
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pricing', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                  const SizedBox(height: 16),

                  // Price Items
                  _buildPriceItem(label: 'Base Fare', price: '150,000₫'),
                  _buildPriceItem(label: 'Distance (25 km)', price: '125,000₫'),
                  _buildPriceItem(label: 'Service Fee', price: '25,000₫'),
                  const Divider(),
                  _buildPriceItem(label: 'Total', price: '300,000₫', isBold: true),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Book Now Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    // Handle booking
                    _showBookingConfirmation(context);
                  },
                  child: const Text('Book Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationField({required TextEditingController controller, required String label, required IconData icon, required Color iconColor}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        border: InputBorder.none,
        prefixIcon: Icon(icon, color: iconColor),
      ),
    );
  }

  Widget _buildStatItem({required String value, required String label, required IconData icon}) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildReviewItem({required String name, required int rating, required String date, required String comment}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
              Text(date, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ...List.generate(5, (index) {
                return Icon(index < rating ? Icons.star : Icons.star_border, color: Colors.amber, size: 16);
              }),
            ],
          ),
          const SizedBox(height: 8),
          Text(comment, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildPriceItem({required String label, required String price, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: Colors.black87)),
          Text(
            price,
            style: TextStyle(fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: isBold ? Colors.blue : Colors.black87),
          ),
        ],
      ),
    );
  }

  void _showBookingConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Booking'),
            content: const Text('Do you want to book Nguyen Van Minh as your rider?'),
            actions: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showBookingSuccess(context);
                },
                style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
                child: const Text('Confirm'),
              ),
            ],
          ),
    );
  }

  void _showBookingSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Booking Successful'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 64),
                const SizedBox(height: 16),
                const Text('Your rider has been booked successfully!', textAlign: TextAlign.center),
                const SizedBox(height: 8),
                Text(
                  'Nguyen Van Minh will arrive in approximately 15 minutes.',
                  style: TextStyle(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }
}
