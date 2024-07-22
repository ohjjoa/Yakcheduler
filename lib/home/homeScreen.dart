import 'package:flutter/material.dart';
import 'package:yakcheduler/components/customeShapeWidget.dart';
import 'package:yakcheduler/map/naverMapScreen.dart';
import 'package:yakcheduler/receipt/cameraScreen.dart';

import '../dosage/dosageCertScreen.dart';

// StatefulWidget
// 정의: StatefulWidget은 상태를 가지는 위젯입니다. 위젯의 상태가 변경되면 UI가 업데이트됩니다.
// 용도: 동적인 UI 요소를 구현할 때 사용합니다. 사용자 입력, 애니메이션, 데이터 업데이트 등 상태에 따라 UI가 변하는 경우에 적합합니다.
// 구현: StatefulWidget을 상속받아 State를 구현합니다. State 클래스는 위젯의 상태를 관리하며, build 메서드를 통해 UI를 반환합니다. State 객체는 위젯의 생명주기 동안 유지됩니다.
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
          child: CustomShapeWidget(),
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
