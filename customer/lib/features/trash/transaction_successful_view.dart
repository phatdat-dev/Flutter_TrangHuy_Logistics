import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/app_constants.dart';

@RoutePage()
class TransactionSuccessfulView extends StatelessWidget {
  final String trackingNumber;

  const TransactionSuccessfulView({super.key, this.trackingNumber = 'THL-7458-452'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Success Icon
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(color: Color(0xFF30B566), shape: BoxShape.circle),
                child: const Icon(Icons.check, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 32),

              // Success Text
              const Text('Transaction Successful', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 8),

              // Description
              const Text(
                'Your rider is on the way to your destination',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 8),

              // Tracking Number
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                  children: [
                    const TextSpan(text: 'Tracking Number: '),
                    TextSpan(text: trackingNumber, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),

              const Spacer(flex: 3),

              // Track Item Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    // Navigate to tracking screen
                  },
                  child: const Text('Track my item', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 16),

              // Go Back Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigate to homepage
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue),
                    shape: const RoundedRectangleBorder(borderRadius: AppConstants.borderRadius),
                  ),
                  child: const Text('Go back to homepage', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
