import 'package:recipes_book_v2/Domain/Entities/units.dart';

class UnitsResolver {
  final Map<String, Units> _unitsMap = {
    'kg': MassUnits.kg,
    'g': MassUnits.g,
    'mg': MassUnits.mg,
    'ml': VolumeUnits.ml,
    'l': VolumeUnits.l,
    'glass': RelativeUnits.glass,
    'spoon': RelativeUnits.spoon,
    'tea spoon': RelativeUnits.tspoon
  };
  Units getUnits(String unitsValue) {
    return _unitsMap[unitsValue] ?? CustomUnits(value: unitsValue);
  }
}
