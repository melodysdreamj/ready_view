library ready_view;

import 'package:flutter/material.dart';

abstract class ReadyStatelessWidget extends StatefulWidget {
  const ReadyStatelessWidget({super.key});

  @protected
  Function? readyState(BuildContext context);

  @protected
  Widget loadingWidget() {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @protected
  Widget buildWhenReady(BuildContext context);

  @override
  ReadyStatelessWidgetState createState() => ReadyStatelessWidgetState();
}

class ReadyStatelessWidgetState extends State<ReadyStatelessWidget> {
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    if (widget.readyState(context) == null) {
      _isReady = true;
    } else {
      _ready();
    }
  }

  Future<void> _ready() async {
    if (widget.readyState(context) != null) {
      await widget.readyState(context)!();
    }
    if (mounted) {
      setState(() {
        _isReady = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return widget.loadingWidget();
    }
    return widget.buildWhenReady(context);
  }
}

abstract class ReadyState<T extends StatefulWidget> extends State<T> {
  bool _isReady = false;

  @protected
  Function? readyState(BuildContext context) => null;

  @protected
  Widget loadingWidget() {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @protected
  Widget buildWhenReady(BuildContext context);

  @override
  void initState() {
    super.initState();
    if (readyState(context) == null) {
      _isReady = true;
    } else {
      _ready();
    }
  }

  Future<void> _ready() async {
    if (readyState(context) != null) {
      await readyState(context)!();
    }
    if (mounted) {
      setState(() {
        _isReady = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return loadingWidget();
    }
    return buildWhenReady(context);
  }
}
