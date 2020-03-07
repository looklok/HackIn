import 'package:flutter/material.dart';
import 'main.dart';

class secondPage extends StatefulWidget {

  @override
  _secondPageState createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
      Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
          gradient: LinearGradient(colors: [MyColors.mainGrad1,MyColors.mainGrad2], begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),),
        Padding(
          padding: const EdgeInsets.only(top: 88, left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Image.asset('assets/Avatar.png', height: 96, width: 96,),
            SizedBox(height: 22,),
            FlatButton(onPressed:null, child: 
            Text("So , what do you want us to call  you",

             style: TextStyle(color: Colors.white, fontSize:24 ), 
            ),),
SizedBox(height:10),          // Button
Padding(padding: const EdgeInsets.only(bottom: 100,),
        child: Container(
                    width: MediaQuery.of(context).size.width,
                    height:56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: MyColors.mainGrad1,
                            blurRadius: 6,
                            offset: Offset.fromDirection(0, 12)),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child:TextField (onChanged:(String str) {print('Enter your name here');},
                        
  decoration: InputDecoration(
    border: OutlineInputBorder(),
   
  ),
) //FlatButton(
                          //splashColor: Color(0x25FFDDDD),
                          //highlightColor: Colors.transparent,
                         // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                         // onPressed: () => {},
                          //child: Text(
                          //  "Enter your name here",
                           // style: new TextStyle(
                               // color: Color(0xFF7F7F7F),
                               // fontFamily: 'Oxygen',
                               // fontSize: 24),
//)),
                    ),
                  ),
),
        

        

        ],),
    )],),);
  }
}



       
        