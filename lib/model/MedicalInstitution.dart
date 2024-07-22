// 의료기관 정보 모델 클래스 정의
class MedicalInstitution {
  final String dutyAddr; // 주소
  final String dutyName; // 기관명
  final String dutyTel1; // 전화번호
  final String dutyTime1s; // 진료 시작 시간
  final String dutyTime1c; // 진료 종료 시간
  final String hpid; // 기관 ID
  final double wgs84Lat; // 위도
  final double wgs84Lon; // 경도

  MedicalInstitution({
    required this.dutyAddr,
    required this.dutyName,
    required this.dutyTel1,
    required this.dutyTime1s,
    required this.dutyTime1c,
    required this.hpid,
    required this.wgs84Lat,
    required this.wgs84Lon,
  });

  factory MedicalInstitution.fromJson(Map<String, dynamic> json) {
    return MedicalInstitution(
      dutyAddr: json['dutyAddr'] as String,
      dutyName: json['dutyName'] as String,
      dutyTel1: json['dutyTel1'] as String,
      dutyTime1s: json['dutyTime1s'] as String,
      dutyTime1c: json['dutyTime1c'] as String,
      hpid: json['hpid'] as String,
      wgs84Lat: double.parse(json['wgs84Lat'] as String),
      wgs84Lon: double.parse(json['wgs84Lon'] as String),
    );
  }
}