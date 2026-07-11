import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/control_panel/Auth/controller/controller.dart';
import 'package:first_project/ui/control_panel/Auth/widgets/field.dart';
import 'package:flutter/material.dart';

class ValidationScreen extends StatelessWidget {
  ValidationScreen({super.key, required this.userId});

  final String userId;
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _controller = AdminAuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/sign up.jpg', fit: BoxFit.cover),
          Container(color: Colors.black.withValues(alpha: 0.65)),
          Center(
            child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 420),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.surface.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(AppColors.dialogRadius),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        blurRadius: 32,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/Screenshot_2024-12-28_142342-removebg-preview.png',
                          height: 72,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 24),
                         Text(
                          'Admin Panel',
                          style: TextStyle(
                            color: AppColors.onSurface,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                         Text(
                          'Sign in with your admin credentials',
                          style: TextStyle(
                            color: AppColors.onSurfaceSubtle,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 28),
                        AdminField(
                          controller: _nameController,
                          label: 'Name',
                          hint: 'Admin name',
                          icon: Icons.person_outline_rounded,
                          validator: (v) => (v == null || v.length < 6)
                              ? 'Name must be 6+ characters'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        AdminField(
                          controller: _passwordController,
                          label: 'Password',
                          hint: 'Admin password',
                          icon: Icons.lock_outline_rounded,
                          obscure: true,
                          validator: (v) => (v == null || v.length < 6)
                              ? 'Password must be 6+ characters'
                              : null,
                        ),
                        const SizedBox(height: 28),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _controller.login(
                                  context,
                                  _nameController.text.trim(),
                                  _passwordController.text.trim(),
                                  userId,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accent,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppColors.fieldRadius),
                              ),
                            ),
                            child: const Text(
                              'Login to Admin Panel',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
