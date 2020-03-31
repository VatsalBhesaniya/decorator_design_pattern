import 'package:decorator_design_pattern/decorator/coffee.dart';
import 'package:decorator_design_pattern/decorator/coffeeDecorator.dart';

class ColdCoffee extends CoffeeDecorator {
  ColdCoffee(Coffee coffee) : super(coffee) {
    coffeeType = 'Cold';
  }

  @override
  String getCoffeeType() {
    return '${coffee.getCoffeeType()}\n- $coffeeType';
  }

  @override
  double getPrice() {
    return coffee.getPrice() + 7;
  }
}