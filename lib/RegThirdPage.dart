import 'package:flutter/material.dart';
import 'package:flutter_app/home_page.dart';


class RegThirdPage extends StatefulWidget {

  @override
  RegThirdPageState createState() {
    return new RegThirdPageState();
  }
}

class RegThirdPageState extends State<RegThirdPage> {

  final TextEditingController nameController = new TextEditingController();


  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {






    SeparatorBar(){
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

        body: new Container(
          padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            children: <Widget>[
              Text('Give your team a nice name', style: TextStyle(fontSize: 20.0),),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                height: 0.5,
                color: Color(0xFFDEDEDE),
              ),
              new TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: InputBorder.none ,
                  filled: false,
                  icon: const Icon(Icons.group),
                  hintText: 'Give the name of your team',
                  labelText: 'Your Team Name',
                ),
                onSaved: (String value) { print(value); },
                // validator: _validateName,
              ),
              Container(
                
                height: 0.5,
                color: Color(0xFFDEDEDE),
              ),

            ],
          ),
        ),

        bottomNavigationBar:
            Container(
              height: 120.0,
              child:   Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: <Widget>[
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(width: 16.0,),
                      Expanded(
                        child:   LinearProgressIndicator(
                          backgroundColor: Color(0xFFF1C8D8),
                          valueColor:  AlwaysStoppedAnimation<Color>(Color(0xFFC2185B)),
                          value: 1.0,
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text('Step 3 of 3'),
                      )


                    ],
                  ),
                  SizedBox(height: 50.0,),
                  Material(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
                    elevation: 0.0,
                    child: MaterialButton(
                      onPressed: () {
                        print(nameController.text);

                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()),
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
                ],
              ),
            )













    );
  }
}