import 'package:app_mobile/extensions/auth_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexView extends HookConsumerWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(ref.currentUser!.name.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed('signIn');
        },
      ),
    );
  }
}
