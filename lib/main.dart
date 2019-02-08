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
  File image;
  int mS=0;
  int iSize=0;

  String defPath = "images/crops.jpg";

//  To pick Image
  _getImage() async {
    print('Picker is called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    mS= await img.length();
    double oS = mS/1000000;
//    mS.then((values) {
//      // Code that doesn't use the `_` parameter...
//      print("Size of the image > "+(values/1000000).toString());
//      var hmm = values/1000000;
//      setState(() {
//        print("orignal size is "+hmm.toString());
//        if(hmm <= 1){
//          widget.ok = false;
//        }
//      });
//    });
//    File img = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (img != null) {
      image = img;
      iSize = oS.toInt();
    }
    setState(() {
      image = img;
      iSize = oS.toInt();
    });
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
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.cyan,
          child: const Icon(
            Icons.camera_alt,
            size: 50.0,
            color: Colors.white,
          ),
          onPressed: () {
            _getImage();
          },
        ),
      ),

      //This is used for the containing the image
      body: Container(
          alignment:FractionalOffset.center,
          child: image == null && iSize <= 1
              ? new Text(
            "No Image Selected",
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          )
              : Image.file(
            image,
            fit: BoxFit.cover,
          )),

      //This is the bottom navigation bar which is having a notch shape to display the fab
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
