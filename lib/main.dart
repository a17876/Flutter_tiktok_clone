import 'package:flutter/material.dart';
import 'constants/sizes.dart';
import 'features/inbox/activity_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData(
          splashColor: Colors.transparent,
          primaryColor: const Color(0xFFE9435A),
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: Color(0xFFE9435A)),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w600),
          )),
      home: const ActivityScreen(),
    );
  }
}
