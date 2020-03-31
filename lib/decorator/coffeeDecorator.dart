import 'package:decorator_design_pattern/decorator/coffee.dart';

abstract class  CoffeeDecorator extends Coffee {
  final Coffee coffee;

  CoffeeDecorator(this.coffee);

  @override
  String getCoffeeType() {
    return coffee.getCoffeeType();
  }

  @override
  double getPrice() {
    return coffee.getPrice();
  }
}