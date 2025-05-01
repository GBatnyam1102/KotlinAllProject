import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

// ignore: camel_case_types
class Global_provider extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> cartItems = [];
  List<ProductModel> favoriteItems = [];
  int currentIdx = 0;
  double result = 0;
  void setProducts(List<ProductModel> data) {
    products = data;
    notifyListeners();
  }

  void addCartItems(ProductModel item) {
    int tooUtga = 0;
    for (var element in cartItems) {
      if (element.id == item.id) {
        tooUtga++;
        addCount(element);
        break;
      }
    }
    if (tooUtga == 0) {
      cartItems.add(item);
    }
    notifyListeners();
  }

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }

  void setFavorite(ProductModel product) {
    if (product.isFavorite) {
      product.isFavorite = false;
      favoriteItems.remove(product);
    } else {
      product.isFavorite = true;
      if (favoriteItems.any((item) => item.id == product.id)) {
      } else {
        favoriteItems.add(product);
      }
    }
    notifyListeners();
  }

  void addCount(ProductModel product) {
    product.count++;
    notifyListeners();
  }

  void multiCount(ProductModel product) {
    if (product.count > 1) {
      product.count--;
    } else {
      cartItems.remove(product);
    }
    notifyListeners();
  }

  double resultCalc(ProductModel data) {
    result = data.count * data.price!;
    return result;
  }
}
