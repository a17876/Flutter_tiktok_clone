// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.onTap,
    required this.selectedIcon,
    required this.selectedIndex,
  }) : super(key: key);

  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 탭 동작을 감지하는 것을 expand하고 싶으니 gesturedetector위로 expanded를 넣어준다.
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: selectedIndex == 0
              ? Colors.black.withOpacity(0)
              : Colors.white.withOpacity(
                  0), // color를 없애면 expanded가 적용이 안됨. 버튼의 빨간색이 잘려서 withOpacity(0) 적용함
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(
              microseconds: 300,
            ),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, //column은 최대로 세로 공간을 차지하려고 하므로 size정해줘야 navigation bar가 아래로 간다.
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                  color: selectedIndex == 0 ? Colors.white : Colors.black,
                ),
                Gaps.v5,
                Text(
                  text,
                  style: TextStyle(
                    color: selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
