import 'package:flutter/material.dart';

class DrugsSearchInput extends StatefulWidget {
  final FocusNode focusNode;

  const DrugsSearchInput({Key? key, required this.focusNode}) : super(key: key);

  @override
  _DrugsSearchInputState createState() => _DrugsSearchInputState();
}

class _DrugsSearchInputState extends State<DrugsSearchInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TextEditingController에 리스너를 추가하여 텍스트가 변경될 때 상태를 업데이트
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // 사용 후 TextEditingController를 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: _controller,
        focusNode: widget.focusNode,
        decoration: InputDecoration(
          hintText: '제품명/제품코드/주성분코드/업체명을 입력하세요.',
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear(); // 텍스트 필드를 지움
            },
          )
              : null,
        ),
        onSubmitted: ,
      ),
    );
  }
}
