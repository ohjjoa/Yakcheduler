class Pharmacy {
  final String sido; // 주소(시도)
  final String sigungu; // 주소(시군구)
  final int qt; // 월~일요일, 공휴일: 1~8
  final String qn; // 기관명
  final String ord; // 순서
  final int pageNo; // 페이지 번호
  final int numOfRows; // 목록 건수

  Pharmacy({
    required this.sido,
    required this.sigungu,
    required this.qt,
    required this.qn,
    required this.ord,
    required this.pageNo,
    required this.numOfRows,
  });

  factory Pharmacy.fromJson(Map<String, dynamic> json) {
    return Pharmacy(
      sido: json['Q0'] as String,
      sigungu: json['Q1'] as String,
      qt: json['QT'] as int,
      qn: json['QN'] as String,
      ord: json['ORD'] as String,
      pageNo: json['pageNo'] as int,
      numOfRows: json['numOfRows'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Q0': sido,
      'Q1': sigungu,
      'QT': qt,
      'QN': qn,
      'ORD': ord,
      'pageNo': pageNo,
      'numOfRows': numOfRows,
    };
  }
}
