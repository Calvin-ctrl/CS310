import 'package:flutter/material.dart';
import 'package:recitation/models/posts.dart';
import 'package:recitation/routes/UI/post_card.dart';

class ProfileView extends StatefulWidget {
   ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<Post> posts = [
    Post(text: 'Petition to save Sabanci students from academic stress',date: 'March 31', likes: 6 , comments: 0),
    Post(text: 'Anyone who is down for a Fifa match hit me up',date: 'March 23', likes: 31 , comments: 4),

    Post(text: 'Lets go partyyyy this weekend!!!!!',date: 'March 3', likes: 40 , comments: 12,),
    Post(text: 'Football match at 9 we need  2 players',date: 'March 3', likes: 40 , comments: 12),
    Post(text: 'Happy New years everyone',date: 'March 3', likes: 40 , comments: 12),


  ];
  int postCount = 0;

  
  void IncrementComments(Post post)
  {
    setState(() {
      post.comments++;
    });
  }
  void IncrementLikes(Post post)
  {
    setState(() {
      post.likes++;
    });

  }
  void deletePost(Post post)
  {
    setState(() {
      posts.remove(post);
      if(postCount != 0)
        postCount=postCount-1;
    });


  }
  void buttonClicked()
  {
    setState(() {
      postCount++;
    });

   // print('Button Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Center(child:
        Text(
            "FormulaOne",
            style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
        )),
        backgroundColor: Colors.blue,
        elevation: 30,

      ),



      body:SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: ClipOval(
                          child:Image.network('https://arabam-blog.mncdn.com/wp-content/uploads/2022/02/f1-75-1-1.jpg'),
                        ),
                        radius:60,
                      ),

                    ),




                  ],
                ),
               // const Divider(
               //   color: Colors.pink,
               //   thickness: 2.0,
               //   height:10,
                  // ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child:  Text(
                          '345',
                          style: TextStyle(fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        'Posts',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),


                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child:  Text(
                          '800',
                          style: TextStyle(fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),


                  Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child:  Text(
                          '905',
                          style: TextStyle(fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        'Following',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                  ],
                ),








                const Divider(
                  color: Colors.blue,
                  thickness: 2.0,
                  height:20,
                ),
                Column(
                  children: posts.map((post) => Postcard(
                      post: post,
                      delete: (){
                        deletePost(post);
                      },
                      IncrementLike: (){
                        IncrementLikes(post);
                      },
                      IncrementComments: (){
                        IncrementComments(post);
                      },
                  )).toList(),
                  ),
                ],

            ),
          ),
        ),
      ),
    );
  }
}
