import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IndexView extends HookConsumerWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("HELO WORLD")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.pushNamed('signIn');
        },
      ),
    );
  }
}
