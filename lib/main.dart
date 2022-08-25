import 'package:flutter/material.dart';

import 'story_teller.dart';

void main() => runApp(const Distini());

class Distini extends StatelessWidget {
  const Distini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

StoryTeller storyTeller = StoryTeller();

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        primary: Colors.black54,
        minimumSize: Size(100, 50));
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
            image: AssetImage("assets/images/distini-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  storyTeller.getStoryText(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  style: style,
                  onPressed: () {
                    setState(() {});
                    storyTeller.nextStory(1);
                  },
                  child: Text(
                    storyTeller.getStoryChoice1(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 5.0,
            ),
            Expanded(
              child: Center(
                child: Visibility(
                  visible: storyTeller.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      setState(() {
                        storyTeller.nextStory(2);
                      });
                    },
                    child: Text(
                      storyTeller.getStoryChoice2(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
