import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/gaps.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial Text");

  void _onSearchChanged(String value) {
    print(value);
  }

  void _onSearchSubmitted(String value) {}

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          centerTitle: true,
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory, //선택한 탭 반짝
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            isScrollable: true,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                )
            ],
          ),
        ),
        body: TabBarView(children: [
          GridView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(Sizes.size6),
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 9 / 20,
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.size10,
              mainAxisSpacing: Sizes.size10,
            ),
            itemBuilder: (context, index) => Column(children: [
              AspectRatio(
                aspectRatio: 9 / 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: "assets/images/cute1.jpg",
                    image:
                        "https://media.wired.com/photos/593261cab8eb31692072f129/master/w_1280,c_limit/85120553.jpg",
                  ),
                ),
              ),
              Gaps.v10,
              const Text(
                'this is a very long caption for tiktok i am uploading just now currently. hahahah!',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: Sizes.size14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v8,
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w600,
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 12,
                      backgroundImage: NetworkImage(
                          "https://hips.hearstapps.com/hmg-prod/images/baby-animals-koala-65f8b019c09b3.jpg?crop=0.6654099905749293xw:1xh;center,top&resize=980:*"),
                    ),
                    Gaps.h4,
                    const Expanded(
                      child: Text(
                        "Loah_my_avata.._hoolay..woohaha",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Gaps.h4,
                    FaIcon(
                      FontAwesomeIcons.heart,
                      size: Sizes.size16,
                      color: Colors.grey.shade600,
                    ),
                    Gaps.h2,
                    const Text(
                      "2.5M",
                    ),
                  ],
                ),
              ),
            ]),
          ),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(
                tab,
                style: const TextStyle(
                  fontSize: Sizes.size28,
                ),
              ),
            )
        ]),
      ),
    );
  }
}
