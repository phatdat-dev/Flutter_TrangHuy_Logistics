import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// PackageTrackingScreen
@RoutePage()
class TrackView extends StatelessWidget {
  const TrackView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = "AIzaSyDrmhxwHxEmKGaIjwPKfwij6aKJfWANAK8";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Map Section
        Stack(
          children: [
            // Map Image
            Image.network(
              'https://maps.googleapis.com/maps/api/staticmap?center=New+York&zoom=12&size=600x300&maptype=roadmap&style=element:geometry%7Ccolor:0xf5f5f5&style=element:labels.icon%7Cvisibility:off&style=element:labels.text.fill%7Ccolor:0x616161&style=element:labels.text.stroke%7Ccolor:0xf5f5f5&style=feature:administrative.land_parcel%7Celement:labels.text.fill%7Ccolor:0xbdbdbd&style=feature:poi%7Celement:geometry%7Ccolor:0xeeeeee&style=feature:poi%7Celement:labels.text.fill%7Ccolor:0x757575&style=feature:poi.park%7Celement:geometry%7Ccolor:0xe5e5e5&style=feature:poi.park%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&style=feature:road%7Celement:geometry%7Ccolor:0xffffff&style=feature:road.arterial%7Celement:labels.text.fill%7Ccolor:0x757575&style=feature:road.highway%7Celement:geometry%7Ccolor:0xdadada&style=feature:road.highway%7Celement:labels.text.fill%7Ccolor:0x616161&style=feature:road.local%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&style=feature:transit.line%7Celement:geometry%7Ccolor:0xe5e5e5&style=feature:transit.station%7Celement:geometry%7Ccolor:0xeeeeee&style=feature:water%7Celement:geometry%7Ccolor:0xc9c9c9&style=feature:water%7Celement:labels.text.fill%7Ccolor:0x9e9e9e&key=$key',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(width: double.infinity, height: 250, color: Colors.grey[200], child: CustomPaint(painter: MapPlaceholderPainter()));
              },
            ),

            // Route Overlay (simulated)
            Positioned.fill(child: CustomPaint(painter: RoutePainter())),
          ],
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tracking Number
                  const Text('Tracking Number', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                  const SizedBox(height: 12),

                  // Tracking ID
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                        child: const Icon(Icons.local_shipping_outlined, color: Colors.white, size: 14),
                      ),
                      const SizedBox(width: 12),
                      const Text('THL-7458-452', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Package Status
                  const Text('Package Status', style: TextStyle(fontSize: 16, color: Colors.black54)),
                  const SizedBox(height: 16),

                  // Status Timeline
                  _buildTimelineItem(title: 'Courier requested', date: 'July 7 2025', time: '08:00am', isCompleted: true, isFirst: true),
                  _buildTimelineItem(title: 'Package ready for delivery', date: 'July 7 2025', time: '08:30am', isCompleted: true),
                  _buildTimelineItem(title: 'Package in transit', date: 'July 7 2025', time: '10:30am', isCompleted: false),
                  _buildTimelineItem(title: 'Package delivered', date: 'July 7 2025', time: '10:30am', isCompleted: false, isLast: true),
                ],
              ),
            ),
          ),
        ),

        // View Package Info Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: () {},
              child: const Text('View Package Info', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ),

        const SizedBox(height: kBottomNavigationBarHeight + 20),
      ],
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String date,
    required String time,
    required bool isCompleted,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line and Dot
          Column(
            children: [
              // Top Line
              if (!isFirst) Container(width: 2, height: 20, color: isCompleted ? Colors.blue : Colors.grey[300]),

              // Dot
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isCompleted ? Colors.blue : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: isCompleted ? Colors.blue : Colors.grey[300]!, width: 2),
                ),
                child: isCompleted ? const Icon(Icons.check, color: Colors.white, size: 12) : null,
              ),

              // Bottom Line
              if (!isLast) Expanded(child: Container(width: 2, color: Colors.grey[300])),
            ],
          ),
          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: isCompleted ? Colors.black87 : Colors.grey[600])),
                  const SizedBox(height: 4),
                  Text('$date  $time', style: const TextStyle(fontSize: 12, color: Colors.red)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the map placeholder
class MapPlaceholderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.grey[300]!
          ..strokeWidth = 1.0;

    // Draw grid lines
    for (double i = 0; i < size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i < size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for the route
class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final routePaint =
        Paint()
          ..color = Colors.blue
          ..strokeWidth = 3.0
          ..style = PaintingStyle.stroke;

    final path = Path();

    // Starting point (top marker)
    final topMarkerX = size.width * 0.5;
    final topMarkerY = size.height * 0.3;

    // Middle point
    final middleX = size.width * 0.4;
    final middleY = size.height * 0.6;

    // Bottom markers
    final bottomMarker1X = size.width * 0.45;
    final bottomMarker1Y = size.height * 0.75;

    final bottomMarker2X = size.width * 0.55;
    final bottomMarker2Y = size.height * 0.75;

    // Draw route path
    path.moveTo(topMarkerX, topMarkerY);
    path.quadraticBezierTo(middleX, middleY, bottomMarker1X, bottomMarker1Y);

    // Add a small curve to the second bottom marker
    path.quadraticBezierTo((bottomMarker1X + bottomMarker2X) / 2, bottomMarker1Y + 10, bottomMarker2X, bottomMarker2Y);

    canvas.drawPath(path, routePaint);

    // Draw markers
    final markerPaint =
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill;

    final markerStrokePaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;

    // Top marker
    canvas.drawCircle(Offset(topMarkerX, topMarkerY), 8, markerPaint);
    canvas.drawCircle(Offset(topMarkerX, topMarkerY), 8, markerStrokePaint);

    // Bottom markers
    canvas.drawCircle(Offset(bottomMarker1X, bottomMarker1Y), 8, markerPaint);
    canvas.drawCircle(Offset(bottomMarker1X, bottomMarker1Y), 8, markerStrokePaint);

    canvas.drawCircle(Offset(bottomMarker2X, bottomMarker2Y), 8, markerPaint);
    canvas.drawCircle(Offset(bottomMarker2X, bottomMarker2Y), 8, markerStrokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
