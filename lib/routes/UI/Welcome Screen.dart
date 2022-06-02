import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recitation/routes/Login.dart';
import 'package:recitation/routes/Registertion.dart';
import 'FeedView.dart';

//https://adtechresources.com/wp-content/uploads/2020/02/Mobile-Application.jpeg
void main() {
  runApp(MaterialApp(
      home:Homeview()
  ));
}
int pageNum = 1;



class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}


class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('SUNET')),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.grey,
      ),

      body:
      Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [




          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Welcome to ', style: TextStyle(fontSize: 30,color: Colors.black)),
          ),

          Padding(padding: EdgeInsets.all(10.0),
              child: Center(child: Text(' SUNET ', style: TextStyle(fontSize: 30,color: Colors.blue)))
          ),



          CircleAvatar(
            child: ClipOval(
              child:Image.network('https://adtechresources.com/wp-content/uploads/2020/02/Mobile-Application.jpeg',),
            ),
            radius: 150,
            backgroundColor: Colors.white70,
          ),

          Padding(padding: EdgeInsets.all(10.0),
              child: Center(child: Text('Start connecting with university students', style: TextStyle(fontSize: 17)))


          ),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(onPressed: ()
                {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen(),
                    ),
                  );
                },
                    child: Text('Login')),
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,20,0),
                child: ElevatedButton(onPressed: (){

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegisterPage(),
                    ),
                  );



                }, child: Text('Sign up')),
              ),

            ],
          )



        ],
      ),



    );
  }
}

