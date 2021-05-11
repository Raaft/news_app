import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Log IN"),
        ),
        body: (isLoading) ? _drawIsLoading() : _drawLogIn());
  }

  Widget _drawLogIn() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Email"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Email";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Password"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter Password";
                  }
                  return null;
                },
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    //api auth
                    setState(() {
                      isLoading = true;
                    });
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Text("LogIn"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawIsLoading() {
    return Container(
      child: Center(child: CircleAvatar()),
    );
  }
}
