import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../app/app_constants.dart';
import 'or_divider_widget.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(thickness: AppConstants.dividerThickness, indent: 50, endIndent: 50),
        const SizedBox(height: 16),

        // Social Media Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(icon: Icons.facebook, onPressed: () {}),
            const SizedBox(width: 16),
            _buildSocialButton(icon: MingCute.google_fill, onPressed: () {}),
            const SizedBox(width: 16),
            _buildSocialButton(icon: MingCute.apple_fill, onPressed: () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton({required IconData icon, required VoidCallback onPressed}) {
    return Builder(
      builder:
          (context) => InkWell(
            onTap: onPressed,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Theme.of(context).colorScheme.primary),
              ),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 24),
            ),
          ),
    );
  }
}
