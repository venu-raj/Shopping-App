import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_demo/core/theme/pallete.dart';
import 'package:shopping_app_demo/features/cart/providers/cart_provider.dart';
import 'package:shopping_app_demo/features/cart/screens/cart_screen.dart';
import 'package:shopping_app_demo/features/home/widgets/icon_container_widget.dart';
import 'package:shopping_app_demo/models/product_model.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final ProductModel productModel;
  const ProductDetailsScreen({
    super.key,
    required this.productModel,
  });

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  final List<String> sizes = ["S", "M", "L", "XL"];
  late String selectedSize;

  @override
  void initState() {
    super.initState();
    selectedSize = sizes[0];
  }

  void addToCart() {
    ref.read(cartProvider).addProductToCart(product: widget.productModel);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Cart added successfully"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Pallete.imageBackgroundColor,
              width: double.infinity,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      widget.productModel.imagePath,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 45,
                            height: 45,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const IconContainerWidget(
                                backgroungColor: Pallete.whiteColor,
                                imagePath: "assets/icons/Arrow - Left.png",
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CartScreen(),
                                ),
                              );
                            },
                            child: const SizedBox(
                              width: 45,
                              height: 45,
                              child: IconContainerWidget(
                                backgroungColor: Pallete.whiteColor,
                                imagePath: "assets/icons/appbar_icon2.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Pallete.whiteColor,
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Column(
                  children: [
                    //Name and Prices
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Arraival",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Pallete.greyColor,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.productModel.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Price",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Pallete.greyColor,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "\$ ${widget.productModel.price}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //sizes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sizes",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            itemCount: sizes.length,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSize = sizes[index];
                                    });
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: selectedSize == sizes[index]
                                          ? Pallete.purpleColor
                                          : Pallete.borderColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
                                          sizes[index],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    //button
                    ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Pallete.purpleColor,
                        fixedSize: const Size(double.infinity, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Pallete.whiteColor,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
