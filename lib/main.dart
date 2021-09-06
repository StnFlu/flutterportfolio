import 'package:flutter/material.dart';
import 'package:flutterportfolio/transitions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'LayOut.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(

    MaterialApp(
      title: 'Named Routes Demo',
      theme: ThemeData(          // Add the 3 lines from here...

        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const GameJams(),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static List<String> myList = [ 'GameJams', 'Uni Projects', 'About Me'];
  static List<Widget> myPages = [ GameJams(), GameJams(), AboutMe()];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 120,
        title: const Text('Daniel Monk', style: TextStyle(fontSize: 42), ),
      ),
      body:Center(
          child:Column(
              children: <Widget>[
                Image.asset(
                  "images/InsideUs.gif",
                  fit: BoxFit.fill,
                ),
                MyList(items: myList, pages: myPages,),
              ]
          )


      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  final _url = 'https://stnflu.itch.io/snowryde';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('About Me'),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Image.asset(
              "images/self.jpg",
              fit: BoxFit.fill,
            ),
            TitleWidget(title: 'Daniel Monk', subTitle:'Games Computing Graduate', rating: ' Unemployed', starCol: Colors.yellow, star: false,),
            Padding(padding: EdgeInsets.all(10)),
            Center(
              child:Column(
                  children: <Widget>[
                    Text('Hello! My name is Daniel and I am passionate for all aspects of games. I also regularly enjoy participating in game jams.', style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('I am a Games Computing graduate from the University of Lincoln receiving a 2:1, and have experience in Scripting , Game Design, Level Design, 2D Art and 3D Modelling.', style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                    Padding(padding: EdgeInsets.all(5)),
                    Text("Here are some languages and software packages I'm proficient with:", style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8.0, // gap between adjacent chips
                        runSpacing: 4.0, // gap between lines
                        children: <Widget>[
                          Chip(
                            label: const Text('C#'),
                          ),
                          Chip(
                            label: const Text('C++'),
                          ),
                          Chip(
                            label: const Text('Unity'),
                          ),
                          Chip(
                            label: const Text('Python'),
                          ),
                          Chip(
                            label: const Text('Blender'),
                          ),
                          Chip(
                            label: const Text('Github'),
                          ),
                          Chip(
                            label: const Text('Unreal Engine'),
                          )

                        ],
                      ),

                    ),
                  ]
              ),
            ),




            Padding(padding: EdgeInsets.all(10)),
            Center(child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary:  Colors.red,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(15)
              ),
              onPressed: _launchURL,
              child: const Text('Play Here', style: TextStyle(fontSize: 24),),
            ),),

          ],
        ),
      ),
    );

  }


}

class GameJams extends StatelessWidget {
  const GameJams({Key? key}) : super(key: key);
  static List<String> myList = [ 'SnowRyde', 'InsideUs', 'RepairTheToy'];
  static List<Widget> myPages = [ SnowRyde(), InsideUs(), RepairTheToy()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GameJam Games'),
      ),
      body:Center(
          child: MyList(items: myList, pages: myPages,)
      ),
    );
  }
}


class SnowRyde extends StatelessWidget {
  const SnowRyde({Key? key}) : super(key: key);

  final _url = 'https://stnflu.itch.io/snowryde';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Image.asset(
              "images/SnowRyde.gif",
              fit: BoxFit.fill,
            ),
            TitleWidget(title: 'SnowRyde', subTitle:'32nd GDL Game Jam', rating: ' 1st', starCol: Colors.yellow,),

