import 'package:flutter/material.dart';
import 'package:shoe_store/models/product_model.dart';
import 'package:shoe_store/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _product = [];
  List<ProductModel> get products => _product;

  set products(List<ProductModel> products) {
    _product = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _product = products;
    } catch (e) {
      print(e);
    }
  }
}
