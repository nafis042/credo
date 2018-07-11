import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

          title: new Text('More'),
          centerTitle: true),
      body: new ListView(

        children: <Widget>[
          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("profile");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(image: AssetImage("assets/profile.png"), height: 20.0, width: 20.0,),
                  SizedBox(width: 8.0,),
                  Text('View & Edit Profile', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDEDEDE),
            height: 1.0,
          ),

          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("manage agents");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(image: AssetImage("assets/manage_agent.png"), height: 20.0, width: 20.0,),
                  SizedBox(width: 8.0,),
                  Text('Manage Agents', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDEDEDE),
            height: 1.0,
          ),

          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("agent's app usage");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(image: AssetImage("assets/data_usage.png"), height: 20.0, width: 20.0,),
                  SizedBox(width: 8.0,),
                  Text('Agents App Usage', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDEDEDE),
            height: 1.0,
          ),


          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("Payment & Billing");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(image: AssetImage("assets/payment.png"), height: 20.0, width: 20.0,),
                  SizedBox(width: 8.0,),
                  Text('Payment & Billing', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDEDEDE),
            height: 1.0,
          ),


          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("Reports");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(image: AssetImage("assets/report.png"), height: 20.0, width: 20.0,),
                  SizedBox(width: 8.0,),
                  Text('Reports', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDEDEDE),
            height: 1.0,
          ),


          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("App Settings");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.settings, color: Color(0xFF404041),),
                  SizedBox(width: 8.0,),
                  Text('App Settings', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDEDEDE),
            height: 1.0,
          ),


          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("Your Activity");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.notifications, color: Color(0xFF404041)),
                  SizedBox(width: 8.0,),
                  Text('Your Activity', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDEDEDE),
            height: 1.0,
          ),


          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("Help & Support");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image(image: AssetImage("assets/help.png"), height: 20.0, width: 20.0,),
                  SizedBox(width: 8.0,),
                  Text('Help & Support', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFDEDEDE),
            height: 1.0,
          ),


          Material(

            borderRadius: BorderRadius.circular(0.0),
            elevation: 0.0,
            child: MaterialButton(
              onPressed: () {
                print("Logout");
              },
              //height: 48,
              height: 65.0,
              padding: EdgeInsets.only(left: 8.0, right:8.0),
              color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.settings_power, color: Color(0xFF404041),),
                  SizedBox(width: 8.0,),
                  Text('Logout', style: TextStyle(fontFamily: 'Poppins', color: Color(0xFF404041))),

                ],
              ),
            ),
          ),




        ],



      ),
    );
  }
}