import 'package:equatable/equatable.dart';

abstract class Units extends Equatable {
  final String value;
  const Units({required this.value});
}

class MassUnits extends Units {
  const MassUnits({required super.value});
  static Units get kg => const MassUnits(value: "kg");
  static Units get g => const MassUnits(value: "g");
  static Units get mg => const MassUnits(value: "mg");

  @override
  List<Object?> get props => [super.value];
}

class VolumeUnits extends Units {
  const VolumeUnits({required super.value});
  static Units get ml => const VolumeUnits(value: 'ml');
  static Units get l => const VolumeUnits(value: 'l');

  @override
  List<Object?> get props => [super.value];
}

class RelativeUnits extends Units {
  const RelativeUnits({required super.value});

  static Units get glass => const RelativeUnits(value: 'glass');
  static Units get spoon => const RelativeUnits(value: 'spoon');
  static Units get tspoon => const RelativeUnits(value: 'tea spoon');

  @override
  List<Object?> get props => [super.value];
}

class CustomUnits extends Units {
  const CustomUnits({required super.value});

  @override
  List<Object?> get props => [super.value];
}
