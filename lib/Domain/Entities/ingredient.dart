import 'package:equatable/equatable.dart';
import '/Domain/Entities/units.dart';

class Ingredient extends Equatable {
  final String id;
  final String name;
  final Units units;
  final double amount;

  Ingredient({
    required this.id,
    required this.name,
    required this.units,
    required this.amount,
  });

  @override
  List<Object?> get props => [id, name, units, amount];
}
