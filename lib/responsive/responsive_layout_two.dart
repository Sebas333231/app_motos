import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget desktopBody;

  const Responsive({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
    required this.desktopBody,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 510) {
            return mobileBody;
          }else if (constraints.maxWidth <= 900) {
            return tabletBody;
          }else {
            return desktopBody;
          }
        }
    );
  }
}