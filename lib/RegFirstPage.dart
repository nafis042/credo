import 'package:flutter/material.dart';
import 'package:flutter_app/RegSecondPage.dart';

class RegFirstPage extends StatefulWidget {

  @override
  RegFirstPageState createState() {
    return new RegFirstPageState();
  }
}

class RegFirstPageState extends State<RegFirstPage> {




  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {


    ButtonTapped(String name){
      print(name);
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegSecondPage()),
      );
    }
    
    
    BuildMaterialButton(String name, String icon){
      return MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: 65.0,
          onPressed: () {

           ButtonTapped(name);

          },
          //color: Color(0xFFFFFF),
          child: Row(
            children: <Widget>[
              Image(image: AssetImage("assets/" + icon + ".png"), height: 15.0),
              SizedBox(width: 16.0,),
              Text(name, style: TextStyle(color: Color(0xFF404041), fontFamily: 'Poppins')),

            ],
          ),
        );

    }

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
            Text('Teamwork supports a variety of task type. What you\'ll be using it for ?', style: TextStyle(fontSize: 20.0),),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              height: 0.5,
              color: Color(0xFFDEDEDE),
            ),
            BuildMaterialButton('Car Rental', 'car'),
            SeparatorBar(),
            BuildMaterialButton('Salesforce Managemant', 'sales'),
            SeparatorBar(),
            BuildMaterialButton('Installation & Maintenance', 'profile'),
            SeparatorBar(),
            BuildMaterialButton('Delivery or Logistics', 'profile'),
            SeparatorBar(),
            BuildMaterialButton('Others', 'profile'),
            SeparatorBar(),
          ],
        ),
      ),

      bottomNavigationBar:
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
             // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                Expanded(
                  child:   LinearProgressIndicator(
                    backgroundColor: Color(0xFFF1C8D8),
                    valueColor:  AlwaysStoppedAnimation<Color>(Color(0xFFC2185B)),
                    value: 0.33,
                  ),

                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text('Step 1 of 3'),
                )


              ],
            ),
          )
       










    );
  }
}