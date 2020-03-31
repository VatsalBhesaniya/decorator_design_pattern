import 'package:decorator_design_pattern/decorator/cappuccino.dart';
import 'package:decorator_design_pattern/decorator/coffee.dart';
import 'package:decorator_design_pattern/decorator/coffeeFlavour.dart';
import 'package:decorator_design_pattern/decorator/coldCoffe.dart';
import 'package:decorator_design_pattern/decorator/espresso.dart';
import 'package:decorator_design_pattern/decorator/milkCoffee.dart';
import 'package:decorator_design_pattern/decorator/regularCoffee.dart';

class CoffeeMenu {
  final Map<int, CoffeeFlavour> _coffeeFlavoursMap = {
    1: CoffeeFlavour('Cold Coffee'),
    2: CoffeeFlavour('Hot Coffee'),
  };

  Map<int, CoffeeFlavour> getCoffeeFlavoursMap() => _coffeeFlavoursMap;

  Coffee getCoffee(int index, Map<int, CoffeeFlavour> coffeeFlavoursMap) {
    switch (index) {
      case 0:
        return _getRegularCoffee();
      case 1:
        return _getCappuccino();
      case 2:
        return _getEspresso();
      case 3:
        return _getCustomCoffee(_coffeeFlavoursMap);
    }

    throw Exception("Index of '$index' does not exist.");
  }

  Coffee _getRegularCoffee() {
    Coffee coffee = RegularCoffee('Regular Coffee');

    return coffee;
  }

  Coffee _getCappuccino() {
    Coffee coffee = RegularCoffee('Cappuccino Coffee');
    coffee = Cappuccino(coffee);

    return coffee;
  }

  Coffee _getEspresso() {
    Coffee coffee = RegularCoffee('Espresso Coffee');
    coffee = Espresso(coffee);

    return coffee;
  }

  Coffee _getCustomCoffee(Map<int, CoffeeFlavour> coffeeFlavoursMap) {
    Coffee pizza = RegularCoffee('Custom Coffee');

    if (coffeeFlavoursMap[1].selected) {
      pizza = ColdCoffee(pizza);
    }

    if (coffeeFlavoursMap[2].selected) {
      pizza = MilkCoffee(pizza);
    }

    return pizza;
  }
}
