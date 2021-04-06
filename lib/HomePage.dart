import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  File _img;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value){

      setState(() {

      });

    });
  }


  dectectImage(File image) async{

    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.6,
        imageMean: 117.5,
        imageStd: 117.5
    );
    setState(() {
      _output = output;
      _loading = false;
    });

  }

  loadModel()async{
    await Tflite.loadModel(model:'model_unquant.tflite',labels:'labels.txt');
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  pickImg()async{

    var image = await picker.getImage(source: ImageSource.camera);

    if(image == null){
      setState(() {
        _img = File(image.path);
      });
      return null;
    }

    dectectImage(_img);

  }

  pickGalleryImg()async{

    var image = await picker.getImage(source: ImageSource.gallery);

    if(image == null){
      setState(() {
        _img = File(image.path);
      });
      return null;
    }

    dectectImage(_img);

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            // Text("Farhan's Gallery",style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 5,),
            Text("Cat and Dog Detector",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold ,color: Colors.orange,),),
            SizedBox(height: 50,),
            Center(


              child: _loading ?
              Container(
              width: 350,
              child: Column(
                children: [

                  Image.asset("assets/icon.png",),
                  SizedBox(height: 50,),
                ],


              ),


              ) : Container(

                child: Column(
                  children:<Widget> [
                    Container(
                      height: 250,
                      child:Image.file(_img) ,

                    ),

                    SizedBox(height: 25,),
                    
                    _output != null ? Text('${_output[0]['label']}',style: TextStyle(color: Colors.yellow,fontSize: 15),): Container(),




                  ],



                ),



              )
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      pickImg();
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "Capture a Photo",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      pickGalleryImg();
                    },
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "Select a Photo",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],




        ),



      ),





    );
  }
}
