import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // 로그인 프로세스 시뮬레이션
      bool loginSuccess = _email == 'test@example.com' && _password == 'password123';

      if (loginSuccess) {
        context.go('/news_screen'); // News_Screen.dart로 이동
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('로그인에 실패했습니다.'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFC9D6FF), Color(0xFFE2E2E2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '대림대학교',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '3학년 2학기 중간고사',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 32),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '이메일',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '이메일을 입력해주세요.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true, // 비밀번호 숨김
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '비밀번호를 입력해주세요.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value;
                    },
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('로그인'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
