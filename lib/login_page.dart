import 'package:flutter/material.dart';
import 'package:flutter_app/home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
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

//    final email = TextFormField(
//      keyboardType: TextInputType.emailAddress,
//      autofocus: false,
//      initialValue: 'alucard@gmail.com',
//      decoration: InputDecoration(
//        hintText: 'Email',
//        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//      ),
//    );
//
//    final password = TextFormField(
//      autofocus: false,
//      initialValue: 'some password',
//      obscureText: true,
//      decoration: InputDecoration(
//        hintText: 'Password',
//        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//      ),
//    );




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
            Navigator.of(context).pushNamed(HomePage.tag);
          },
          color: Colors.green,
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