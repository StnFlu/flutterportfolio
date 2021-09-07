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
  static List<Widget> myPages = [ GameJams(), UniProjects(), AboutMe()];
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
                  "images/background.png",
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

  final _url = 'https://danielmonk.me';
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
                    IconButton(
                      icon: const Icon(Icons.account_circle),
                      color: Colors.white,
                      onPressed: _launchURL,
                    ),

                  ]
              ),
            ),




            Padding(padding: EdgeInsets.all(10)),


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

class UniProjects extends StatelessWidget {
  const UniProjects({Key? key}) : super(key: key);
  static List<String> myList = [ 'Elysium Putts', 'TSE', ];
  static List<Widget> myPages = [ ElysiumPutts(), TSE(), ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Projects'),
      ),
      body:Center(
          child: MyList(items: myList, pages: myPages,)
      ),
    );
  }
}


class TSE extends StatelessWidget {
  const TSE({Key? key}) : super(key: key);

  final _url = 'https://youtu.be/QQ96KEBDI6g';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Image.asset(
              "images/TSE.gif",
              fit: BoxFit.fill,
            ),
            TitleWidget(title: 'TSE', subTitle:'Team Software Engineering', rating: ' 70/100', starCol: Colors.yellow,),

            Center(child:Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Text('For a TSE project I was the lead developer in charge of creating the artifact. The aim was to create a simulation of micro organisms on a petri dish. As this was a group project I learn a lot about what to and what not to do when working with others'
                    '. \n\n Although we still received a high grade a better grade could have been achieved with more streamlined communication between the teams, as well as correct utilisation'
                    ' of software such as github, and actually sticking to a development methodology.'
                    '\n\nWithin the project I was responsible for coding the logic, designing the UI and 3D Modelling ',

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
                    label: const Text('3D Art'),
                  ),
                  Chip(
                    label: const Text('Unity'),
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
                  Chip(
                    label: const Text('Serious Games'),
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
              child: const Text('Watch Here', style: TextStyle(fontSize: 24),),
            ),),
            Padding(padding: EdgeInsets.all(10)),


          ],
        ),
      ),
    );

  }


}
class ElysiumPutts extends StatelessWidget {
  const ElysiumPutts({Key? key}) : super(key: key);

  final _url = 'https://www.youtube.com/watch?v=QoCUnhit-Gs&ab_channel=StnFlu';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Image.asset(
              "images/Elysium.gif",
              fit: BoxFit.fill,
            ),
            TitleWidget(title: 'ElysiumPutts', subTitle:'Physics Simulation', rating: ' 90/100', starCol: Colors.yellow,),

            Center(child:Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Text('Elysium Putts is a golf simulation created in a custom game engine which employs PhysX, as well as a custom .OBJ reader to parse data into the game. This project was created for the "Physics Simulation" module in my third year of University (receiving a 90/100).'
                    '\n\n The aim of the game is to putt the ball into the hole, rather than shooting the ball in a direction like most conventional putting games, the player instead controls the golf club, and is required to move to the ball to putt it.',
                  style: TextStyle(fontSize: 16),textAlign: TextAlign.center,))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Chip(
                    label: const Text('C++'),
                  ),
                  Chip(
                    label: const Text('3D Art'),
                  ),
                  Chip(
                    label: const Text('Level Design'),
                  ),
                  Chip(
                    label: const Text('Game Design'),
                  ),
                  Chip(
                    label: const Text('Physics Simulation'),
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
              child: const Text('Watch Here', style: TextStyle(fontSize: 24),),
            ),),
            Padding(padding: EdgeInsets.all(10)),


          ],
        ),
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
                child: Text('SnowRyde is a casual game of patience, The player must traverse the environment by. This game was created as part of the 32nd GDL Game Jam (July 2021, a 72 hour game jam with the theme of "Size does matter... Make a game where size really does matter!" and receiving 1st Place across all categories(fun, theme, polish and creativity).',
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

  final _url = 'https://stnflu.itch.io/jam';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                child: Text('Repair The Toy was my first - and worst game jam. The aim of the game is to gather all the components of the toy and reassemble it.'
                    'While the premise is simple at the time I allowed for myself to run wild with ideas. Rather than focusing on the main goals of the game, I '
                    'instead tried adding random features like procedural animation. Most features did not make the final cut'
                    '.\n\n Even though I would classify the game jam as a failure, it taught valuable lessons which I took with me to the next two jams, allowing for me to win them.'
                    'The main lesson I learn was managing scope creep. By utilising a kanban board I would identify the main targets for the game and complete them one at a time, rather than'
                    ' floating between random ideas. ',
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
                    label: const Text('3D Art'),
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
            Padding(padding: EdgeInsets.all(10)),

          ],
        ),
      ),
    );
  }
}




