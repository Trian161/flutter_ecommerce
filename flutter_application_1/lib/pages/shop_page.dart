// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app1/components/shoe_tile.dart';
import 'package:flutter_app1/models/cart.dart';
import 'package:flutter_app1/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // add shoe to cart
    void addShoeToCart(Shoe shoe) {
      Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

      // alert the user, shoe successfully added
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Successfully added '),
          content: Text('Check your cart'),
        ),
      );
    }

    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        // search bar
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          // message
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Text(
              'everyone flies... some fly longer than others',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          // hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  'Hot Picks...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'See All...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // List of view shoes
          Expanded(
            child: ListView.builder(
              itemCount: value.getshoeList().length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a shoe from shoe list
                Shoe shoe = value.getshoeList()[index];
                // return the shoe
                return ShoeTile(
                  onTap: () => addShoeToCart(shoe),
                  shoe: shoe,
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Divider(
              color: Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}
