// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tool {
  static const nameKey = 'toolName';
  String name;
  Tool({
    required this.name,
  });

  Tool copyWith({
    String? name,
  }) {
    return Tool(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      nameKey : name,
    };
  }

  factory Tool.fromMap(Map<String, dynamic> map) {
    return Tool(
      name: (map[nameKey] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tool.fromJson(String source) => Tool.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Tool(name: $name)';

  @override
  bool operator ==(covariant Tool other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
