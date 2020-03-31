import 'package:decorator_design_pattern/decorator/coffee.dart';
import 'package:decorator_design_pattern/decorator/coffeeDecorator.dart';

class Espresso extends CoffeeDecorator {
  Espresso(Coffee coffee) : super(coffee) {
    coffeeType = 'Espresso';
  }

  @override
  String getCoffeeType() {
    return '${coffee.getCoffeeType()}\n- $coffeeType';
  }

  @override
  double getPrice() {
    return coffee.getPrice() + 10;
  }
}
