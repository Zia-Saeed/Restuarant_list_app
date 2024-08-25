class Restaurant {
  final int id;
  final String name;
  final String cuisine;

  Restaurant({
    required this.id,
    required this.name,
    required this.cuisine,
  });

  static Restaurant fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      cuisine: json['cuisine'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cuisine': cuisine,
    };
  }
}
