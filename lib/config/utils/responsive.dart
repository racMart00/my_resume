import 'package:flutter/material.dart';

class Responsive {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 904;

  static bool isTablet(BuildContext context) => MediaQuery.sizeOf(context).width < 1280 && MediaQuery.sizeOf(context).width >= 904;

  static bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width >= 1280;
}