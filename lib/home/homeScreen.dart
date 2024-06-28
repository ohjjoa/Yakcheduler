import 'package:flutter/material.dart';
import 'package:yakcheduler/map/naverMapScreen.dart';
import 'package:yakcheduler/receipt/cameraScreen.dart';

import '../dosage/dosageCertScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _submittedValue = '';

  Future<void> _openNaverMap() async {
    // 네이버 지도 화면을 열기 위한 Navigator 코드
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NaverMapScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: '제품명/제품코드/주성분코드/업체명을 입력하세요',
            ),
            onSubmitted: (String value) {
              setState(() {
                _submittedValue = value;
              });
              print('입력한 값: $_submittedValue');
              // 필요한 경우 다른 동작 수행
            },
          ),
        ),
        GestureDetector(
          onTap: _openNaverMap, // _openNaverMap 함수를 직접 호출
          child: Container(
            height: 100.0,
            color: Colors.blue,
            margin: EdgeInsets.only(top: 20.0),
            child: const Center(
              child: Text(
                '내 위치 약국 확인',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DosageCertScreen()),
            );
          },
          child: Container(
            height: 100.0,
            color: Colors.blue,
            margin: EdgeInsets.only(top: 20.0),
            child: const Center(
              child: Text(
                '나의 투약 기록 확인 하기',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraScreen()),
            );
          },
          child: Container(
            height: 100.0,
            color: Colors.blue,
            margin: EdgeInsets.only(top: 20.0),
            child: const Center(
              child: Text(
                '약국 영수증 저장',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
