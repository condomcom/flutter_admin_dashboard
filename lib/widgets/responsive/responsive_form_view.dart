import 'package:admin/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResponsiveCenteredView extends StatelessWidget {
  const ResponsiveCenteredView({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveView(child: child),
    );
  }
}
