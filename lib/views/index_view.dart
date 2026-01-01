import 'package:app_mobile/network/http_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexView extends HookConsumerWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref.watch(httpClientProvider).get('/data');
        },
      ),
    );
  }
}
