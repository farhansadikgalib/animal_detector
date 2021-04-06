import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            // Text("Farhan's Gallery",style: TextStyle(fontSize: 20,color: Colors.white),),
            SizedBox(height: 5,),
            Text("Cat and Dog Detector",style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold ,color: Colors.orange)),
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


              ) : Container()
            ),



        Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              GestureDetector(
                onTap: (){},
                  child: Container(
                    height: 40,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                decoration: BoxDecoration(

                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(7),
                ),
                  child: Text("Capture a Photo",style: TextStyle(color: Colors.white),

                ),







              ),



              ),

              SizedBox(width: 10,),

              GestureDetector(
                onTap: (){},
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                  decoration: BoxDecoration(

                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text("Select a Photo",style: TextStyle(color: Colors.white),

                  ),







                ),



              )





            ],



          ),



        ),

        SizedBox(height: 10,)







          ],




        ),



      ),





    );
  }
}
