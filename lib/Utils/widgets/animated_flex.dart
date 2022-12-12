import 'package:flutter/widgets.dart';

class AnimatedFlex extends AnimatedWidget {
  const AnimatedFlex({required this.child, flex}) : super(listenable: flex);
  Animation<int> get flex => listenable as Animation<int>;

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex.value,
      child: child,
    );
  }
}
