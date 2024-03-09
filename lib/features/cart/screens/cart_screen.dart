import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_demo/core/theme/pallete.dart';
import 'package:shopping_app_demo/features/cart/providers/cart_provider.dart';
import 'package:shopping_app_demo/features/home/widgets/icon_container_widget.dart';
import 'package:shopping_app_demo/models/product_model.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  late int itemCount;

  @override
  void initState() {
    super.initState();
    itemCount = 1;
  }

  void removeFromCart(WidgetRef ref, ProductModel product) {
    ref.watch(cartProvider).removeProductFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider).productModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: cart.isNotEmpty
          ? ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartmodel = cart[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Dismissible(
                    key: Key(cartmodel.brandName),
                    onDismissed: (direction) {
                      removeFromCart(ref, cartmodel);
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              cartmodel.imagePath,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartmodel.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      cartmodel.brandName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: Pallete.greyColor),
                                    ),
                                    Text(
                                      "\$ ${cartmodel.price.floor()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: Pallete.greyColor),
                                    ),
                                    const SizedBox(width: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (itemCount > 1) {
                                              setState(() {
                                                itemCount -= 1;
                                              });
                                            } else {
                                              return;
                                            }
                                          },
                                          child: const IconContainerWidget(
                                            backgroungColor:
                                                Pallete.borderColor,
                                            imagePath: "assets/icons/uprow.png",
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          itemCount.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(width: 8),
                                        GestureDetector(
                                          onTap: () {
                                            if (itemCount > 0) {
                                              setState(() {
                                                itemCount += 1;
                                              });
                                            }
                                          },
                                          child: const IconContainerWidget(
                                            backgroungColor:
                                                Pallete.borderColor,
                                            imagePath:
                                                "assets/icons/downrow.png",
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        removeFromCart(ref, cartmodel);
                                      });
                                    },
                                    child: const IconContainerWidget(
                                      radius: 10,
                                      backgroungColor: Pallete.borderColor,
                                      imagePath: "assets/icons/Delete.png",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text("There is nothing to show here"),
            ),
    );
  }
}
