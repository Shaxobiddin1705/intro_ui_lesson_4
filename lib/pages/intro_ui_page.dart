import 'package:flutter/material.dart';
import 'package:intro_ui_lesson_4/pages/home_page.dart';
import 'package:intro_ui_lesson_4/pages/intro_ui_online_task_page.dart';
import 'package:intro_ui_lesson_4/services/string_utils.dart';

class IntroUIPage extends StatefulWidget {
  const IntroUIPage({Key? key}) : super(key: key);
  static const String id = "intro_ui_page";

  @override
  _IntroUIPageState createState() => _IntroUIPageState();
}

class _IntroUIPageState extends State<IntroUIPage> {
  PageController _controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          (_selectedIndex != 2)
              ? TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    _controller.animateToPage(_selectedIndex,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeOutCubic);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ))
              : TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(IntroUIOnlineTaskPage.id);
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  )),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              _makePage(
                  image: "assets/images/img_0.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              _makePage(
                  image: "assets/images/img_1.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              _makePage(
                  image: "assets/images/img_2.png",
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent),
            ],
          ),

          //#indicators
          _indicators(),
        ],
      ),
    );
  }

  Widget _makePage({required String image, required title, required content}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          //#image
          Expanded(
            flex: 3,

            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage(image),
                height: 250,
                width: 250,
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          //#titel #content
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 58),
                  child: Text(
                    content,
                    style: const TextStyle(color: Colors.grey, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _elementOfIndicator(int index) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 6),
      width: (index == _selectedIndex) ? 30 : 6,
      height: 6,
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.green,),
    );
  }

  Widget _indicators() {
    return Container(
      padding: const EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _elementOfIndicator(0),
          _elementOfIndicator(1),
          _elementOfIndicator(2),
        ],
      ),
    );
  }

}
