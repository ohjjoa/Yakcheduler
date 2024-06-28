import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import '../model/MedicalInstitution.dart';

class NaverMapScreen extends StatefulWidget {
  const NaverMapScreen({Key? key}) : super(key: key);

  @override
  _NaverMapScreenState createState() => _NaverMapScreenState();
}

class _NaverMapScreenState extends State<NaverMapScreen> {
  late NaverMapController _controller;

  @override
  void initState() {
    super.initState();
    // _loadPharmaciesFromAPI(); // API를 통해 약국 위치 데이터 로드
    fetchMedicalInstitutions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/ic_left_back_arrow.svg'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          '네이버 지도',
          style: TextStyle(fontSize: 18.0),
        ),
        centerTitle: false,
      ),
      body: NaverMap(
        options: const NaverMapViewOptions(
          initialCameraPosition: NCameraPosition(
            target: NLatLng(37.545539, 127.142906),
            zoom: 16,
            bearing: 0,
            tilt: 0,
          ),
        ),
        onMapReady: (controller) {
          _controller = controller;
          final marker = NMarker(id: "test", position: NLatLng(37.545539, 127.142906));
          controller.addOverlay(marker);

          final onMarkerInfoWindow =
          NInfoWindow.onMarker(id: marker.info.id, text: "굽은다리역");
          marker.openInfoWindow(onMarkerInfoWindow);
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // 줌 인: 현재 줌 레벨에서 1 증가
              _zoomIn();
            },
            tooltip: 'Zoom In',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: () {
              // 줌 아웃: 현재 줌 레벨에서 1 감소
              _zoomOut();
            },
            tooltip: 'Zoom Out',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  void _zoomIn() async {
    final zoomIn = NCameraUpdate.zoomIn();
    await _controller.updateCamera(zoomIn);
  }

  void _zoomOut() async {
    final zoomOut = NCameraUpdate.zoomOut();
    await _controller.updateCamera(zoomOut);
  }

  // Future<void> _loadPharmaciesFromAPI() async {
  //   final apiKey = 'YOUR_API_KEY'; // 공공 데이터 API 키
  //   final apiUrl =
  //       'https://api.example.com/pharmacies?apikey=$apiKey'; // 실제 API 엔드포인트
  //
  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = jsonDecode(response.body);
  //       setState(() {
  //         _markers = data.map((item) {
  //           return NMarker(
  //             markerId: item['id'].toString(),
  //             position: NLatLng(item['lat'], item['lng']),
  //             iconImage: BitmapDescriptor.defaultMarker,
  //           );
  //         }).toList();
  //       });
  //     } else {
  //       throw Exception('Failed to load pharmacies');
  //     }
  //   } catch (e) {
  //     print('Error loading pharmacies: $e');
  //   }
  // }


  Future<List<MedicalInstitution>> fetchMedicalInstitutions() async {
    final apiUrl = Uri.parse(
        'http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire?serviceKey=서비스키&Q0=서울특별시&pageNo=1&numOfRows=10');
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final items = jsonResponse['items'] as List<dynamic>;
      return items.map((item) => MedicalInstitution.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load medical institutions');
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: NaverMapScreen(),
  ));
}
