// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Skill {
  static const nameKey = 'skillName';
  String name;
  Skill({
    required this.name,
  });

  Skill copyWith({
    String? name,
  }) {
    return Skill(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      nameKey : name,
    };
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      name: (map[nameKey] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(String source) => Skill.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Skill(name: $name)';

  @override
  bool operator ==(covariant Skill other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
