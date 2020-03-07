import 'package:flutter/material.dart';
import 'package:funny_app/main.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
class StoryDetailScreen extends StatefulWidget {
  final Story story ;
  StoryDetailScreen({this.story});
  @override
  _StoryDetailScreenState createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  final _controller = ScrollController();
  double _parallaxOffset = 0.0;
  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() => _parallaxOffset = -_controller.offset * 0.2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[


            ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(0), bottomRight: Radius.circular(100)),
              child: ClipOval(
                clipper: CustomClip(),
                child: Container(
                  height: 300,
                  width: 440,
                  child: Image.asset(widget.story.image, fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 20,),

            Row(
              children: <Widget>[
                SizedBox(width: 160,),
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
                  child: Hero(tag: widget.story.title,

                    child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                      },
                      icon: Icon(FeatherIcons.edit, color: color2,),iconSize: 40,color: Color(0xFFFEAC5E),padding: EdgeInsets.all(12), ),),

                ),
              ],
            ),
            SizedBox(height: 10,),

            Text(widget.story.title,
              style: TextStyle(
                color: mediumGrey,
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                fontFamily: "VarelaRound-Regular",
                letterSpacing: 1.2,
              )
          ),
            Text(widget.story.date,
                style: TextStyle(
                  color: mediumGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: "VarelaRound-Regular",
                )
            ),
            SizedBox(height: 20,),

            Wrap(
              spacing: 8,
              children: <Widget>[
                Container(

                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff7F7F7F),
                          offset: Offset(2, 2),
                          blurRadius: 8)
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(FeatherIcons.menu, color: darkGrey,),iconSize: 24,color: darkGrey ,padding: EdgeInsets.all(12), ),
                ),


                Container(
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff7F7F7F),
                          offset: Offset(2, 2),
                          blurRadius: 8)
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(FeatherIcons.info, color: darkGrey,),iconSize: 24,color: darkGrey ,padding: EdgeInsets.all(12), ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xff7F7F7F),
                          offset: Offset(2, 2),
                          blurRadius: 8)
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.business_center, color: darkGrey,),iconSize: 24,color: darkGrey ,padding: EdgeInsets.all(12), ),
                ),
              ],
            ),
            SizedBox(height: 20,),


            Text('My daily notes : ',
                style: TextStyle(
                  color: darkGrey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: "VarelaRound-Regular",
                )
            ),
            SizedBox(height: 10,),

            Text('Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès quil est prêt ou que la mise en page est achevée',
                style: TextStyle(
                  color: mediumGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: "VarelaRound-Regular",
                )
            )



          ],
        ),
      ),);

}
}




class CustomClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    Rect rec =
    Rect.fromLTRB(-size.width*0.5, -size.height*1.1, size.width * 1.1, size.height);
    return rec;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}