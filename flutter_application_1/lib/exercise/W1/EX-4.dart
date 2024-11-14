void main() {
  // map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // for example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  double total = 0;
  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;
    } else {
      print('$pizza pizza is not on the menu');
    }
  }
  print('total : $total');
}
