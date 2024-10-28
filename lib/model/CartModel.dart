import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartProduct {
  final String id;
  final String name;
  final double price;
  final int quantity;

  CartProduct(
      {required this.id,
      required this.name,
      required this.price,
      this.quantity = 1});

  CartProduct copyWith(
      {String? id, String? name, double? price, int? quantity}) {
    return CartProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartNotifier extends StateNotifier<List<CartProduct>> {
  CartNotifier() : super([]);

  void addCartProduct(CartProduct cartProduct) {
    if (state.any((product) => product.id == cartProduct.id)) {
      state = state.map((product) {
        if (product.id == cartProduct.id) {
          return product.copyWith(quantity: product.quantity + 1);
        }
        return product;
      }).toList();
      return;
    }
    state = [...state, cartProduct];
  }

  void updateQuantity(String id, int quantity) {
    state = state.map((cartProduct) {
      if (cartProduct.id == id) {
        if (quantity > 0) {
          return cartProduct.copyWith(quantity: quantity);
        }
      }
      return cartProduct;
    }).toList();
  }

  void removeCartProduct(String id) {
    state = state.where((cartProduct) => cartProduct.id != id).toList();
  }

  void clearCart() {
    state = [];
  }

  double get totalPrice => state.fold(
      0, (total, current) => total + (current.price * current.quantity));
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<CartProduct>>((ref) {
  return CartNotifier();
});
