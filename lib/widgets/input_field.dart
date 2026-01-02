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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label di atas
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 8.h),

        // Input Field
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.05),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4), // Shadow lembut ke bawah
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
              prefixIcon: Icon(icon, color: Colors.black, size: 20.w),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 0.w,
                vertical: 16.h,
              ),
              // Border saat tidak diklik (Enabled)
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(color: Colors.black26, width: 1),
              ),
              // Border saat diklik (Focused)
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(
                  color: Colors.black, // Ganti dengan warna brand kamu
                  width: 1,
                ),
              ),
              // Border saat error
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(color: Colors.red.shade400, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
