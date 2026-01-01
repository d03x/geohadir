import 'package:app_mobile/extensions/typography_extension.dart';
import 'package:app_mobile/logger/logger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class AuthLoginView extends StatelessWidget {
  const AuthLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WELLCOME", style: context.textTheme.bodyLarge),
        leading: null,
      ),
      body: SafeArea(
        child: IconButton(
          onPressed: () {
            logger.error("Opps");
            AwesomeNotifications().createNotification(
              content: NotificationContent(
                id: 10,
                channelKey: 'basic_channel',
                title: 'Pesan Baru',
                body: 'Andi: Halo, besok jadi meeting jam berapa',
                notificationLayout: NotificationLayout.Messaging,
                progress: 90.4,
                actionType: .DismissAction,
              ),
              actionButtons: [
                // Tombol 1: Buka Chat
                NotificationActionButton(
                  key: 'BUKA_CHAT', // Key ini akan dibaca di Controller
                  label: 'Buka Chat',
                  actionType: ActionType.Default, // Default = buka aplikasi
                ),

                // Tombol 2: Hapus (Warna Merah)
                NotificationActionButton(
                  key: 'HAPUS',
                  label: 'Hapus',
                  actionType: ActionType
                      .KeepOnTop, // KeepOnTop = aplikasi tidak terbuka, notif tetap di panel (opsional)
                  // Atau gunakan ActionType.SilentAction jika ingin proses background tanpa buka UI
                  isDangerousOption:
                      true, // Membuat teks tombol jadi merah (khusus Android)
                ),
              ],
            );
          },
          icon: Icon(Icons.blender),
        ),
      ),
    );
  }
}
