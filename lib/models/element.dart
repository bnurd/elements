class ElementModel {
  int number;
  String name;
  String symbol;
  String extract;
  String source;
  String category; // enum
  String atomicWeight; // double
  bool visible = true;

  ElementModel({
    required this.number,
    required this.name,
    required this.symbol,
    required this.extract,
    required this.source,
    required this.category,
    required this.atomicWeight,
  });

  ElementModel.fromJson(dynamic json)
      : number = int.parse(json["number"].toString()),
        name = json["name"].toString(),
        symbol = json["symbol"].toString(),
        extract = json["extract"].toString(),
        source = json["source"].toString(),
        category = json["category"].toString(),
        atomicWeight = json["atomicWeight"].toString();
}