            Center(child:Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Text('SnowRyde is a casual game of patience, The player must traverse the environment by. This game was created as part of the 32nd GDL Game Jam (July 2021, a 72 hour game jam with the theme of "Size does matter... Make a game where size really does matter!" and recieving 1st Place across all categories(fun, theme, polish and creativity).',
                  style: TextStyle(fontSize: 16),textAlign: TextAlign.center,))),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Chip(
                    label: const Text('C#'),
                  ),
                  Chip(
                    label: const Text('Unity'),
                  ),
                  Chip(
                    label: const Text('2D Art'),
                  ),
                  Chip(
                    label: const Text('Level Design'),
                  ),
                  Chip(
                    label: const Text('Game Design'),
                  ),
                  Chip(
                    label: const Text('Github'),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Center(child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary:  Colors.red,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(15)
              ),
              onPressed: _launchURL,
              child: const Text('Play Here', style: TextStyle(fontSize: 24),),
            ),),

          ],
        ),
      ),
    );

  }


}
class InsideUs extends StatelessWidget {
  const InsideUs({Key? key}) : super(key: key);

  final _url = 'https://stnflu.itch.io/Inside-Us';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Image.asset(
              "images/InsideUs.gif",
              fit: BoxFit.fill,
            ),
            TitleWidget(title: 'InsideUs', subTitle:'UoL CSS Summer Jam 2021', rating: ' 1st', starCol: Colors.yellow,),

            Center(child:Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Text('Inside Us is a time sensitive 2D survival game where you play as a the lone white blood cell, the player has to defeat the infection whilst the infection simultaneously kills the body. This game was created as part of the Univerty of Lincoln'
                    's 2021 Summer Game Jam. C# Receiving 1st Place from community votes. Inside Us was created over a 48 hour time span with the given theme of "Healing", in the Unity game engine using fully original assets.',
                  style: TextStyle(fontSize: 16),textAlign: TextAlign.center,))),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[

                  Chip(
                    label: const Text('C#'),
                  ),
                  Chip(
                    label: const Text('Unity'),
                  ),
                  Chip(
                    label: const Text('2D Art'),
                  ),
                  Chip(
                    label: const Text('Level Design'),
                  ),
                  Chip(
                    label: const Text('Game Design'),
                  ),
                  Chip(
                    label: const Text('Github'),
                  )
                ],
              ),

            ),
            Padding(padding: EdgeInsets.all(10)),
            Center(child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary:  Colors.red,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(15)
              ),
              onPressed: _launchURL,
              child: const Text('Play Here', style: TextStyle(fontSize: 24),),
            ),),

          ],
        ),
      ),
    );

  }


}
class RepairTheToy extends StatelessWidget {
  const RepairTheToy({Key? key}) : super(key: key);

  final _url = 'https://stnflu.itch.io/Inside-Us';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Image.asset(
              "images/RepTheToy.gif",
              fit: BoxFit.fill,
            ),
            TitleWidget(title: 'RepairTheToy', subTitle:'UoL Global Game Jam', rating: ' 1st', starCol: Colors.yellow, star: false,),

            Center(child:Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Text('Inside Us is a time sensitive 2D survival game where you play as a the lone white blood cell, the player has to defeat the infection whilst the infection simultaneously kills the body. This game was created as part of the Univerty of Lincoln'
                    's 2021 Summer Game Jam. C# Receiving 1st Place from community votes. Inside Us was created over a 48 hour time span with the given theme of "Healing", in the Unity game engine using fully original assets.',
                  style: TextStyle(fontSize: 16),textAlign: TextAlign.center,))),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[

                  Chip(
                    label: const Text('C#'),
                  ),
                  Chip(
                    label: const Text('Unity'),
                  ),
                  Chip(
                    label: const Text('2D Art'),
                  ),
                  Chip(
                    label: const Text('Level Design'),
                  ),
                  Chip(
                    label: const Text('Game Design'),
                  ),
                  Chip(
                    label: const Text('Github'),
                  )
                ],
              ),

            ),
            Padding(padding: EdgeInsets.all(10)),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:  Colors.red,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(15),
                ),
                onPressed: _launchURL,
                child: const Text('Play Here', style: TextStyle(fontSize: 24),),

              ),
            ),

          ],
        ),
      ),
    );

  }


}
BoxDecoration myBoxDecoration() {
  return BoxDecoration(

    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
      ////               <--- border radius here
    ),
    color: Colors.blueAccent,
  );
}



