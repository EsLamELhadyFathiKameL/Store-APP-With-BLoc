import 'package:flutter/material.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Services/my_api_service.dart';

class MyUpdateProductService {
  Future<MyProductModeL> myUpdateProductService({
    required int productID,
    required String newProductTitLe,
    required String newProductPrice,
    required String newProductDescription,
    required String newProductImage,
    required String newProductCategory,
  }) async {
    debugPrint("ProductId = $productID");
    Map<String, dynamic> jsonData = await MyApiService().myPutRequestService(
      request: "https://fakestoreapi.com/products/$productID",
      body: {
        "title": newProductTitLe,
        "price": newProductPrice,
        "description": newProductDescription,
        "image": newProductImage,
        "category": newProductCategory,
      },
    );
    debugPrint("Product After Updated : $jsonData");
    return MyProductModeL.fromJson(jsonData);
  }
}
