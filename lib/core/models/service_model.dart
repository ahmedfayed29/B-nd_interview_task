class ServiceModel {
  int id;
  String mainImage;
  int price;
  dynamic discount;
  int priceAfterDiscount;
  String title;
  int averageRating;
  int completedSalesCount;
  bool recommended;

  ServiceModel({
    required this.id,
    required this.mainImage,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount,
    required this.recommended,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json["id"],
        mainImage: json["main_image"],
        price: json["price"],
        discount: json["discount"],
        priceAfterDiscount: json["price_after_discount"],
        title: json["title"],
        averageRating: json["average_rating"],
        completedSalesCount: json["completed_sales_count"],
        recommended: json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main_image": mainImage,
        "price": price,
        "discount": discount,
        "price_after_discount": priceAfterDiscount,
        "title": title,
        "average_rating": averageRating,
        "completed_sales_count": completedSalesCount,
        "recommended": recommended,
      };
}
