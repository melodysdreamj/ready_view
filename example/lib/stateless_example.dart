import 'package:flutter/material.dart';
import 'package:ready_view/ready_view.dart';

class StatelessExample extends ReadyStatelessWidget {
  const StatelessExample({super.key});

  // handle async operation here if needed
  @override
  Function? readyState(BuildContext context) {
    return () async {
      await Future.delayed(const Duration(seconds: 2));
    };
  }

  // custom loading widget if needed
  // @override
  // Widget loadingWidget() {
  //   return Scaffold(
  //       body: Center(
  //           child: Container(
  //     width: 100,
  //     height: 100,
  //     color: Colors.red,
  //   )));
  // }

  @override
  Widget buildWhenReady(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatelessExample'),
      ),
      body: const Center(
        child: Text('Content is ready!'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: StatelessExample(),
  ));
}
