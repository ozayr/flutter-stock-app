import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class StockData {
  final double currentPrice;
  final double percentageChange;
  final double priceChange;
  final bool gain;
  final String companyName;
  final String symbol;
  final String logoUrl;
  StockData(
    this.currentPrice,
    this.percentageChange,
    this.priceChange,
    this.gain,
    this.companyName,
    this.symbol,
    this.logoUrl,
  );

  @override
  String toString() {
    return 'StockData(currentPrice: $currentPrice, percentageChange: $percentageChange, priceChange: $priceChange, gain: $gain, companyName: $companyName, symbol: $symbol, logoUrl: $logoUrl)';
  }

  StockData copyWith({
    double? currentPrice,
    double? percentageChange,
    double? priceChange,
    bool? gain,
    String? companyName,
    String? symbol,
    String? logoUrl,
  }) {
    return StockData(
      currentPrice ?? this.currentPrice,
      percentageChange ?? this.percentageChange,
      priceChange ?? this.priceChange,
      gain ?? this.gain,
      companyName ?? this.companyName,
      symbol ?? this.symbol,
      logoUrl ?? this.logoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentPrice': currentPrice,
      'percentageChange': percentageChange,
      'priceChange': priceChange,
      'gain': gain,
      'companyName': companyName,
      'symbol': symbol,
      'logoUrl': logoUrl,
    };
  }

  factory StockData.fromMap(Map<String, dynamic> map) {
    return StockData(
      map['currentPrice'] as double,
      map['percentageChange'] as double,
      map['priceChange'] as double,
      map['gain'] as bool,
      map['companyName'] as String,
      map['symbol'] as String,
      map['logoUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockData.fromJson(String source) => StockData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant StockData other) {
    if (identical(this, other)) return true;
  
    return 
      other.currentPrice == currentPrice &&
      other.percentageChange == percentageChange &&
      other.priceChange == priceChange &&
      other.gain == gain &&
      other.companyName == companyName &&
      other.symbol == symbol &&
      other.logoUrl == logoUrl;
  }

  @override
  int get hashCode {
    return currentPrice.hashCode ^
      percentageChange.hashCode ^
      priceChange.hashCode ^
      gain.hashCode ^
      companyName.hashCode ^
      symbol.hashCode ^
      logoUrl.hashCode;
  }
}
