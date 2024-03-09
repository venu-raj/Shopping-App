import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app_demo/models/product_model.dart';

final cartProvider = Provider<CartProvider>((ref) {
  return CartProvider();
});

class CartProvider {
  final List<ProductModel> productModel = [];

  void addProductToCart({
    required ProductModel product,
  }) {
    productModel.add(product);
  }

  void removeProductFromCart(ProductModel product) {
    productModel.remove(product);
  }
}
