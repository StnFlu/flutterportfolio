
import 'package:flutterportfolio/transitions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';


Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      const Text('41'),
    ],
  ),
);


class TitleWidget extends StatefulWidget {
  final bool star;
  const TitleWidget({Key? key,
    required this.title, required this.subTitle, required this.rating , required this.starCol, this.star = true}) : super(key: key);
  final String title;
  final String subTitle;
  final String rating;
  final Color starCol;


  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.black54,
        image: DecorationImage(
          image: NetworkImage('https://danielmonk.me/images/footer.png'),
          repeat: ImageRepeat.repeat,
        )
      ),
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                ),
                Text(
                  widget.subTitle,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          widget.star == true ?
          Icon(
            Icons.star,
            color: widget.starCol,
          ): Container(),
          widget.star == true ?
          Text(widget.rating):
          Container(),
        ],
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

            Wrap(
              children: [
                new Container(margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: myBoxDecoration(),//             <--- BoxDecoration here
                  child: Text(
                    "C#",
                    style: TextStyle(fontSize: 18),
                  ),),
                new Container(margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: myBoxDecoration(),//             <--- BoxDecoration here
                  child: Text(
                    "2D Art",
                    style: TextStyle(fontSize: 18),
                  ),),
                new Container(margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: myBoxDecoration(),//             <--- BoxDecoration here
                  child: Text(
                    "Unity",
                    style: TextStyle(fontSize: 18),
                  ),),
                new Container(margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: myBoxDecoration(),//             <--- BoxDecoration here
                  child: Text(
                    "Level Design",
                    style: TextStyle(fontSize: 18),
                  ),),
                new Container(margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: myBoxDecoration(),//             <--- BoxDecoration here
                  child: Text(
                    "Game Design",
                    style: TextStyle(fontSize: 18),
                  ),),
                new Container(margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: myBoxDecoration(),//             <--- BoxDecoration here
                  child: Text(
                    "Github",
                    style: TextStyle(fontSize: 18),
                  ),),

              ],
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

class MyList extends StatelessWidget {
  final List<String> items;
  final List<Widget> pages;
  const MyList({Key? key, required this.items, required this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.all(20),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, SlideTopRoute(page: pages[index]));
                },
                child: Text(items[index], style: TextStyle(fontSize: 24), ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(240, 80),
                    primary: Color(0xFFF8494E)
                ),
              )
          );
          },
        separatorBuilder: (context, index){
          return Divider();
        },

      ),

    );
  }
}



