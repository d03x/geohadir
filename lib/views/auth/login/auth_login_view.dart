import 'package:app_mobile/core/extensions/theme_extension.dart';
import 'package:app_mobile/providers/state/auth_login_state.dart';
import 'package:app_mobile/view_model/auth_login_view_model.dart';
import 'package:app_mobile/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthLoginView extends HookConsumerWidget {
  const AuthLoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtrl = useTextEditingController();
    final passCtrl = useTextEditingController();
    final authState = ref.watch(authLoginViewModel);
    ref.listen(authLoginViewModel, (prev, next) {
      if (next is AuthValidationErrorState) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errors!.email!.first)));
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),

              Row(
                children: [
                  Container(
                    height: 40.w,
                    width: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.black, // Aksen Hitam Tegas
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.fingerprint,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "GEOHADIR.",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40.h),

              Text(
                "Mulai\nHari Anda.",
                style: GoogleFonts.poppins(
                  fontSize: 42.sp, // Font sangat besar
                  fontWeight: FontWeight.w600,
                  color: context.colors.onSurface,
                  height: 1.1, // Line height rapat
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "Silakan masuk dengan kredensial kantor.",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: context.colors.onSurface.withValues(alpha: 0.5),
                ),
              ),

              SizedBox(height: 48.h),

              InputField(
                controller: emailCtrl,
                label: "NIP / Email Pegawai",
                hint: "ex: 192003...",
                icon: Icons.badge_outlined,
              ),

              SizedBox(height: 24.h),

              InputField(
                controller: passCtrl,
                label: "Kata Sandi",
                hint: "••••••••",
                icon: Icons.lock_outline,
              ),

              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Lupa Password?",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black, // Link warna hitam agar minimalis
                    fontSize: 13.sp,
                  ),
                ),
              ),

              SizedBox(height: 40.h),

              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .watch(authLoginViewModel.notifier)
                        .login(
                          password: passCtrl.text.trim(),
                          email: emailCtrl.text.trim(),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.primary,
                    foregroundColor: context.colors.onPrimary,
                    elevation: 0, // Tanpa shadow (Flat)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        authState is AuthLoadingState
                            ? "Loading..."
                            : "Masuk Dashboard",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 20.sp,
                        color: context.colors.onPrimary,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              Center(
                child: Text(
                  "Butuh bantuan? Hubungi IT Support",
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
