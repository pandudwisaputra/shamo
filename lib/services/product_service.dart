import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shamo/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'http://178.128.62.145/api';

  Future<List<ProductModel>> getProducts() async {
    Uri url = Uri.parse('$baseUrl/products');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Gagal Get Products');
    }
  }
}
