import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_demo/models/product.dart';

class GlobalController extends GetxController {
  List<Product> _products = [];

  Map<String, Product> _favorites = Map();
  Map<String, Product> get favorites => _favorites;

  List<Product> get products => _products;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('global on init');

    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String productsString =
        await rootBundle.loadString('assets/products.json');

    this._products = (jsonDecode(productsString) as List)
        .map((e) => Product.fromJson(e))
        .toList();

    print('products fueron cargado');
    update(['produts']);
  }

  onFavorite(int index, bool isFavorite) {
    Product product = this._products[index];
    product.isFavorite = isFavorite;

    if (isFavorite) {
      this.favorites[product.name] = product;
    } else {
      this._favorites.remove(product.name);
    }

    update(['produts', 'favorites']);
  }
}
