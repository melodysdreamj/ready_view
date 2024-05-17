import 'package:flutter/material.dart';
import 'package:ready_view/ready_view.dart';

class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  ReadyState<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends ReadyState<StatefulExample> {
  @override
  Function? readyState(BuildContext context) {
    return () async {
      await Future.delayed(const Duration(seconds: 2));
    };
  }

  @override
  Widget loadingWidget() {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }

  @override
  Widget buildWhenReady(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulExample'),
      ),
      body: const Center(
        child: Text('Content is ready!'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: StatefulExample(),
  ));
}
