
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class WorkExperience {
  static const jobRoleKey = 'jobRole' , jobDescriptionKey = 'jobDescription' , companyNameKey = 'companyName' , companyAddressKey = 'companyAddress' , startDateKey = 'startDate' , endDateKey = 'endDate';
  String jobRole;
  String jobDescription;
  String companyName;
  String companyAddress;
  DateTime startDate;
  DateTime endDate; 
  WorkExperience({
    required this.jobRole,
    required this.jobDescription,
    required this.companyName,
    required this.companyAddress,
    required this.startDate,
    required this.endDate,
  });

  WorkExperience copyWith({
    String? jobRole,
    String? jobDescription,
    String? companyName,
    String? ccompanyAddress,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return WorkExperience(
      jobRole: jobRole ?? this.jobRole,
      jobDescription: jobDescription ?? this.jobDescription,
      companyName: companyName ?? this.companyName,
      companyAddress: ccompanyAddress ?? this.companyAddress,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      jobRoleKey : jobRole,
      jobDescriptionKey : jobDescription,
      companyNameKey : companyName,
      companyAddressKey : companyAddress,
      startDateKey : Timestamp.fromDate(startDate),
      endDateKey : Timestamp.fromDate(endDate),
    };
  }

  factory WorkExperience.fromMap(Map<String, dynamic> map) {
    return WorkExperience(
      jobRole: (map[jobRoleKey] ?? '') as String,
      jobDescription: (map[jobDescriptionKey] ?? '') as String,
      companyName: (map[companyNameKey] ?? '') as String,
      companyAddress: (map[companyAddressKey] ?? '') as String,
      startDate: ((map[startDateKey] ?? Timestamp.now()) as Timestamp).toDate(),
      endDate: ((map[endDateKey] ?? Timestamp.now()) as Timestamp).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkExperience.fromJson(String source) => WorkExperience.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorkExperience(jobRole: $jobRole, jobDescription: $jobDescription, companyName: $companyName, ccompanyAddress: $companyAddress, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(covariant WorkExperience other) {
    if (identical(this, other)) return true;
  
    return 
      other.jobRole == jobRole &&
      other.jobDescription == jobDescription &&
      other.companyName == companyName &&
      other.companyAddress == companyAddress &&
      other.startDate == startDate &&
      other.endDate == endDate;
  }

  @override
  int get hashCode {
    return jobRole.hashCode ^
      jobDescription.hashCode ^
      companyName.hashCode ^
      companyAddress.hashCode ^
      startDate.hashCode ^
      endDate.hashCode;
  }
}
