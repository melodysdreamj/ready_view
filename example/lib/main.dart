import 'package:example/stateful_example.dart';
import 'package:example/stateless_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => Material(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => const StatefulExample(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                    child: const Text('Go to Stateful Example'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) => const StatelessExample(),
                          transitionDuration: const Duration(seconds: 0),
                        ),
                      );
                    },
                    child: const Text('Go to Stateless Example'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}