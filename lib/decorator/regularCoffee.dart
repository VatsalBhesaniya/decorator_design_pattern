import 'package:decorator_design_pattern/decorator/coffee.dart';

class RegularCoffee extends Coffee {
  RegularCoffee(String coffeeType) {
    this.coffeeType = coffeeType;
  }

  @override
  String getCoffeeType() {
    return coffeeType;
  }

  @override
  double getPrice() {
    return 5.0;
  }
}