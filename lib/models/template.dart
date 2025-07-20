// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Template {
  static const htmlKey = 'html' , imageUrlKey = 'image' , typeKey = 'type';
  String html;
  String imageUrl;
  int type;  
  Template({
    required this.html,
    required this.imageUrl,
    required this.type,
    
  });
  

  Template copyWith({
    String? html,
    String? imageUrl,
    int? type,
  }) {
    return Template(
      html: html ?? this.html,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      htmlKey: html,
      imageUrlKey: imageUrl,
      typeKey: type,
    };
  }

  factory Template.fromMap(Map<String, dynamic> map) {
    return Template(
      html: map[htmlKey] as String,
      imageUrl: map[imageUrlKey] as String,
      type: map[typeKey] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Template.fromJson(String source) => Template.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Template(html: $html, imageUrl: $imageUrl, type: $type)';

  @override
  bool operator ==(covariant Template other) {
    if (identical(this, other)) return true;
  
    return 
      other.html == html &&
      other.imageUrl == imageUrl &&
      other.type == type;
  }

  @override
  int get hashCode => html.hashCode ^ imageUrl.hashCode ^ type.hashCode;
}
