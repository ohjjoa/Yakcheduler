import 'package:flutter/material.dart';
import 'components/drugsSearchInput.dart';

class DrugsSearchScreen extends StatefulWidget {
  @override
  _DrugsSearchScreenState createState() => _DrugsSearchScreenState();
}

class _DrugsSearchScreenState extends State<DrugsSearchScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // 화면이 빌드된 후 키보드를 열기 위해 포커스를 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: DrugsSearchInput(focusNode: _focusNode), // 사용
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: DrugsSearchScreen(),
  ));
}
