import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../app/app_constants.dart';

@RoutePage()
class DeliverySuccessfulView extends StatefulWidget {
  const DeliverySuccessfulView({super.key});

  @override
  State<DeliverySuccessfulView> createState() => _DeliverySuccessfulViewState();
}

class _DeliverySuccessfulViewState extends State<DeliverySuccessfulView> {
  int _rating = 0;
  bool _addFeedback = false;
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

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
              const Text('Delivery Successful', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 8),

              // Description
              const Text(
                'Your item has been delivered successfully',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 32),

              // Rate Rider
              const Text('Rate Rider', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87)),
              const SizedBox(height: 16),

              // Star Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Icon(index < _rating ? Icons.star : Icons.star_border, color: index < _rating ? Colors.amber : Colors.grey, size: 32),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),

              // Add Feedback Checkbox
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _addFeedback,
                      onChanged: (value) {
                        setState(() {
                          _addFeedback = value ?? false;
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Add feedback', style: TextStyle(fontSize: 14, color: Colors.black87)),
                ],
              ),
              const SizedBox(height: 16),

              // Feedback Text Field (only shown if checkbox is checked)
              if (_addFeedback)
                TextField(
                  controller: _feedbackController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Write your feedback here...',
                    border: OutlineInputBorder(borderRadius: AppConstants.borderRadius, borderSide: BorderSide(color: Colors.grey[300]!)),
                    enabledBorder: OutlineInputBorder(borderRadius: AppConstants.borderRadius, borderSide: BorderSide(color: Colors.grey[300]!)),
                    focusedBorder: const OutlineInputBorder(borderRadius: AppConstants.borderRadius, borderSide: BorderSide(color: Colors.blue)),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),

              const Spacer(flex: 3),

              // Done Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: FilledButton(
                  onPressed: () {
                    // Submit rating and feedback, then navigate back
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text('Done', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
