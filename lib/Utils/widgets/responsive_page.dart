import 'package:flutter/material.dart';
import 'package:recipes_book_v2/locator.dart';
import '/Utils/breakpoints.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });

  final Widget phone;
  final Widget tablet;
  final Widget desktop;
  static final breakpoints = locator.get<Breakpoints>();

  static bool isPhone(BuildContext context) =>
      MediaQuery.of(context).size.width <= breakpoints.tablet;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > breakpoints.tablet &&
      MediaQuery.of(context).size.width <= breakpoints.desktop;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > breakpoints.desktop &&
      MediaQuery.of(context).size.width <= breakpoints.largeDesktop;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > breakpoints.largeDesktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= breakpoints.desktop) {
        return desktop;
      }
      if (constraints.maxWidth >= breakpoints.tablet) {
        return tablet;
      }
      return phone;
    });
  }
}
