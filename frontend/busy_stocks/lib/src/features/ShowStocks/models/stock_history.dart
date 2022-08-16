// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class StockHistory {
  final List<double> data;

  StockHistory(
    this.data,
  );

  StockHistory copyWith({
    List<double>? data,
  }) {
    return StockHistory(
      data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory StockHistory.fromMap(Map<String, dynamic> map) {
    return StockHistory(List<double>.from(
      (map['data'] as List<double>),
    ));
  }

  String toJson() => json.encode(toMap());

  factory StockHistory.fromJson(String source) =>
      StockHistory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StockHistory(data: $data)';

  @override
  bool operator ==(covariant StockHistory other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
