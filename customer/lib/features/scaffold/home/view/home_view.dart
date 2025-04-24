import 'package:auto_route/auto_route.dart';
import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_constants.dart';
import '../../../../routes/app_router.dart';
import 'package_delivery_form_view.dart.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _onNotification() {
    // Handle notification button press
    const NotificationRoute().push(context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text("Trang Huy Logistics")),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingContent),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Search Bar
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    hintText: 'Tracking Orders',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.grey[400]),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Welcome Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.blue[600], borderRadius: AppConstants.borderRadius),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello Adward', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('We trust you are having a great time', style: TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                    IconButton.outlined(onPressed: _onNotification, icon: const Icon(Icons.notifications_outlined, color: Colors.white)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Special for you section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Special for you', style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red[400]),
                ],
              ),
              const SizedBox(height: 16),

              // Promotional Cards
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    // Tech Meetup Card
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: AppConstants.borderRadius,
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1540575467063-178a50c2df87?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                            ),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                          ),
                        ),
                        child: const Stack(
                          children: [
                            Positioned(
                              left: 16,
                              bottom: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Tech Meetup', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  Text('coming soon', style: TextStyle(color: Colors.white, fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Love Revolution Card
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.orange[300]!, Colors.orange[400]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: AppConstants.borderRadius,
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: AppConstants.borderRadius,
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1512076249812-fd58fb2c8748?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 16,
                              bottom: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Love', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  Text('Revolution', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // What would you like to do section
              const Text('What would you like to do', style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 16),

              // Action Cards - First Row
              Row(
                children: [
                  // Customer Care Card
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.headset,
                      title: 'Customer Care',
                      subtitle: '08:00 AM - 09:00 PM',
                      color: Colors.blue,
                      backgroundColor: Colors.grey[200]!,
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Send a package Card
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.inventory_2_outlined,
                      title: 'Send a package',
                      subtitle: 'Pick up or deliver your package',
                      color: Colors.blue,
                      backgroundColor: Colors.grey[200]!,
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => const PackageDeliveryFormView()));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Action Cards - Second Row
              Row(
                children: [
                  // Payment Card
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.description_outlined,
                      title: 'Document',
                      subtitle: 'Order documents',
                      color: Colors.blue,
                      backgroundColor: Colors.grey[200]!,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Book a rider Card
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.directions_car_outlined,
                      title: 'Tracking',
                      subtitle: 'Tracking your route & location',
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                      isHighlighted: true,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Color backgroundColor,
    VoidCallBack? onTap,
    bool isHighlighted = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: backgroundColor, borderRadius: AppConstants.borderRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, color: color, size: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: isHighlighted ? Colors.white : Colors.blue, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: isHighlighted ? Colors.white70 : Colors.grey[600], fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
