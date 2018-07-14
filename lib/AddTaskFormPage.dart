import 'package:flutter/material.dart';
import 'package:flutter_app/RegThirdPage.dart';
import 'package:flutter_app/SelectTask.dart';
import 'dart:async';
import 'package:flutter_app/AddTaskFirst.dart';
import 'package:intl/intl.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/SelectFromMapPage.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class AddTaskFormPage extends StatefulWidget {

  String value = "";
  Color taskColor;
  List<UserDetails> selectedUser = [];
  LatLng position;
  AddTaskFormPage({Key key, this.value, this.taskColor, this.selectedUser, this.position}) : super(key: key);

  @override
  AddTaskFormPageState createState() {
    return new AddTaskFormPageState();
  }
}

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

class AddTaskFormPageState extends State<AddTaskFormPage> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController companyController = new TextEditingController();
  DateTime selectedDate = new DateTime.now();
  TimeOfDay selectedTime = new TimeOfDay.now();
  Duration selectedDuration = Duration(hours: 0, minutes: 30);
  bool _imageswitchValue = false;
  bool _attachmentswitchValue = false;
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

    Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: new DateTime(2015, 8),
          lastDate: new DateTime(2101)
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });

    }

    Future<Null> _selectTime(BuildContext context) async {
      final TimeOfDay picked = await showTimePicker(
          context: context,
          initialTime: selectedTime
      );
      if (picked != null && picked != selectedTime)
        setState(() {
          selectedTime = picked;
        });
    }

    Future<Null> _selectDuration(BuildContext context) async {
      Duration resultingDuration = await showDurationPicker(
        context: context,
        initialTime: new Duration(minutes: 30),
      );
      setState(() {
        selectedDuration = resultingDuration;
      });
    }

    FormatDuration(Duration duration){
      int hour = duration.inHours;
      int min = duration.inMinutes % 60;
      if (hour > 0){
        return '$hour h $min min';
      }
      else{
        return '$min min';
      }

    }







    return new Scaffold(


      appBar: new AppBar(
        backgroundColor: Color(0xFF25C27A),
        elevation: 0.0,
        title: Text('Add A Task', style: TextStyle(fontSize: 17.0),),
        centerTitle: true,
        leading: new BackButton(
          color: Color(0xFFFFFFFF),
        ),
        actions: <Widget>[
          OutlineButton(
            color: Color(0xFFFFFF),
        borderSide: BorderSide.none,
            onPressed: (){
              print('save pressed');
            },
            child: Text('Save', style: TextStyle(color: Colors.white),),
          )
        ],
      ),
      key: _scaffoldKey,
      //resizeToAvoidBottomPadding: false,
      body: new ListView(
        shrinkWrap: true,
        //padding: EdgeInsets.only(left: 16.0, right: 16.0),
        children: <Widget>[
          ListTile(
            leading: widget.value == null ? Icon(Icons.search) : new Material(
              color: widget.taskColor,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              child: Container(
                height: 24.0,
                width: 24.0,
                child: Center(

                  child: Text("${widget.value}"[0], style: TextStyle(color: Colors.white),),
                ),
              ),

            ),
            title: widget.value == null ? Text('Select Task Type') :  Text("${widget.value}"),
            onTap: (){
              var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                new SelectTaskPage(value: widget.value, selectedUser: widget.selectedUser, taskColor: widget.taskColor,),
              );
              Navigator.of(context).push(route);
            },
          ),

          SeparatorBar(),

          ListTile(
            leading: Icon(Icons.done_all, color: Color(0xFF404041),),
            title:  new TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: InputBorder.none ,
                labelStyle: TextStyle(color: Color(0xFF404041)),
                filled: false,
                hintText: 'Give your task a name',
                labelText: 'Task Title',
              ),
              onSaved: (String value) { print(value); },
              // validator: _validateName,
            ),
          ),
          SeparatorBar(),

          ListTile(
            leading: Icon(Icons.account_circle, color: Color(0xFF404041),),
            title: widget.selectedUser == null ? Text('Assign Agents') : Container(
                    //margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[

                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.selectedUser.length,
                          itemBuilder: (context, index){
                            print(widget.selectedUser.length);
                            return new Padding(padding: EdgeInsets.only(left: 4.0, right: 4.0),

                            child: CircleAvatar(backgroundImage: new NetworkImage(widget.selectedUser[index].profileUrl,), radius: 25.0,)
                            );

                          },

                        )

                      ],
                    ),

            ),
            onTap: (){
              var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                new AddTaskPage(value: widget.value, selectedUser: widget.selectedUser, taskColor: widget.taskColor),
              );
              Navigator.of(context).push(route);
            },
          ),

          SeparatorBar(),

          ListTile(
            leading: Icon(Icons.event, color: Color(0xFF404041),),
            title: Text(new DateFormat.yMMMMEEEEd().format(selectedDate)),
            onTap: (){
                _selectDate(context);
            },
          ),
          SeparatorBar(),

          ListTile(
            leading: Icon(Icons.schedule, color: Color(0xFF404041),),
            title:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        _selectTime(context);

                      },
                      child: Text(selectedTime.format(context)),
                    ),

                  Icon(Icons.timeline, color: Color(0xFF404041),)
                  ],
              ),
            trailing: GestureDetector(
            onTap: (){
              print('ggg');
              _selectDuration(context);

            },
            child:  Text(FormatDuration(selectedDuration)),
            ),


          ),
          SeparatorBar(),

          ListTile(
            leading: Icon(Icons.location_on, color: Color(0xFF404041),) ,
            title: widget.value == null ? Text('Select Location') :  Text("${widget.value}"),
            onTap: (){
              var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                new SelectFromMapPage(value: widget.value, selectedUser: widget.selectedUser, taskColor: widget.taskColor,),
              );
              Navigator.of(context).push(route);
            },
          ),
          widget.position == null ? SeparatorBar(): Container(),

          widget.position == null ? Container():
          ListTile(
            onTap: (){
              print('tapping');
              var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                new SelectFromMapPage(value: widget.value, selectedUser: widget.selectedUser, taskColor: widget.taskColor,),
              );
              Navigator.of(context).push(route);
            },
            leading: Icon(Icons.keyboard_arrow_left, color: Color(0xFFFFFF),),
            title:      Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    new FlutterMap(
                      options: new MapOptions(
                        center: widget.position,
                        zoom: 15.0,
                        maxZoom: 22.0,
                        minZoom: 3.0,
                        interactive: false,
                        onTap: (abc){
                          print('tapped');
                        },

                      ),
                      layers: [
                        new TileLayerOptions(
                          urlTemplate: "https://api.mapbox.com/v4/"
                              "{id}/{z}/{x}/{y}@2x.png?access_token=pk.eyJ1IjoibmFmaXMwMDAxIiwiYSI6ImNqOW1rNnhxbTB0N2Yyd250cXJxeGxiMWQifQ.D6rR_E-7XO_OJMsMDUPLXw",
                          additionalOptions: {
                            'accessToken': 'pk.eyJ1IjoibmFmaXMwMDAxIiwiYSI6ImNqOW1rNnhxbTB0N2Yyd250cXJxeGxiMWQifQ.D6rR_E-7XO_OJMsMDUPLXw',
                            'id': 'mapbox.streets',
                          },
                        ),
                        new MarkerLayerOptions(markers: [new Marker(point: widget.position,
                            builder: (ctx) => new Container(
                              child: new Image(image: AssetImage('assets/Pin.png'), height: 30.0, width: 30.0,

                              ),
                            ))]),
                      ],
                    ),

                    new Container(
                      height: 200.0,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFFFFFF),
                    )
                  ],
                )


            ),
          ),

          ListTile(
            leading: Icon(Icons.repeat, color: Color(0xFF404041),),
            title:  new TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: InputBorder.none ,
                labelStyle: TextStyle(color: Color(0xFF404041)),
                filled: false,
                hintText: '',
                labelText: 'Do not Repeat',
              ),
              onSaved: (String value) { print(value); },
              // validator: _validateName,
            ),
          ),
          SeparatorBar(),

          ListTile(
            leading: Icon(Icons.camera, color: Color(0xFF404041),),
            title:  new Text('Require Image'),
            trailing: new CupertinoSwitch(
              value: _imageswitchValue,
              onChanged: (bool value) {
                setState(() {
                  _imageswitchValue = value;
                });
              },
            ),
          ),
          SeparatorBar(),

          ListTile(
            leading: Icon(Icons.attachment, color: Color(0xFF404041),),
            title:  new Text('Require Attachment'),
            trailing: new CupertinoSwitch(
              value: _attachmentswitchValue,
              onChanged: (bool value) {
                setState(() {
                  _attachmentswitchValue = value;
                });
              },
            ),
          ),
          SeparatorBar(),
          ListTile(
            leading: Icon(Icons.subject, color: Color(0xFF404041),),
            title:  new TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: InputBorder.none ,
                labelStyle: TextStyle(color: Color(0xFF404041)),
                filled: false,
                hintText: '',
                labelText: 'Notes',
              ),
              onSaved: (String value) { print(value); },
              // validator: _validateName,
            ),
          ),
          SeparatorBar(),
          ListTile(
            leading: Icon(Icons.playlist_add, color: Color(0xFF404041),),
            title:  new TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: InputBorder.none ,
                labelStyle: TextStyle(color: Color(0xFF404041)),
                filled: false,
                hintText: '',
                labelText: 'Important',
              ),
              onSaved: (String value) { print(value); },
              // validator: _validateName,
            ),
          ),
          SeparatorBar(),



               SizedBox(height: 100.0,)

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
              Text('Save Task', style: TextStyle(color: Colors.white, fontFamily: 'Poppins')),
              Icon(Icons.check, color: Colors.white,)
            ],
          ),
        ),
      ),











    );
  }
}