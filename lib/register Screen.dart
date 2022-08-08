import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String foto1 = '';
  bool _passHide = true;
  final emailControl = TextEditingController();
  final passControl = TextEditingController();
  final passControl2 = TextEditingController();
  final fullName = TextEditingController();
  final address = TextEditingController();

  File? _image;
  final imgPicker = ImagePicker();

  void _password() {
    setState(() {
      _passHide = !_passHide;
    });
  }

  void openGallery() async {
    Navigator.of(context).pop();
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (imgGallery != null) {
        _image = File(imgGallery.path);
        //foto = true;
      }
    });
  }

  void openCamera() async {
    Navigator.of(context).pop();
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (imgCamera != null) {
        _image = File(imgCamera.path);
        //foto = true;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(children: [
        Stack(children: [
        Column(children: [
        Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
            color: Colors.blue),
        alignment: Alignment.bottomLeft,
        child: Padding(padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          child:Text(
            'Register',
            style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ), ),
          Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                child: formRegister(),
              )),
        ]),
          Positioned(top: 10, right: 10, width: 35, height: 35, child: circle()),
          Positioned(top: 55, right: 55, width: 75, height: 75, child: circle()),
         ]),
    ])));
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

  Widget formRegister() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 10),
          child: Stack(
            children: [
              Container( padding: EdgeInsets.all(10),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: InkWell(
                  onTap: () {
                    showOptionDialog(context);
                  },
                  child:
                  _image == null
                      ?  Icon(Icons.image)
                      :CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                    FileImage(
                    _image!,
                    ),
                    backgroundColor: Colors.transparent,
                  )
                )
              ),
              Positioned(bottom:0, right: 0, width: 35, height: 35, child: CircleAvatar(child: Text("+",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),))
            ],
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: fullName,
          decoration: InputDecoration(
            labelText: 'Full Name',
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
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: emailControl,
          decoration: InputDecoration(
            labelText: 'Username',
            icon: Icon(Icons.alternate_email),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue, width: 2)),
          ),
        ),
        SizedBox(
          height: 10,
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
        SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: passControl2,
          obscureText: _passHide,
          decoration: InputDecoration(
            labelText: 'Repeat Password',
            icon: Icon(Icons.lock),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue, width: 2)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: address,
          decoration: InputDecoration(
            labelText: 'Address',
            icon: Icon(Icons.home_filled),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue, width: 2)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RaisedButton(
          color: Colors.blue,
          onPressed: () {
          },
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  void showOptionDialog(BuildContext context) async{
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pilihan"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Ambil Gambar"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Ambil Gambar dari Galeri"),
                    onTap: () {
                      openGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}


