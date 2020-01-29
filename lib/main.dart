//import 'package:flutter/material.dart';

//import 'package:flutter_html_view/flutter_html_view.dart';

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'strings_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'dart:io';
File _image;
ImageProvider backgroundImage;

double width_;
double height_;
Color yellow=Colors.yellowAccent;
Color black =Colors.black;

void main() => runApp(new MaterialApp(home: new MyApp()));
Color myColor = Colors.deepPurple;

final CurrentHour=DateTime.now().hour;
var CurrentMinute=DateTime.now().minute;
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        selectNotification: onSelectNotification);
    //onLoad(context);
  }


  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");

    showDialog(
        context: context,

        builder: (_) => alertsContainer('$payload'));
  }

  alertsContainer(String message) {

    return

      SingleChildScrollView(child: AlertDialog(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
       // contentPadding: EdgeInsets.only(top: 2.0,bottom:1.0 ),
        content: Container(
          width: 300.0,
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.start,
           // crossAxisAlignment: CrossAxisAlignment.stretch,
           // mainAxisSize: MainAxisSize.max,
            children: <Widget>[


              Container(

               // width:300.0,
               // height:400.0,
                 width:width_,

               // height:height_*9/10,
               // height:height_*8/10,
              height:height_*6.7/10,
                decoration: BoxDecoration(
                  image: DecorationImage(
                   // image: NetworkImage('https://bit.ly/2oqNqj9'),
                   // image: AssetImage("images/auntdropportrait.png"),

                    image: AssetImage('images/'+switchImage()),
                  ),
                ),
              child: Container(
                margin: const EdgeInsets.only(left: 5.0),
                  child: Text(
                  //  'Flutter.dev'
                   // "\n"+StringHelpers.msg2,
                    message,

           // {}
                    style: TextStyle(color: switchColor(),fontSize: 20.0,fontWeight:FontWeight.bold),

                    strutStyle: StrutStyle(
              fontFamily: 'Roboto',
              fontSize: 30,
              height: 1.0,

            ),
                  ),
                ),
              ),

              InkWell(child:Container(child: MaterialButton(
                minWidth: double.infinity,
                height: 39.0,
                color: Theme.of(context).buttonColor,
                disabledColor: Theme.of(context).buttonColor,
                onPressed: () => exit(0),
                child: Text(
                  'OK',
                  style: TextStyle(
                     // color: switchColor(),
                      fontSize: 20.0
                  ),
              ),
              ),))
            ],
          ),
        ),
      ));

  }

  String switchImage()
  {
    switch (CurrentHour) {

      case 7:
     // return 'task_oriented.jpg';
      return 'prayer_portrait.jpg';
      break;

      case 8:
      //return 'lezard.png';
        return 'thought.png';
        break;
      case 9:
      // return 'shore2.jpg';
        return 'prayersportrait.png';
        break;

      case 10:
        return 'auntdropportrait.png';
        break;

      case 11:
        return 'breakfast2.jpg';
        break;

      case 12:
        return 'task_oriented.jpg';
        break;

      case 13:
        return 'auntcardio2.png';
        break;

      case 14:
        return 'Aportrait.jpg';
        break;



      case 15:
       // return 'Aportrait2.jpg';
        return 'shore2.jpg';
         break;

      case 16:

        return 'thanks4.jpg';
        break;

      case 17:

        return 'neige2.png';
        break;

      case 18:
          return 'waterrock.png';
        break;

      case 19:
        return 'waterdrop.png';
        break;

      case 20:
        return 'grotte.jpg';
        break;

      case 22:
        return 'california_sunset1.jpg';
        break;

      case 23:
      // return 'waterdrop.png';
      //return 'bird_drink.png';
      //return 'nature.jpg';
      // return 'california_sunset.jpg';
      // return 'scenic3.jpg';
      // return 'neige2.png';
        return 'family.png';
        break;


    }
    }

  Color switchColor()
  {
    switch (CurrentHour) {

      case 7:
        //return Colors.white;
      return black;
        break;
      case 8:
        return Colors.white;
        break;
      case 9:
        return Colors.white;
        break;

      case 10:
        return Colors.yellowAccent;
        break;

      case 11:
        return black;
        break;

      case 12:
        return black;
        break;

      case 13:
        return Colors.yellowAccent;
        break;

      case 14:
        return black;
        break;


      case 15:
        return Colors.yellowAccent;
        break;

      case 16:
      return Colors.white;
      break;

      case 17:
        return Colors.white;
        break;

      case 18:
        return Colors.tealAccent;
        break;

      case 19:
        return Colors.tealAccent;
        break;

      case 20:
        return Colors.white;
        // return black;
        break;



      case 23:
        return Colors.tealAccent;
        break;


    }
  }

  @override
  Widget build(BuildContext context) {

    width_ = MediaQuery.of(context).size.width;
    height_ = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Wellness alerts Notification'),


            actions: <Widget>[
        // action button
        IconButton(
        icon:  Image.asset('images/app-icon.png',

    ),)]),
        body:
        // showNotification(),
        // alertsContainer(StringHelpers.msg1)

        new RaisedButton(
          onPressed: showNotification,
          child: Center(child: new Text(
            'Show Alert',

            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                backgroundColor: Colors.blue,
                color: Colors.white),
          ),

          ),


        )
    );
  }



  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High, importance: Importance.Max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);

    if (CurrentHour <7)


      await flutterLocalNotificationsPlugin.show(
          0, StringHelpers.msg0, 'Wellness Alert', platform,
          payload: StringHelpers.msg0)
    ;
    else {

      switch (CurrentHour) {

        case 2:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg14, 'Wellness Alert', platform,
              payload: StringHelpers.msg14)
          ;
          break;


        case 4:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg1_, 'Wellness Alert', platform,
              payload: StringHelpers.msg1_)
          ;
          break;



        case 8:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg1_, 'Wellness Alert', platform,
              payload: StringHelpers.msg1_)
          ;
          break;


        case 9:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg2, 'Wellness Alert', platform,
              payload: StringHelpers.msg2)
          ;
          break;
        case 10:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg3, 'Wellness Alert', platform,
              payload: StringHelpers.msg3)
          ;
          break;
        case 11:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg4, 'Wellness Alert', platform,
              payload: StringHelpers.msg4)
          ;
          break;


        case 12:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg5, 'Wellness Alert', platform,
              payload: StringHelpers.msg5)
          ;
          break;

        case 13:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg6, 'Wellness Alert', platform,
              payload: StringHelpers.msg6)
          ;

          break;
        case 14:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg7, 'Wellness Alert', platform,
              payload: StringHelpers.msg7)
          ;
          break;
        case 15:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg8, 'Wellness Alert', platform,
              payload: StringHelpers.msg8)
          ;

          break;
        case 16:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg9, 'Wellness Alert', platform,
              payload: StringHelpers.msg9)
          ;
          break;

        case 17:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg10, 'Wellness Alert', platform,
              payload: StringHelpers.msg10)
          ;
          break;

        case 18:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg11, 'Wellness Alert', platform,
              payload: StringHelpers.msg11)
          ;
          break;

        case 19:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg12, 'Wellness Alert', platform,
              payload: StringHelpers.msg12)
          ;
          break;



        case 20:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg13, 'Wellness Alert', platform,
              payload: StringHelpers.msg13)
          ;
          break;

          break;
        case 22:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg17, 'Wellness Alert', platform,
              payload: StringHelpers.msg17)
          ;
          break;

        case 23:
        await flutterLocalNotificationsPlugin.show(
         0, StringHelpers.msg12, 'Wellness Alert', platform,
        payload: StringHelpers.msg12);

          break;
        case 24:
          await flutterLocalNotificationsPlugin.show(
              0, StringHelpers.msg13, 'Wellness Alert', platform,
              payload: StringHelpers.msg13);
          break;



     
      }
    }
  }
}


