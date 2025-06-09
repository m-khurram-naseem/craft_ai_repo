
import 'dart:convert';

class Language {
  static const nameKey = 'languageName';
  static const proficiencyKey = 'proficiency';
  String name;
  int proficiency;
  Language({
    required this.name,
    required this.proficiency,
  });

  Language copyWith({
    String? name,
    int? proficiency,
  }) {
    return Language(
      name: name ?? this.name,
      proficiency: proficiency ?? this.proficiency,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      nameKey : name,
      proficiencyKey : proficiency,
    };
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      name: (map[nameKey] ?? '') as String,
      proficiency: (map[proficiencyKey] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) => Language.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Language(name: $name, proficiency: $proficiency)';

  @override
  bool operator ==(covariant Language other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.proficiency == proficiency;
  }

  @override
  int get hashCode => name.hashCode ^ proficiency.hashCode;
}
