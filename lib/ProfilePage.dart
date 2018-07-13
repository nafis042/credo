import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {


  @override
  ProfilePageState createState() {
    return new ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {


  TextEditingController Namecontroller;
  TextEditingController Phonecontroller;
  TextEditingController Emailcontroller;

  void initState() {
    super.initState();
    Namecontroller = new TextEditingController(text: 'Nafis Islam');
    Phonecontroller = new TextEditingController(text: '01515262338');
    Emailcontroller = new TextEditingController(text: 'nafis.islam@dingi.live');

  }

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        leading: new BackButton(
          color: Colors.white,
        ),
        title: new Text('Your Profile'),
        centerTitle: true,
        actions:  <Widget>[

          new PopupMenuButton<String>(

            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              const PopupMenuItem<String>(
                  value: 'Toolbar menu',
                  child: const Text('Toolbar menu')
              ),
              const PopupMenuItem<String>(
                  value: 'Right here',
                  child: const Text('Right here')
              ),
              const PopupMenuItem<String>(
                  value: 'Hooray!',
                  child: const Text('Hooray!')
              ),
            ],
          ),
        ],

        backgroundColor: Color(0xFF25C27A),
      ),

      body:
         ListView(
           children: <Widget>[
             new Column(


               children: <Widget>[
                 Container(

                     padding: EdgeInsets.only(top: 16.0),
                     child: Center(
                       child: Image(image: AssetImage("assets/profile_image.png"), height: 110.0, width: 110.0,),
                     )

                 ),

                 Container(
                   margin: EdgeInsets.only(top: 16.0),
                   width: MediaQuery.of(context).size.width,
                   color: Color(0xFFDEDEDE),
                   height: 0.5,
                 ),

                 Container(
                   height: 75.0,
                   width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.only(left: 16.0),
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[

                       Center(

                         child: Image(image: AssetImage("assets/profile.png"), height: 24.0, width: 24.0,),
                       ),

                       Expanded(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Padding(
                                 padding: EdgeInsets.only(left: 16.0),
                                 child: Text('Full Name'),
                               ),

                               Padding(
                                 padding: EdgeInsets.only(left: 16.0),
                                 child: TextField(
                                     onChanged: (String value){

                                       print('on changed ' + value);
                                     },
                                     onSubmitted: (String value){
                                       print('on submitted ' + value);
                                     },

                                     controller: Namecontroller,
                                     autofocus: false,
                                     decoration: InputDecoration.collapsed()
                                 ),
                               )






                             ],
                           )
                       ),





                     ],

                   ),
                 ),


                 Container(
                   margin: EdgeInsets.only(top: 0.0),
                   width: MediaQuery.of(context).size.width,
                   color: Color(0xFFDEDEDE),
                   height: 0.5,
                 ),

                 Container(
                   height: 75.0,
                   width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.only(left: 16.0, right: 16.0),
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[

                       Center(

                         child: Image(image: AssetImage("assets/phone.png"), height: 20.0, width: 20.0,),
                       ),

                       Expanded(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Padding(
                                 padding: EdgeInsets.only(left: 16.0),
                                 child: Text('Phone Number'),
                               ),

                               Padding(
                                 padding: EdgeInsets.only(left: 16.0),
                                 child: TextField(
                                     onChanged: (String value){

                                       print('on changed ' + value);
                                     },
                                     onSubmitted: (String value){
                                       print('on submitted ' + value);
                                     },

                                     controller: Phonecontroller,
                                     autofocus: false,
                                     decoration: InputDecoration.collapsed()
                                 ),
                               )






                             ],
                           )
                       ),



                       Center(
                         child: Image(image: AssetImage("assets/verify.png"), height: 20.0, width: 20.0,),
                       ),



                     ],

                   ),
                 ),


                 Container(
                   margin: EdgeInsets.only(top: 0.0),
                   width: MediaQuery.of(context).size.width,
                   color: Color(0xFFDEDEDE),
                   height: 0.5,
                 ),

                 Container(
                   height: 75.0,
                   width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.only(left: 16.0),
                   child: Row(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[

                       Center(

                         child: Image(image: AssetImage("assets/email.png"), height: 20.0, width: 20.0,),
                       ),

                       Expanded(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Padding(
                                 padding: EdgeInsets.only(left: 16.0),
                                 child: Text('Email'),
                               ),

                               Padding(
                                 padding: EdgeInsets.only(left: 16.0),
                                 child: TextField(
                                     onChanged: (String value){

                                       print('on changed ' + value);
                                     },
                                     onSubmitted: (String value){
                                       print('on submitted ' + value);
                                     },

                                     controller: Emailcontroller,
                                     autofocus: false,
                                     decoration: InputDecoration.collapsed()
                                 ),
                               )






                             ],
                           )
                       ),





                     ],

                   ),
                 ),


                 Container(
                   margin: EdgeInsets.only(top: 0.0),
                   width: MediaQuery.of(context).size.width,
                   color: Color(0xFFDEDEDE),
                   height: 0.5,
                 ),


               ],



             ),
           ],
         ),


      bottomNavigationBar: Material(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
        elevation: 0.0,
        child: MaterialButton(
          onPressed: () {
            print("abc");
          },
          //height: 48,
          height: 48.0,
          color: Color(0xFF25C27A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Save & Update', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
              Image(image: AssetImage("assets/right.png"), height: 20.0, width: 20.0,),
            ],
          ),
        ),
      ),


    );

  }
}