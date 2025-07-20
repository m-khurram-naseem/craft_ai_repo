import 'dart:convert';

class Language {
  static const nameKey = 'languageName';
  static const proficiencyKey = 'proficiency';
  String name;
  int fluency;
  Language({required this.name, required this.fluency});

  Language copyWith({String? name, int? proficiency}) {
    return Language(name: name ?? this.name, fluency: proficiency ?? fluency);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{nameKey: name, proficiencyKey: fluency};
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      name: (map[nameKey] ?? '') as String,
      fluency: (map[proficiencyKey] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) =>
      Language.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Language(name: $name, proficiency: $fluency)';

  @override
  bool operator ==(covariant Language other) {
    if (identical(this, other)) return true;

    return other.name == name && other.fluency == fluency;
  }

  @override
  int get hashCode => name.hashCode ^ fluency.hashCode;
}
