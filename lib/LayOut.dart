
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
                  Navigator.push(context, SlideBottomRoute(page: pages[index]));
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



