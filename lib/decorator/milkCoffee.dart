import 'package:decorator_design_pattern/decorator/coffee.dart';
import 'package:decorator_design_pattern/decorator/coffeeDecorator.dart';

class MilkCoffee extends CoffeeDecorator {
  MilkCoffee(Coffee coffee) : super(coffee) {
    coffeeType = 'Milk';
  }

  @override
  String getCoffeeType() {
    return '${coffee.getCoffeeType()}\n- $coffeeType';
  }

  @override
  double getPrice() {
    return coffee.getPrice() + 8;
  }
}