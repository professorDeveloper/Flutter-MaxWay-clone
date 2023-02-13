import 'Description.dart';
import 'Title.dart';
import 'Products.dart';

class Categories {
  Categories._({
    required this.id,
    required this.slug,
    required this.parentId,
    required this.image,
    required this.description,
    required this.title,
    required this.products,
    required this.orderNo,
    required this.active,
    this.childCategories,
  });

  factory Categories.fromJson(dynamic json) => Categories._(
        id: json['id'],
        slug: json['slug'],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    parentId: json['parent_id'],
        image: json['image'],
        description: (Description.fromJson(json['description'])),
        title: (Title.fromJson(json['title'])),
        orderNo: json['order_no'],
        active: json['active'],
        childCategories: json['child_categories'],
      );
  String id;
  String slug;
  String parentId;
  List<Product> products;
  String image;
  Description description;
  Title title;
  String orderNo;
  bool active;
  dynamic childCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['products']=products;
    map['slug'] = slug;
    map['parent_id'] = parentId;
    map['image'] = image;
    map['description'] = description.toJson();
    map['title'] = title.toJson();
    map['order_no'] = orderNo;
    map['active'] = active;
    map['child_categories'] = childCategories;
    return map;
  }
}
