import 'package:flutter/material.dart';
import 'package:login_ipnet/register%20Screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passHide = true;

  //controller
  final usernameControl = TextEditingController();
  final passControl = TextEditingController();

  //hiding pass
  void _password() {
    setState(() {
      _passHide = !_passHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
              child: Stack(children: [
                Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(100),
                        ),
                        color: Colors.blue),
                    alignment: Alignment.bottomLeft,
                    child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      child:Text(
                        'Login',
                        style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ), ),

                  Container(
                    margin: EdgeInsets.all(20),
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          child: formSignIn(),
                          //formSignIn(),
                        )),
                  ),
                ]),
                Positioned(top: 10, right: 10, width: 35, height: 35, child: circle()),
                Positioned(top: 55, right: 55, width: 75, height: 75, child: circle()),
                Positioned(
                    top: 125, right: 125, width: 100, height: 100, child: circle()),
              ]),
            )));
  }

  Widget formSignIn() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          controller: usernameControl,
          decoration: InputDecoration(
            labelText: 'Username',
            icon: Icon(Icons.person),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue, width: 2)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          obscureText: _passHide,
          controller: passControl,
          decoration: InputDecoration(
            labelText: 'Password',
            icon: Icon(Icons.lock),
            suffixIcon: GestureDetector(
              child: Icon(
                _passHide ? Icons.visibility_off : Icons.visibility,
                color: _passHide ? Colors.grey : Colors.blue,
              ),
              onTap: () {
                _password();
              },
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue, width: 2)),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          style:
          ElevatedButton.styleFrom(primary: Colors.blue),
          onPressed: () {
            print("login");
          },
          //color: Colors.blue,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            },
            child: Text("Don't have an accout? Register!",
                style: TextStyle(color: Colors.blue)))
      ],
    );
  }

  Widget circle() {
    return Container(
        height: 50,
        width: 50,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
        ));
  }
}

