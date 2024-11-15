import 'package:flutter/material.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Services/my_api_service.dart';

class MyAddNewProductService {
  Future<MyProductModeL> myAddNewProductService({
    required String newProductTitLe,
    required String newProductPrice,
    required String newProductDescription,
    required String newProductImage,
    required String newProductCategory,
  }) async {
    Map<String, dynamic> jsonData = await MyApiService().myPostRequestService(
      request: "https://fakestoreapi.com/products",
      body: {
        "title": newProductTitLe,
        "price": newProductPrice,
        "description": newProductDescription,
        "image": newProductImage,
        "category": newProductCategory,
      },
    );
    debugPrint("New Product : $jsonData");
    return MyProductModeL.fromJson(jsonData);
  }
}
