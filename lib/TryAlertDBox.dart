import 'package:flutter/material.dart';

class TryAlertDBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //This is used to call the future things or methods which depend on future
    //Here the method _onTapImage(context) depends upon future becuase it returns a dialog.
    Future.delayed(Duration.zero, () => _onTapImage(context));
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Alert DBOx"),
      ),

      body: new Stack(
        children: <Widget>[
          Opacity(
              opacity: 1.0,
              child: new Image.asset(
                "images/crops.jpg",
                height: 1200,
                width: 600,
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }

  //This method is called in the begining of the activity or screen
  //and so it will return the dialog which is alertdialog
  _onTapImage(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {

        return AlertDialog(
          //This is the dialog box header
          title: null,
          //Shape of our dialog box
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
          //What dialog box will contain
          content: Container(
            alignment: FractionalOffset.topCenter,
            height: 300,
            width: 350,
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
                    padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    width: 300,
                    child: new TextField(
                      controller: null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              new BorderSide(width: 2.0, color: Colors.blue),
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
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    height: 45.0,
                    child: new RaisedButton(
                        onPressed: () => print(""),
                        padding: EdgeInsets.all(14.0),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        textColor: Colors.white,
                        color: Colors.cyan,
                        child: new Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 23),
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
