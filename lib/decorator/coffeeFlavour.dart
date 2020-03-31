class CoffeeFlavour {
  final String flavour;
  bool selected = false;

  CoffeeFlavour(this.flavour);

  void setSelected(bool value) {
    selected = value;
  }
}