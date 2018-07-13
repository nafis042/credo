import 'package:flutter/material.dart';
import 'package:flutter_app/RegFirstPage.dart';

class TeamRegistration extends StatefulWidget {

  @override
  TeamRegistrationState createState() {
    return new TeamRegistrationState();
  }
}

class TeamRegistrationState extends State<TeamRegistration> {




  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {

    return new Scaffold(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50.0, left: 16.0, right: 16.0),
              child: Text('Teamwork lets you manage your moving resources easily', style: TextStyle(fontSize: 20.0),),
            ),

            Expanded(

              child: Center(
                 child: Image(image: AssetImage('assets/teamReg.png'), height: 165.0,),
               )


            ),



          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Material(
            borderRadius: BorderRadius.circular(6.0),
            shadowColor: Colors.green.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              height: 42.0,
              onPressed: () {

                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegFirstPage()),
                );

              },
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  Text('Get Started', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                  Image(image: AssetImage("assets/arrow.png"), height: 15.0)
                ],
              ),
            ),
          ),
        ),

    );
  }
}