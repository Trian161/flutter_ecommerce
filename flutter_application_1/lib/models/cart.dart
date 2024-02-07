import 'package:flutter/material.dart';
import 'package:flutter_app1/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: "Nike Dunk",
      price: "89",
      imagePath: 'lib/images/nike_dunk.png',
      description: 'The Forward design of his latest signature shoe',
    ),
    Shoe(
      name: "UnderArmor",
      price: "111",
      imagePath: 'lib/images/under_armor.png',
      description: 'You\'ve got the hops and the speed-lace up in shoes',
    ),
    Shoe(
      name: "Air Jordan",
      price: "289",
      imagePath: 'lib/images/air_jordan_1.png',
      description:
          'Bouncy cushioning is paired with soft yet supportive for rest',
    ),
    Shoe(
      name: "kyrie",
      price: "129",
      imagePath: 'lib/images/kyrie.png',
      description: 'A secure midfoot strap is suited for scoring',
    ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getshoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
