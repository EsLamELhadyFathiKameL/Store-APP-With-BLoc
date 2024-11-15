class MyProductModeL {
  final int productID;
  final String productTitLe;
  final dynamic productPrice;
  final String productDescription;
  final String productImage;
  final String productCategory;
  final MyProductRatingModeL? productRating;

  MyProductModeL({
    required this.productID,
    required this.productTitLe,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.productCategory,
    required this.productRating,
  });
  factory MyProductModeL.fromJson(json) {
    return MyProductModeL(
      productID: json["id"],
      productTitLe: json["title"],
      productPrice: json["price"],
      productDescription: json["description"],
      productImage: json["image"],
      productCategory: json["category"],
      productRating: json["rating"] != null
          ? MyProductRatingModeL.fromJson(json["rating"])
          : null,
    );
  }
}

class MyProductRatingModeL {
  final dynamic productRate;
  final int productCount;

  MyProductRatingModeL({
    required this.productRate,
    required this.productCount,
  });
  factory MyProductRatingModeL.fromJson(json) {
    return MyProductRatingModeL(
      productRate: json["rate"],
      productCount: json["count"],
    );
  }
}
