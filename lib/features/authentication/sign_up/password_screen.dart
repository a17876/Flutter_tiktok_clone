import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/gaps.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/sizes.dart';
import 'birthday_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = false;
  bool _passwordLengthValid = false;
  bool _passwordRegValid = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
        _validatePassword();
      });
    });
  }

  // 메모리 save위해 dispose
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  // password가 8-20글자, 글자, 숫자, 특수기호 들어갔는지
  void _validatePassword() {
    final regExp = RegExp(
        r"^(?=.{8,20}$)(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[.!#$%@&'*+-/=?^_`{|}~]).*");
    _passwordLengthValid = _password.length >= 8 && _password.length <= 20;
    _passwordRegValid = regExp.hasMatch(_password);
  }

  // 유저가 다른 곳을 tap하면 keyboard가 사라지게
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  // Next를 누르거나 키보드의 done을 눌렀을 때 실행되는 함수
  void _onSubmit() {
    if (_password.isEmpty || !_passwordLengthValid || !_passwordRegValid) {
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText; // 비밀번호 보이기 상태 토글
    });
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
                  "Create password",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v32,
                TextField(
                  controller: _passwordController,
                  onEditingComplete: _onSubmit,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  cursorColor: Theme.of(context).primaryColor,
                  obscureText: !_obscureText,
                  decoration: InputDecoration(
                    hintText: "Make your password strong!",
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h14,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.solidEyeSlash
                                : FontAwesomeIcons.solidEye,
                            color: Colors.grey.shade500,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
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
                Gaps.v10,
                const Text(
                  "Your password must have:",
                  style: TextStyle(
                    fontSize: Sizes.size12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: _passwordLengthValid
                          ? Colors.green
                          : Colors.grey.shade400,
                    ),
                    const Text(
                      " 8 to 20 characters",
                      style: TextStyle(
                        fontSize: Sizes.size12,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: _passwordRegValid
                          ? Colors.green
                          : Colors.grey.shade400,
                    ),
                    const Text(
                      " Letters, numbers, and special characters",
                      style: TextStyle(
                        fontSize: Sizes.size12,
                      ),
                    ),
                  ],
                ),
                Gaps.v32,
                GestureDetector(
                    onTap: _onSubmit,
                    child: FormButton(
                        disabled: _password.isEmpty ||
                            !_passwordLengthValid ||
                            !_passwordRegValid))
              ],
            ),
          )),
    );
  }
}
