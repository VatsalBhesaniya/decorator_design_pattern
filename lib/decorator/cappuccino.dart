import 'package:decorator_design_pattern/decorator/coffee.dart';
import 'package:decorator_design_pattern/decorator/coffeeDecorator.dart';

class Cappuccino extends CoffeeDecorator {
  Cappuccino(Coffee coffee) : super(coffee) {
    coffeeType = 'Cappuccino';
  }

  @override
  String getCoffeeType() {
    return '${coffee.getCoffeeType()}\n- $coffeeType';
  }

  @override
  double getPrice() {
    return coffee.getPrice() + 20;
  }
}