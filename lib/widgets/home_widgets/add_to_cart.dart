import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/src/extensions/bool_ext.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          
          if(!isInCart){
            isInCart = isInCart.toggle();
          final _catalog = Catalogmodel();
          
          _cart.add(widget.catalog);
          _cart.catalog = _catalog;
          setState(() {
            
          });
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                // ignore: deprecated_member_use
                context.theme.buttonColor,
                ),
            shape: MaterialStateProperty.all(
              const StadiumBorder(),
            )),
        child: isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_fill_badge_plus),
      );
    }
}
