import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double DH = MediaQuery.of(context).size.height;

    print("height" + DH.toString());
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding:
          false, // this allow to avoid the bottom padding if any in your app.
      appBar: new AppBar(
        title: new Text("Demo App"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),


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


          //For Userfield and Passwordfield and login button main container
          Container(
            alignment: FractionalOffset.topCenter,
            margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
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
            height: 330,
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

                  //For Log In Button
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
                            "LOGIN",
                            style: TextStyle(fontSize: 23),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),


          //For Sign up button

          Container(
            padding: EdgeInsets.fromLTRB(0,100,0,0),
            child:new Row(
              children: <Widget>[
              Container(
                alignment: FractionalOffset.centerLeft,
                margin: EdgeInsets.fromLTRB(0, 250, 0, 0),
                child: new FlatButton(onPressed: (){}, child:
                new Text("Don't have an account? ",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),textColor: Colors.white,)
            ),

            //For Sign up button
            Container(
                alignment: FractionalOffset.centerRight,
                margin: EdgeInsets.fromLTRB(10, 250, 0, 0),
                child: new FlatButton(onPressed: (){}, child:
                new Text("Sign Up",style: new TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),textColor: Colors.white,)
            ),
              ],
            ),
          ),


//          //For sign up button
//          Container(
//            alignment: FractionalOffset.center,
//            margin: EdgeInsets.fromLTRB(0, DH-165, 0, 0),
//            child: new ButtonTheme(
//              minWidth: 360.0,
//              height: 50.0,
//              child: new RaisedButton(
//                onPressed: (){},
//                padding: EdgeInsets.all(17.0),
//                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),
//                    side: new BorderSide(
//                  color: Colors.blue,
//                  width: 2.0
//                )),
//                textColor: Colors.blueAccent,
//                color: Colors.white,child: new Text("SKIP SIGN UP FOR NOW",style: new TextStyle(
//                fontSize: 22,fontWeight: FontWeight.bold
//              ),),),
//            ),
//          )


        ],
      ),
    );
  }
}
