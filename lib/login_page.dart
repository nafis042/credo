import 'package:flutter/material.dart';
import 'package:flutter_app/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter_app/TeamRegistration.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

Future<String> getPreference(String key) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<bool> setPreference(String key, String value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
  return prefs.commit();
}



class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final background = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );

    void checkValidity(String name){
      print(name);
      if (name == null){
        print("no team registered");
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => TeamRegistration()),
        );
      }
      else{
        Navigator.of(context).pushNamed(HomePage.tag);
      }

    }

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(6.0),
        shadowColor: Colors.green.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: 42.0,
          onPressed: () {

            getPreference("team").then(checkValidity);

          },
          color: Color(0xFF25C27A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
               Text('Login With Phone', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
               Image(image: AssetImage("assets/arrow.png"), height: 15.0)
            ],
          ),
        ),
      ),
    );



    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
            background,
            new SafeArea(
              child: new Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                 // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    loginButton,
                  ],
                ),
              ),
            ),
            //loginButton,
         //   forgotLabel
          ],

      ),
    );
  }
}