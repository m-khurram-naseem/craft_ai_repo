import 'dart:convert';

class Link {
  static const urlKey = 'url' , nameKey = 'linkName';
  String url;
  String name;  
  Link({
    required this.url,
    required this.name,
  });

  Link copyWith({
    String? url,
    String? name,
  }) {
    return Link(
      url: url ?? this.url,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      urlKey : url,
      nameKey : name,
    };
  }

  factory Link.fromMap(Map<String, dynamic> map) {
    return Link(
      url: (map[urlKey] ?? '') as String,
      name: (map[nameKey] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Link.fromJson(String source) => Link.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Link(url: $url, name: $name)';

  @override
  bool operator ==(covariant Link other) {
    if (identical(this, other)) return true;
  
    return 
      other.url == url &&
      other.name == name;
  }

  @override
  int get hashCode => url.hashCode ^ name.hashCode;
}
