import 'package:my_store_app/Services/my_api_service.dart';

class MyGetALLCategoriesService {
  Future<List<dynamic>> myGetALLCategoriesService() async {
    List<dynamic> jsonData = await MyApiService().myGetRequestService(
      request: "https://fakestoreapi.com/products/categories",
    );
    return jsonData;
  }
}
