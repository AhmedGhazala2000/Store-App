import 'package:flutter/material.dart';
import 'package:store_app/models/products_model.dart';
import 'package:store_app/views/update_product_view.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Navigator.pushNamed(context, UpdateProductsView.id,
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            shadowColor: Colors.grey[300],
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    widget.product.title,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${widget.product.price.toString()}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          isFavorite = !isFavorite;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              left: 80,
              top: -60,
              child: Image.network(
                widget.product.image,
                height: 100,
                width: 100,
              )),
        ],
      ),
    );
  }
}
