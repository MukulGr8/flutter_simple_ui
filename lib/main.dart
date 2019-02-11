import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_new/Login/Login.dart';
import 'package:flutter_new/TryAlertDBox.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; //This is used for File class here
import 'package:flutter/services.dart' show rootBundle;


void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  bool ok = true;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File image=new File("images/crops.jpg"); //File variable cant be null so . . we intialise it a default image.
  int mS=0; //maximum Size of image in bytes
  double oS=0; //Orignal Size of image after converting into mb
  int iSize=0; //Actual Size to show in the app for checking conditions (InAppSize)
  double contH=80.0;
  double contW=80.0;
  Curve _curve = Curves.decelerate;

//  To pick Image
  _getImage() async {
    print('Picker is called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    mS= await img.length();
    oS = mS/1000000;
    setState(() {
        image = img; //This is used to set the state for the image.
        iSize = oS.toInt(); //This is used to set the state for the image size.
    });
    print("Size of image is "+oS.toString()); //Display the size of image in floating points
    contH = 80.0;
    contW = 80.0;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Dashboard"),
        backgroundColor: new Color.fromRGBO(0, 188,212 ,1),
      ),

      //This is the floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: _curve,
        height: contH,
        width: contW,
        child: FloatingActionButton(
          backgroundColor: Colors.cyan,
          child: const Icon(
            Icons.camera_alt,
            size: 50.0,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              Duration(seconds: 1);
              _curve = Curves.linear;
              contH = 50;
              contW = 50;
//
            });
            //This is a timer to show the image after 2 seconds or after the animation
            new Timer(const Duration(seconds: 1),(){
              _getImage();
              setState(() {
                contH = 80.0;
                contW = 80.0;
              });
            });

          },
        ),
      ),

      //This is used for the containing the image
      body: Container(
          alignment:FractionalOffset.center,
          child:iSize < 1 || image == null
              ? new Text(
            "Selected Image Must Be In HD Size",
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )
              : Image.file(
            image,
            fit: BoxFit.cover,
          )),

      //This is the bottom navigation bar which is having a notch shape to display the fab in that notch
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
//        notchMargin: 20.0, //This will increase the margin between notch and the fab
        color: new Color.fromRGBO(0, 188,212 ,1),
//        hasNotch: true,  //This parameter dosn't work more
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),

//      bottomNavigationBar: new Stack(
////        overflow: Overflow.visible,
//        alignment: new FractionalOffset(.5, 1.0),
//        children: [
//          new Container(
//            height: 56.0,
//            color: Colors.blue,
//          ),
//          new Padding(
//            padding: const EdgeInsets.only(bottom: 24.0),
//            child: new FloatingActionButton(
//              onPressed: () => print('hello world'),
//              child: new Icon(Icons.arrow_back),backgroundColor: Colors.redAccent,
//            ),
//          ),
//        ],
//      ),
    );
  }

//  Widget _checkImageSize() {
//
//    if (size >= 1) {
//      return Container(
//              alignment:FractionalOffset.center,
//              child: Image.file(
//                image,
//                fit: BoxFit.cover,
//              ));
//    } else {
//      return Container(
//          alignment:FractionalOffset.center,
//          child: image == null
//              ? new Text(
//            "No Image Selected",
//            textAlign: TextAlign.center,
//            style: new TextStyle(
//                fontSize: 50,
//                fontWeight: FontWeight.bold,
//                color: Colors.blue),
//          )
//              : Image.file(
//            image,
//            fit: BoxFit.cover,
//          ));
//    }

//  }
}
