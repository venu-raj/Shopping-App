import 'package:flutter/material.dart';
import 'package:shopping_app_demo/core/theme/pallete.dart';

class ProductGridViewWidget extends StatelessWidget {
  final String imagePath;
  final String brandName;
  final String title;
  final double price;
  const ProductGridViewWidget({
    super.key,
    required this.imagePath,
    required this.brandName,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Pallete.borderColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  brandName,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  "\$ ${price.floor()}",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
