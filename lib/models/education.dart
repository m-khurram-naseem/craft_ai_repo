
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  static const degreeNameKey = 'degreeName' , instituteNameKey = 'institueName' , instituteAddressKey = 'instituteAddress' , startDateKey = 'degreeStartDate' , endDateKey = 'degreeEndDate';
  String degreeName;
  String instituteName;
  String instituteAddress;
  DateTime startDate;
  DateTime endDate;  
  Education({
    required this.degreeName,
    required this.instituteName,
    required this.instituteAddress,
    required this.startDate,
    required this.endDate,
  });

  Education copyWith({
    String? degreeName,
    String? instituteName,
    String? instituteLocation,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Education(
      degreeName: degreeName ?? this.degreeName,
      instituteName: instituteName ?? this.instituteName,
      instituteAddress: instituteLocation ?? this.instituteAddress,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
          degreeNameKey : degreeName,
          instituteNameKey : instituteName,
          instituteAddressKey : instituteAddress,
          startDateKey : Timestamp.fromDate(startDate),
          endDateKey : Timestamp.fromDate(endDate)
    };
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      degreeName: (map[degreeNameKey] ?? '') as String,
      instituteName: (map[instituteNameKey] ?? '') as String,
      instituteAddress: (map[instituteAddressKey] ?? '') as String,
      startDate: ((map[startDateKey] ?? Timestamp.now()) as Timestamp).toDate(),
      endDate: ((map[endDateKey] ?? Timestamp.now()) as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) => Education.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Education(degreeName: $degreeName, instituteName: $instituteName, instituteLocation: $instituteAddress, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant Education other) {
    if (identical(this, other)) return true;
  
    return 
      other.degreeName == degreeName &&
      other.instituteName == instituteName &&
      other.instituteAddress == instituteAddress &&
      other.startDate == startDate &&
      other.endDate == endDate;
  }

  @override
  int get hashCode {
    return degreeName.hashCode ^
      instituteName.hashCode ^
      instituteAddress.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
  }
}
