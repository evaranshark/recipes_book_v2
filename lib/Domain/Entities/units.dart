import 'package:equatable/equatable.dart';

abstract class Units extends Equatable {
  final String value;
  const Units({required this.value});
}

class MassUnits extends Units {
  const MassUnits({required super.value});
  Units get kg => MassUnits(value: "kg");
  Units get g => MassUnits(value: "g");

  @override
  List<Object?> get props => [super.value];
}

class VolumeUnits extends Units {
  const VolumeUnits({required super.value});
  Units get ml => VolumeUnits(value: 'ml');
  Units get l => VolumeUnits(value: 'l');

  @override
  List<Object?> get props => [super.value];
}

class RelativeUnits extends Units {
  const RelativeUnits({required super.value});

  Units get glass => RelativeUnits(value: 'glass');
  Units get spoon => RelativeUnits(value: 'spoon');
  Units get tspoon => RelativeUnits(value: 'tea spoon');

  @override
  List<Object?> get props => [super.value];
}
