class Description {
  Description._({
    required this.uz,
    required this.ru,
    required this.en,});

  factory Description.fromJson(dynamic json)=>Description._(
      uz : json['uz'],
      ru : json['ru'],
      en : json['en']

  );
 final String uz;
 final String ru;
 final String en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uz'] = uz;
    map['ru'] = ru;
    map['en'] = en;
    return map;
  }

}