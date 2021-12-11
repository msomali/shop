import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem(this.id, this.title, this.imageUrl, {Key? key})
  //     : super(key: key);

  // final String id;
  // final String title;
  // final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          // leading: IconButton(
          //   icon: Icon(
          //     product.isFavourite ? Icons.favorite : Icons.favorite_border,
          //     color: Theme.of(context).accentColor,
          //   ),
          //   onPressed: () {
          //     product.toggleFavouriteStatus();
          //   },
          // ),
          // Alternative to Provider. Consumer used to update parts of the Widget rather than Provider
          leading: Consumer<Product>(
            // Child is added for the parts that you dont want to change when Widget renders. Consumer can also be used in substitute of Provider.
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                product.isFavourite ? Icons.favorite : Icons.favorite_border,
                // label: child,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                product.toggleFavouriteStatus();
              },
            ),
            // child: Text('Never changes!'),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              cart.addItem(
                product.id,
                product.title,
                product.price,
              );
            },
          ),
        ),
      ),
    );
  }
}
