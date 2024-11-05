import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/gaps.dart';
import 'package:flutter_tiktok_clone/features/authentication/sign_up/password_screen.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/form_button.dart';
import '../../../constants/sizes.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  // 메모리 save위해 dispose
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // 입력된 값이 email 형식인지
  String? _isEmailValid() {
    if (_email.isEmpty) {
      return null;
    }
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email Not valid";
    }
    return null;
  }

  // 유저가 다른 곳을 tap하면 keyboard가 사라지게
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  // Next를 누르거나 키보드의 done을 눌렀을 때 실행되는 함수
  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Sign up",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v40,
                const Text(
                  "What is your email?",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v32,
                TextField(
                  controller: _emailController,
                  onEditingComplete: _onSubmit,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    hintText: "Email",
                    errorText: _isEmailValid(),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
                Gaps.v32,
                GestureDetector(
                    onTap: _onSubmit,
                    child: FormButton(
                        disabled: _email.isEmpty || _isEmailValid() != null))
              ],
            ),
          )),
    );
  }
}
