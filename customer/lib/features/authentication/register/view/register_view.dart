import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core_datz/flutter_core_datz.dart';

import '../../../../routes/app_router.dart';
import '../../shared/widgets/social_button_widget.dart';
import '../../shared/widgets/text_register_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _obscurePassword = true;
  bool _agreedToTerms = false;

  void _onSignUpPressed() {
    const LoginRoute().go(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('Create an account', style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Complete the sign up process to get started', style: context.textTheme.titleMedium?.copyWith(color: Theme.of(context).hintColor)),
              const SizedBox(height: 30),

              // Full Name Field
              _buildInputLabel('Full Name'),
              _buildTextField(hintText: 'AdwardSoft', keyboardType: TextInputType.name),
              const SizedBox(height: 20),

              // Phone Number Field
              _buildInputLabel('Phone Number'),
              _buildTextField(hintText: '0000000000', keyboardType: TextInputType.phone),
              const SizedBox(height: 20),

              // Email Address Field
              _buildInputLabel('Email Address'),
              _buildTextField(hintText: '***********@mail.com', keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 20),

              // Password Field
              _buildInputLabel('Password'),
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: '***********',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Terms and Conditions Checkbox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _agreedToTerms,
                      onChanged: (value) {
                        setState(() {
                          _agreedToTerms = value ?? false;
                        });
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                        children: [
                          const TextSpan(text: 'By ticking this box, you agree to our '),
                          TextSpan(
                            text: 'Terms and conditions',
                            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to terms and conditions
                                  },
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'private policy',
                            style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to privacy policy
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _onSignUpPressed,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                  child: const Text('Sign Up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),

              // Already have an account
              const Center(child: TextRegisterWidget()),

              // Social Sign In
              const SocialButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(label, style: context.textTheme.titleMedium?.copyWith(color: Theme.of(context).hintColor)),
    );
  }

  Widget _buildTextField({required String hintText, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(hintText: hintText, contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
    );
  }
}
