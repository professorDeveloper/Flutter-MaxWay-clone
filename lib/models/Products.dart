import 'Title.dart';
import 'Description.dart';

class Product {
  Product._({
    required this.id,
    required this.outPrice,
    required this.currency,
    required this.string,
    required this.type,
    required this.categories,
    required this.brandId,
    required this.rateId,
    required this.image,
    required this.activeInMenu,
    required this.hasModifier,
    required this.fromTime,
    required this.toTime,
    required this.offAlways,
    required this.gallery,
    required this.title,
    required this.description,
    required this.active,
    required this.iikoId,
    required this.jowiId,});

  factory Product.fromJson(dynamic json) =>
      Product._(
        id: json['id'],
        outPrice: json['out_price'],
        currency: json['currency'],
        string: json['string'],
        type: json['type'],
        categories:  json['categories'].cast<String>(),
        brandId: json['brand_id'],
        rateId: json['rate_id'],
        image: json['image'],
        activeInMenu: json['active_in_menu'],
        hasModifier: json['has_modifier'],
        fromTime: json['from_time'],
        toTime: json['to_time'],
        offAlways: json['off_always'],
        gallery: json['gallery'],
        title: Title.fromJson(json['title']),
        description: Description.fromJson(json['description']),
        active: json['active'],
        iikoId: json['iiko_id'],
        jowiId: json['jowi_id']
      );

  String id;
  int outPrice;
  String currency;
  String string;
  String type;
  List<String> categories;
  String brandId;
  String rateId;
  String image;
  bool activeInMenu;
  bool hasModifier;
  String fromTime;
  String toTime;
  bool offAlways;
  dynamic gallery;
  Title title;
  Description description;
  bool active;
  String iikoId;
  String jowiId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['out_price'] = outPrice;
    map['currency'] = currency;
    map['string'] = string;
    map['type'] = type;
    map['categories'] = categories;
    map['brand_id'] = brandId;
    map['rate_id'] = rateId;
    map['image'] = image;
    map['active_in_menu'] = activeInMenu;
    map['has_modifier'] = hasModifier;
    map['from_time'] = fromTime;
    map['to_time'] = toTime;
    map['off_always'] = offAlways;
    map['gallery'] = gallery;
    if (title != null) {
      map['title'] = title.toJson();
    }
    if (description != null) {
      map['description'] = description.toJson();
    }
    map['active'] = active;
    map['iiko_id'] = iikoId;
    map['jowi_id'] = jowiId;
    return map;
  }

}