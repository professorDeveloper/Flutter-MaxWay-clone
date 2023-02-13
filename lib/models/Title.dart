 class Title {
  Title._({
     required this.uz,
     required this.ru,
     required this.en,});

 factory Title.fromJson(dynamic json) => Title._(
     uz : json['uz'],
     ru : json['ru'],
     en : json['en'],
 );
  String uz;
  String ru;
  String en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uz'] = uz;
    map['ru'] = ru;
    map['en'] = en;
    return map;
  }

}