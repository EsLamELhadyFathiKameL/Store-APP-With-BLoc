import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Services/my_api_service.dart';

class MyGetCategoryService {
  Future<List<MyProductModeL>> myGetCategoryService(
      {required String categoryName}) async {
    List<dynamic> jsonData = await MyApiService().myGetRequestService(
      request: "https://fakestoreapi.com/products/category/$categoryName",
    );
    List<MyProductModeL> myProductsList = [];
    for (var product in jsonData) {
      myProductsList.add(MyProductModeL.fromJson(product));
    }
    return myProductsList;
  }
}
