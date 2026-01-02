import 'package:app_mobile/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Asumsi kamu pakai ini

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextInputType keyboardType;

  const InputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label di atas
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: colors.onSurface.withValues(alpha: 0.5),
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 8.h),

        // Input Field
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: colors.outline,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: colors.outline, fontSize: 14.sp),
            prefixIcon: Icon(icon, color: colors.outline, size: 20.w),
            filled: true,
            fillColor: colors.outline.withValues(alpha: 0.1),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 0.w,
              vertical: 16.h,
            ),
            // Border saat tidak diklik (Enabled)
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: colors.outline, width: 1),
            ),
            // Border saat diklik (Focused)
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: colors.primary, // Ganti dengan warna brand kamu
                width: 1,
              ),
            ),
            // Border saat error
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: colors.error.withValues(alpha: 0.8),
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
