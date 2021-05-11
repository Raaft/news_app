import 'package:flutter/material.dart';
import 'package:news_app/models/page_model.dart';
import 'package:news_app/screens/home_Screen.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color i;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<PageModel> pages = List<PageModel>();

  void _addPages() {
    pages.add(PageModel(
        'Welcome', 'welcome to my first news app', Icons.local_play_outlined));
    pages
        .add(PageModel('Alarm', 'welcome to my first news alarm', Icons.alarm));
    pages.add(PageModel('Map', 'welcome to my first map ', Icons.map));
  }

  final controller = PageController(viewportFraction: 0.8);
  int myIndex = 0;

  @override
  void initState() {
    super.initState();
    _addPages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
        //  width: double.infinity,
        child: Stack(
          children: [
            Container(
              //      width: double.infinity,
              child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.translate(
                                child: Icon(pages[index].icon,
                                    color: Colors.white, size: 150),
                                offset: Offset(0, -100),
                              ),
                              Text(
                                pages[index].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 15),
                              Text(
                                pages[index].description,
                                style: TextStyle(
                                    color: Colors.red.shade800, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                  child: Transform.translate(
                      offset: Offset(0, 150),
                      child: ScrollingPageIndicator(
                          dotColor: Colors.grey,
                          dotSelectedColor: Colors.red.shade900,
                          dotSize: 6,
                          dotSelectedSize: 8,
                          dotSpacing: 12,
                          controller: controller,
                          itemCount: pages.length,
                          orientation: Axis.horizontal))),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      updateScreen();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    child: Text(' GET START '),
                    color: Colors.red.shade900,
                    textColor: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateScreen() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   preferences.setBool('seen',true);
  }
}
