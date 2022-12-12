///Determines width breakpoints for different device types
class Breakpoints {
  ///Lowest value for tablet
  final double tablet;

  ///Lowest value for desktop
  final double desktop;

  ///Lowest value for large desktop
  final double largeDesktop;
  const Breakpoints({
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
  });
}
