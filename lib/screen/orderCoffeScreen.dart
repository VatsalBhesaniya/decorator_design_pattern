import 'package:decorator_design_pattern/decorator/coffee.dart';
import 'package:decorator_design_pattern/decorator/coffeeFlavour.dart';
import 'package:decorator_design_pattern/decorator/coffeeMenu.dart';
import 'package:flutter/material.dart';

class OrderCoffeScreen extends StatefulWidget {
  @override
  _OrderCoffeScreenState createState() => _OrderCoffeScreenState();
}

class _OrderCoffeScreenState extends State<OrderCoffeScreen> {
  Coffee coffee;
  final CoffeeMenu coffeeMenu = CoffeeMenu();
  Map<int, CoffeeFlavour> coffeFlavoursMap;
  int selectedIndex = 0;
  List<String> coffeeList = [
    "Regular Coffee",
    "Cappuccino",
    "Espresso",
    "custom"
  ];
  Map<int, CoffeeFlavour> _coffeeFlavoursMap;

  @override
  void initState() {
    super.initState();
    coffeFlavoursMap = coffeeMenu.getCoffeeFlavoursMap();
    coffee = coffeeMenu.getCoffee(0, coffeFlavoursMap);
    _coffeeFlavoursMap = coffeeMenu.getCoffeeFlavoursMap();
  }

  void _onSelectedIndexChanged(int index) {
    _setSelectedIndex(index);
    _setSelectedCoffee(index);
  }

  void _setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _setSelectedCoffee(int index) {
    setState(() {
      coffee = coffeeMenu.getCoffee(index, coffeFlavoursMap);
    });
  }

  void _onCustomCoffeeSelected(int index, bool selected) {
    _setCoffeeSelected(index, selected);
    _setSelectedCoffee(selectedIndex);
  }

  void _setCoffeeSelected(int index, bool selected) {
    setState(() {
      coffeFlavoursMap[index].setSelected(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Coffe"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Select your coffee:',
                    style: Theme.of(context).textTheme.title,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  for (var i = 0; i < coffeeList.length; i++)
                    RadioListTile(
                      title: Text(coffeeList[i]),
                      value: i,
                      groupValue: selectedIndex,
                      selected: i == selectedIndex,
                      activeColor: Colors.black,
                      controlAffinity: ListTileControlAffinity.platform,
                      onChanged: (value) {
                        _onSelectedIndexChanged(value);
                      },
                    ),
                ],
              ),
              selectedIndex == 3 ? ListView(
                shrinkWrap: true,
                children: _coffeeFlavoursMap.keys.map((int index) {
                  return new CheckboxListTile(
                    title: new Text(_coffeeFlavoursMap[index].flavour),
                    value: _coffeeFlavoursMap[index].selected,
                    onChanged: (bool value) {
                      _onCustomCoffeeSelected(index, value);
                      setState(() {
                        _coffeeFlavoursMap[index].selected = value;
                      });
                    },
                  );
                }).toList(),
              ) : Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Order details:',
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    coffee.getCoffeeType(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 8.0),
                  Text('Price: \$${coffee.getPrice().toStringAsFixed(2)}'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
