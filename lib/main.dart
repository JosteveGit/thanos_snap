import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:extended_transitions/coupled_transition/coupled_transition_controller.dart';
import 'package:flutter/material.dart';
import 'package:thanos_snap/thanos_snap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var titles = [
    "Thanos Rising",
    "The Thanos Quest",
    "Thanos simonattoi",
    "Thanos(name)",
    "The Thanos Imperative",
    "Titan",
    "Damion Poitier"
  ];

  CoupledTransitionController controller1;
  CoupledTransitionController controller2;

  final audioPlayer = AssetsAudioPlayer();

  bool start = false;
  var text = "Tap To Snap";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ThanosSnap(
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "https://en.wikipedia.org/wiki/Thanos",
                              overflow: TextOverflow.clip,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          child: Text(
                            "Thanos - Wikipedia",
                            style: TextStyle(
                                fontSize: 20, color: Colors.blue[900]),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Thanos is a fictional supervillain appearing in American comic books published by Marvel Comics. The character was created by writer-artist Jim Starlin, and made his first appearance in The Invincible Iron Man #55 (cover dated February 1973).",
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Created by: ",
                                          children: [
                                            TextSpan(
                                                text: "Jim Starlin",
                                                style: TextStyle(
                                                    color: Colors.blue[900]))
                                          ],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    alignment: Alignment.centerLeft,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                    child: Text(
                                      "Team affiliations: Infinity Watch; Black Order",
                                      style: TextStyle(fontSize: 15),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    alignment: Alignment.centerLeft,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 130,
                              child: ClipRRect(
                                child: Image.asset(
                                  "images/thanos.png",
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(titles.length, (index) {
                              return Row(
                                children: <Widget>[
                                  OutlineButton(
                                    child: Text(
                                      titles[index],
                                      style: TextStyle(color: Colors.blue[900]),
                                    ),
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                controllerReturnerForFirst: (controller) {
                  this.controller1 = controller;
                },
                controllerReturnerForSecond: (controller) {
                  this.controller2 = controller;
                },
              ),
              RaisedButton(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (!start) {
                    controller1.startAll();
                    controller2.startAll();
                    setState(() {
                      text = "Tap to Restore";
                    });
                    audioPlayer.open("audios/disappear.mp3");
                  } else {
                    audioPlayer.stop();
                    controller1.getFadeTransitionAnimationController().reset();
                    controller1.getSlideTransitionAnimationController().reset();
                    controller2.getFadeTransitionAnimationController().reset();
                    controller2.getSlideTransitionAnimationController().reset();
                    setState(() {
                      text = "Tap To Snap";
                    });
                  }
                  setState(() {
                    start = !start;
                  });
                },
                color: Colors.blue[900],
              )
            ],
          ),
        ),
      ),
    );
  }
}
