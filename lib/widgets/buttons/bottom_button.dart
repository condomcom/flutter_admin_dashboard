import 'package:admin/utils/constants.dart';
import 'package:admin/utils/responsive.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.padding,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final Function() onTap;
  final EdgeInsets? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: size.width,
            height: 60,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: backgroundColor,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: onTap,
              child: Text(title),
            ),
          ),
        ),
      ),
    );
  }
}
