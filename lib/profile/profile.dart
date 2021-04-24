
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {

  _cameraAppState createState() => _cameraAppState();

}


class _cameraAppState extends State<ProfilePage>{

  File imageFile;


  _openGallery(BuildContext context) async{
    var picture =  await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async{
    var picture =  await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiseDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("upload"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              /* GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery(context);
                },
              ),*/

              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
              ),

            ],
          ),
        ),
      );
    });
  }


  Widget _decideImageView(){

    if(imageFile == null)
    {
      return Text(
          "IMAGE"
      );
    }
    else
    {
       return Image.file(imageFile,
        width: 400,
        height: 400,);
    }
  }
Future getImage() async{
    var tempImage = await ImagePicker.pickImage(source: Image.camera);
}

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Rescuing the world"),
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(
                color: Colors.pinkAccent,
                onPressed: getImage,
                tooltip: 'Add Image' ,
                child: new Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }



}
