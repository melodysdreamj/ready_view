


[![pub package](https://img.shields.io/pub/v/ready_view.svg)](https://pub.dartlang.org/packages/ready_view)
[![GitHub](https://img.shields.io/github/stars/melodysdreamj/ready_view.svg?style=social&label=Star)](https://github.com/melodysdreamj/ready_view)

[![](https://img.shields.io/badge/DISCORD-JOIN%20SERVER-5663F7?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/zXXHvAXCug)
[![](https://img.shields.io/badge/KakaoTalk-Join%20Room-FEE500?style=for-the-badge&logo=kakao)](https://open.kakao.com/o/gEwrffbg)

# ready_view
### Motivation
When developing with Flutter, it is often necessary to use asynchronous operations when fetching information from networks or databases. In such cases, we need to include loading widgets on our pages, track the completion of loading, and display the original view once the loading is complete. Including this series of code can make the view code quite complex and messy.

Therefore, the ready_view library offers a simple and elegant solution for handling asynchronous actions.

##  Installation
```dart
flutter pub add ready_view
```

## Usage
### 1. Change Code
#### When Stateless Widget
```dart
// replace
StatelessWidget => ReadyStatelessWidget

build(BuildContext context) => readyBuild(BuildContext context)
```

#### Stateful Widget
```dart
// replace
extends State<.. => extends ReadyState<..

build(BuildContext context) => readyBuild(BuildContext context)
```

### 2. Add readyState(Optional)
When asynchronous actions are required, you can override the readyState() to perform the necessary tasks.
```dart
// handle async operation here if needed
@override
Future<void> readyState() async {
  return () async {
    // your async code here
    await Future.delayed(const Duration(seconds: 2));
  };
}
```

### 3. Custom Loading Widget(Optional)
You can customize the loading widget by overriding the loadingWidget() if you want.
```dart
  // custom loading widget if needed
  @override
  Widget loadingWidget() {
    return Scaffold(
        body: Center(
            child: Container(
      width: 100,
      height: 100,
      color: Colors.red,
    )));
  }
```

## Example
### Stateless Widget
```dart
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
```

### Stateful Widget
```dart
import 'package:flutter/material.dart';
import 'package:ready_view/ready_view.dart';

class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  ReadyState<StatefulExample> createState() => _StatefulExampleState();
}

class _StatefulExampleState extends ReadyState<StatefulExample> {
  
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
```