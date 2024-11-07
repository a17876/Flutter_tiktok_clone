import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/features/discover/discover_screen.dart';
import 'package:flutter_tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:flutter_tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 1;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Record video'),
          ),
        ),
        fullscreenDialog: true, // 그냥 위젯이기 때문에 전체 화면으로
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body:
          // screens.elementAt(_selectedIndex), // 현재 선택된 화면만 보여줌 이전의 상태는 지우고 초기화시킴 하나씩만 렌더링하기 때문에
          Stack(
        children: [
          // build 되지만 보이지만 않게 Offstage사용. fetch 다시 안하게
          Offstage(
            offstage: _selectedIndex != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const DiscoverScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.size12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavTab(
                icon: FontAwesomeIcons.house,
                selectedIcon: FontAwesomeIcons.houseChimney,
                isSelected: _selectedIndex == 0,
                selectedIndex: _selectedIndex,
                text: 'Home',
                onTap: () => _onTap(0),
              ),
              NavTab(
                icon: FontAwesomeIcons.compass,
                selectedIcon: FontAwesomeIcons.solidCompass,
                isSelected: _selectedIndex == 1,
                selectedIndex: _selectedIndex,
                text: 'Discover',
                onTap: () => _onTap(1),
              ),
              Gaps.h24,
              GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(inverted: _selectedIndex != 0),
              ),
              NavTab(
                icon: FontAwesomeIcons.message,
                selectedIcon: FontAwesomeIcons.solidMessage,
                isSelected: _selectedIndex == 3,
                selectedIndex: _selectedIndex,
                text: 'Inbox',
                onTap: () => _onTap(3),
              ),
              NavTab(
                icon: FontAwesomeIcons.user,
                selectedIcon: FontAwesomeIcons.solidUser,
                isSelected: _selectedIndex == 4,
                selectedIndex: _selectedIndex,
                text: 'Profile',
                onTap: () => _onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
