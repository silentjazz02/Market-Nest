import 'package:flutter/foundation.dart';
import 'package:marketnest/app/modules/productListing/models/productListModel.dart';
import 'package:marketnest/core/apiServices/services.dart';
import '../models/productModel.dart';

enum ProductState { initial, loading, loaded, error }

class ProductProvider with ChangeNotifier {
  final Services _api = Services();

  List<Product> _products = [];
  ProductState _state = ProductState.initial;
  String? _error;

  List<Product> get products => _products;
  ProductState get state => _state;
  String? get error => _error;

  Future<void> loadProducts({int limit = 30}) async {
    _state = ProductState.loading;
    _error = null;
    notifyListeners();

    try {
      final fetchedRaw = await _api.getProducts({"limit": limit});
      if (fetchedRaw == null) {
        _products = [];
        _error = 'Failed to fetch products';
        _state = ProductState.error;
      } else {
        final fetched = ProductListModel.fromJson(fetchedRaw);
        if (fetched.products!.isEmpty) {
          _products = [];
          _error = 'No products available';
          _state = ProductState.loaded;
        } else {
          _products = fetched.products ?? [];
          _error = null;
          _state = ProductState.loaded;
        }
      }

    } catch (e) {
      _error = e.toString();
      _state = ProductState.error;
    }
    notifyListeners();
  }
}