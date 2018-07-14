import 'package:flutter/material.dart';
import 'package:flutter_app/RegThirdPage.dart';

class RegSecondPage extends StatefulWidget {

  @override
  RegSecondPageState createState() {
    return new RegSecondPageState();
  }
}

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

class RegSecondPageState extends State<RegSecondPage> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController companyController = new TextEditingController();


  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {

    SeparatorBar() {
      return Container(
        height: 0.5,
        color: Color(0xFFDEDEDE),
      );
    }


    return new Scaffold(


        appBar: new AppBar(
          backgroundColor: Color(0xFFFFFF),
          elevation: 0.0,
          leading: new BackButton(
            color: Color(0xFF404041),
          ),
        ),
        key: _scaffoldKey,
        //resizeToAvoidBottomPadding: false,
        body: new ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  children: <Widget>[
                    Text('Complete Your Profile', style: TextStyle(fontSize: 20.0),),
                    SizedBox(height: 20.0,),
                    SeparatorBar(),
                    MaterialButton(
                        padding: EdgeInsets.only(top: 16.0),
                        onPressed: () {
                          print("abc");
                        },
                        //height: 48,
                        height: 55.0,
                        minWidth: 55.0,
                        // color: Color(0xFFB00020),
                        child: Center(
                          child: Image(image: AssetImage("assets/profile_image.png"), height: 110.0, width: 110.0,),
                        )


                    ),
                    SizedBox(height: 16.0,),
                    SeparatorBar(),
                    new TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: InputBorder.none ,
                        filled: false,
                        icon: const Icon(Icons.account_circle, color: Color(0xFF404041),),
                        hintText: 'What do people call you?',
                        labelText: 'Full Name',
                          labelStyle: TextStyle(color: Color(0xFF404041))
                      ),
                      onSaved: (String value) { print(value); },
                      // validator: _validateName,
                    ),

                    SeparatorBar(),

                    new TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none ,
                        filled: false,
                        icon: const Icon(Icons.phone, color: Color(0xFF404041)),
                        hintText: 'Which number people call you?',
                        labelText: 'Phone Number',
                          labelStyle: TextStyle(color: Color(0xFF404041))
                      ),
                      onSaved: (String value) { print(value); },
                      // validator: _validateName,
                    ),
                    SeparatorBar(),
                    new TextFormField(
                      controller:  emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: InputBorder.none ,
                        filled: false,
                        icon: const Icon(Icons.email, color: Color(0xFF404041)),
                        hintText: 'Give your email here',
                        labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xFF404041))
                      ),
                      onSaved: (String value) { print(value); },
                      // validator: _validateName,
                    ),
                    SeparatorBar(),
                    new TextFormField(
                      controller: companyController,
                      decoration: const InputDecoration(
                        border: InputBorder.none ,
                        filled: false,
                        icon: const Icon(Icons.alternate_email, color: Color(0xFF404041)),
                        hintText: 'Give your company name',
                        labelText: 'Company Name',
                        labelStyle: TextStyle(color: Color(0xFF404041))
                      ),
                      onSaved: (String value) { print(value); },
                      // validator: _validateName,
                    ),
                    SeparatorBar(),
                    SizedBox(height: 20.0,),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        Expanded(
                          child:   LinearProgressIndicator(
                            backgroundColor: Color(0xFFF1C8D8),
                            valueColor:  AlwaysStoppedAnimation<Color>(Color(0xFFC2185B)),
                            value: 0.66,
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text('Step 2 of 3'),
                        )


                      ],
                    ),


                  ],


        ),



        bottomNavigationBar:
        Material(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
          elevation: 0.0,
          child: MaterialButton(
            onPressed: () {
              print(nameController.text);
              print(phoneController.text);
              print(emailController.text);
              print(companyController.text);

              Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegThirdPage()),
              );
            },
            //height: 48,
            height: 48.0,
            color: Color(0xFF25C27A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Save', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
                Image(image: AssetImage('assets/right.png'), height: 15.0,)
              ],
            ),
          ),
        ),











    );
  }
}