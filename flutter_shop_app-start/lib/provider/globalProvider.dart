import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/models/users.dart';

// ignore: camel_case_types
class Global_provider extends ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> cartItems = [];
  List<ProductModel> favoriteItems = [];
  List<UserModel> users = [];
  bool islog = false;
  List<String> promotionCodes = [
    "png1254",
    "SUMMER25",
    "FALLSAVE10",
    "WELCOME5",
    "FREESHIPNOW",
    "BUNDLEUP",
    "NEWYEAR20",
    "SPRINGBLOOM",
    "LUCKY77",
    "GETIT15",
    "THANKYOU"
  ];
  String username = "";
  String email = "";
  int currentIdx = 0;
  double result = 0;
  void setProducts(List<ProductModel> data) {
    products = data;
    notifyListeners();
  }

  void setUsers(List<UserModel> data) {
    users = data;
    notifyListeners();
  }

  bool checkUserLogin(UserModel user) {
    if (user.username == "" && user.email == "") {
      islog = false;
      return false;
    }
    islog = true;
    return true;
  }

  UserModel? isLoggedIn(String userName, String passWord) {
    for (var user in users) {
      if (user.username == userName && user.password == passWord) {
        islog = true;
        return user;
      }
    }
    islog = false;
    return null;
  }

  void changeUser(String uName, String uEmail) {
    username = uName;
    email = uEmail;
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

  void deletItem(ProductModel data) {
    favoriteItems.remove(data);
    notifyListeners();
  }

  void deleteItemCart(ProductModel data) {
    cartItems.remove(data);
    notifyListeners();
  }
}
