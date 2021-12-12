import 'package:admin/utils/responsive.dart';
import 'package:flutter/material.dart';

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: Responsive.isMobile(context) ? null : size.width * 0.5,
      child: child,
    );
  }
}
