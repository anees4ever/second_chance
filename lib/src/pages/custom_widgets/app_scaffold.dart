import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  final String title;
  final List<Widget> actions;
  final Widget body;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottomChild;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  const AppScaffold({
    super.key,
    required this.title,
    this.actions = const [],
    required this.body,
    this.automaticallyImplyLeading = true,
    this.bottomChild,
    this.floatingActionButton,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.bottomNavigationBar,
  });

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: widget.automaticallyImplyLeading,
        title: Text(widget.title),
        bottom: widget.bottomChild,
        actions: widget.actions,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.body,
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
