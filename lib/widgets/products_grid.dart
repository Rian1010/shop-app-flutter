import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/product.dart';

import 'package:flutter_complete_guide/providers/products.dart';
import 'package:flutter_complete_guide/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    // Gives access to the Products object
    final productsData = Provider.of<Products>(context);
    final List products =
        showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 3/2 taller than the width
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      // Preferred way
      // itemBuilder: (ctx, i) => ChangeNotifierProvider<ChangeNotifier?>(
      //   create: (c) => products[i],
      itemBuilder: (ctx, i) => ChangeNotifierProvider<Product>.value(
        value: products[i],
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            ),
      ),
    );
  }
}
