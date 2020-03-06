import 'package:flutter/material.dart';
import 'package:funny_app/data.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'dart:math';
const color1 = Color(0xFFFFC77B);
const color2 = Color(0xFFFF9CA5);
var lightGrey = Color(0xfff5f5f5);
var mediumGrey = Color(0xff9c9c9c);
var darkGrey = Color(0xff606060);
const Color RegularShadow = Color.fromARGB(130, 0, 0, 0);
const String font = "VarelaRound-Regular";

class User {
  String nom;
  String prenom;

}
class Story {
  String title;
  var image;
  String date;

  Story(
      {this.title,
        this.image,
        this.date});
}

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Funny app',
      theme: ThemeData(
      ),
      home: MyHomePage(),
    );
  }
}

const cardAspectRatio = 12.0 / 16.0;
const widgetAspectRatio = cardAspectRatio * 1.2;


class MyHomePage extends StatefulWidget {

  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var currentPage = stories.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: stories.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return  Container(
         color: Colors.white,
         child :Scaffold(
         backgroundColor: Colors.transparent,
         body: SingleChildScrollView(
         child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            
            Row(
              mainAxisAlignment:MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 280,
                  child: Text('Hibaaa',
                      textDirection: TextDirection.ltr,
                      overflow :TextOverflow.clip ,
                      style: TextStyle(
                        color: lightGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 100.0,
                        fontFamily: "VarelaRound-Regular",
                        letterSpacing: 12,
                      )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                    width: 110,
                    height: 112,
                    child: Image.asset("assets/images/Avatar.png",fit:BoxFit.cover ,)),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Good morning ",
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 32.0,
                        fontFamily: "VarelaRound-Regular",
                        letterSpacing: 1.4,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Hiba !",
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "VarelaRound-Regular",
                        letterSpacing: 1.2,
                      )),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                CardScrollWidget(currentPage),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: stories.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff7F7F7F),
                          offset: Offset(4, 4),
                          blurRadius: 8)
                    ],
                  ),
                  child: IconButton(icon: Icon(FeatherIcons.menu, color: color2,),iconSize: 32,color: Color(0xFFFEAC5E),padding: EdgeInsets.all(12), ),
                ),
                Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff7F7F7F),
                          offset: Offset(4, 4),
                          blurRadius: 8)
                    ],
                  ),
                  child: IconButton(icon: Icon(FeatherIcons.edit, color: color2,),iconSize: 32,color: Color(0xFFFEAC5E), padding: EdgeInsets.all(12),),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
           
        ),
      ),
    ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < stories.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 10.0)
                ],),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Opacity(
                          opacity : 0.7,
                          child: Image.asset(stories[i].image, fit: BoxFit.cover)),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(stories[i].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      shadows: [

                                        Shadow(
                                          color: RegularShadow,
                                          offset: Offset(0, 3),
                                          blurRadius: 8,
                                      )],
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: font)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
      );

  }
}


