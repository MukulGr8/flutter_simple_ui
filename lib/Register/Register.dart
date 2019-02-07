import 'package:flutter/material.dart';
import 'package:flutter_new/Login/Login.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double DH = MediaQuery.of(context).size.height;

    print("height" + DH.toString());
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding:
      false, // this allow to avoid the bottom padding if any in your app.
      appBar: new AppBar(
        title: new Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),

      //Stack for widget on another widget
      body: new Stack(
        alignment: FractionalOffset.topCenter,
        children: <Widget>[
          //For image
          Opacity(
              opacity: 0.8,
              child: new Image.asset(
                "images/crops.jpg",
                height: 1200,
                width: 600,
                fit: BoxFit.fill,
              )),


          //For Userfield and Passwordfield and Confirm Password field main container
          Container(
            alignment: FractionalOffset.topCenter,
            margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
            decoration: BoxDecoration(
              //for applying shadows to the box
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow
                  offset: Offset(
                    8.0, // horizontal, move right 10
                    10.0, // vertical, move down 10
                  ),
                )
              ],
              color: Colors.white,
              borderRadius: new BorderRadius.circular(15.0),),
            height: 400,
            width: 350,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  //For UserField
                  new Container(
                      alignment: FractionalOffset.center,
                      width: 300,
                      child: new TextField(
//                        autofocus: true,
                        controller: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green),
                          labelText: "Username",
                          hintText: 'Enter Username',
                          prefixIcon: new Icon(Icons.person),
                        ),
                        style: new TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.redAccent,
                            fontSize: 20),
                      )),


                  //For Password field
                  new Container(
                      alignment: FractionalOffset.center,
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      width: 300,
                      child: new TextField(
                        controller: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                                width: 2.0,
                                color: Colors.blue
                            ),
                          ),

//                        fillColor: Colors.green),,
                          labelText: "Password",
                          hintText: 'Enter Password',
                          prefixIcon: new Icon(Icons.lock),
                        ),
                        style: new TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.redAccent,
                            fontFamily: "Poppins",
                            fontSize: 20),
                      )),

                  //For Confirm Password field
                  new Container(
                      alignment: FractionalOffset.center,
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                      width: 300,
                      child: new TextField(
                        controller: null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                                width: 2.0,
                                color: Colors.blue
                            ),
                          ),

//                        fillColor: Colors.green),,
                          labelText: "Confirm Password",
                          hintText: 'Confirm Password',
                          prefixIcon: new Icon(Icons.lock),
                        ),
                        style: new TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.redAccent,
                            fontFamily: "Poppins",
                            fontSize: 20),
                      )),

                  //For Sign Up Button
                  Container(
                    alignment: FractionalOffset.center,
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: ButtonTheme(
                      minWidth: 200.0,
                      height: 45.0,
                      child: new RaisedButton(
                          onPressed: () => print(""),
                          padding: EdgeInsets.all(14.0),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: new Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 23),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),


          //Container for containing a row in it which contains two more container in it
          //and those container contains their respective child's.
          Container(
            padding: EdgeInsets.fromLTRB(0,170,0,0),
            child:new Row(
              children: <Widget>[
                Container(
                    alignment: FractionalOffset.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
                    child: new FlatButton(onPressed: (){}, child:
                    new Text("Already have an account?",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),textColor: Colors.white,)
                ),

                //For Sign up button
                Container(
                    alignment: FractionalOffset.centerRight,
                    margin: EdgeInsets.fromLTRB(10, 250, 0, 0),
                    child: new FlatButton(onPressed: (){_loginScreen(context);}, child:
                    new Text("Sign In",style: new TextStyle(
                        fontSize: 22,fontWeight: FontWeight.bold),),textColor: Colors.white,)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _loginScreen(BuildContext context) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new Login()));
  }
}
