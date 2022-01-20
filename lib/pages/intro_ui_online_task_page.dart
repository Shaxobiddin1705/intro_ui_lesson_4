import 'package:flutter/material.dart';
import 'package:intro_ui_lesson_4/services/string_utils.dart';

class IntroUIOnlineTaskPage extends StatefulWidget {
  const IntroUIOnlineTaskPage({Key? key}) : super(key: key);
  static const String id = "intro_ui_online_task_page";

  @override
  _IntroUIOnlineTaskPageState createState() => _IntroUIOnlineTaskPageState();
}

class _IntroUIOnlineTaskPageState extends State<IntroUIOnlineTaskPage> {
  PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index){
              setState(() {
                currentPage = index;
              });
            },
            children: [
              makePage(image: "assets/images/image_1.png", title: Strings.stepOneTitle, content: Strings.stepOneContent),
              makePage(image: "assets/images/image_2.png", title: Strings.stepTwoTitle, content: Strings.stepTwoContent),
              makePage(image: "assets/images/image_3.png", title: Strings.stepThreeTitle, content: Strings.stepThreeContent),
            ],
          ),
          currentPage!=2 ? Container(
            padding: const EdgeInsets.only(bottom: 45),
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: Text("Skip", style: TextStyle(color: Colors.red.shade400, fontSize: 16),),
              onPressed: (){
                setState(() {
                  currentPage = 2;
                });
                _pageController.animateToPage(currentPage,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeOutCubic);
              },
            ),
          ) : Container(
            padding: const EdgeInsets.only(bottom: 45),
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: Text("Next", style: TextStyle(color: Colors.red.shade400, fontSize: 16),),
              onPressed: (){
                setState(() {
                  currentPage = 2;
                });
              },
            ),
          ),
          indicator(),
        ],
      ),
    );
  }

  Widget _itemOfIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      margin: const EdgeInsets.only(right: 5),
      height: 7,
      width: currentPage == index ? 30 : 7,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget indicator() {
    return Container(
      padding: const EdgeInsets.only(bottom: 45),
      alignment: Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _itemOfIndicator(0),
          _itemOfIndicator(1),
          _itemOfIndicator(2),
        ],
      ),
    );
  }

  Widget makePage({required image, required title, required content}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.red, fontSize: 30),),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Text(content, style: const TextStyle(color: Colors.grey, fontSize: 17),textAlign: TextAlign.center,)
                    ),
                  ],
                ),
              )
          ),
          // SizedBox(height: 50,),
          Expanded(
            flex: 3,
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20),
                child: Image(
                  image: AssetImage(image),
                  height: 250,
                  width: 250,
                ),
              ),
          ),
        ],
      ),
    );
  }

}
