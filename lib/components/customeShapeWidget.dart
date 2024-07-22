import 'package:flutter/material.dart';
import 'package:yakcheduler/drugsSearch/drugsSearchScreen.dart';

class CustomShapeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 클릭 시 실행할 코드
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DrugsSearchScreen()),
        );
      },
      child: Container(
        height: 60, // 높이를 100으로 설정
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // 공간을 균등하게 분배
          crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0), // 좌우 여백 설정
              child: Text(
                '제품명/제품코드/주성분코드/업체명을 입력하세요', // 텍스트 내용
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 16.0), // 오른쪽 여백 설정
              child: Icon(
                Icons.search,
                color: Colors.white, // 아이콘 색상
                size: 24, // 아이콘 크기
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Custom Shape Widget'),
      ),
      body: Center(
        child: CustomShapeWidget(),
      ),
    ),
  ));
}
