import'package:flutter/material.dart';
import 'package:recitation/models/posts.dart';
class Postcard extends StatelessWidget {

  final Post post;
  final VoidCallback delete;
  final VoidCallback IncrementLike;
  final VoidCallback IncrementComments;
  Postcard({required this.post,required this.delete, required this.IncrementLike, required this.IncrementComments});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.fromLTRB(0,0,0,0),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              post.text,
              style:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )
            ),
            const SizedBox(width: 300),
            Image.network('https://arabam-blog.mncdn.com/wp-content/uploads/2022/02/f1-75-1-1.jpg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(post.date
                ,style: TextStyle(
                      fontSize: 14,
                      fontWeight:FontWeight.w300,

                  ),

                ),
                const Spacer(),
               // const SizedBox(width: 8),
                IconButton(onPressed: IncrementLike, icon: Icon(Icons.thumb_up,size:18,color: Colors.green)),

                Text(
                  post.likes.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight:FontWeight.w300
                  ),

                //  Image.network(post.photo),

                ),
             //   Spacer(flex:1),
                  const SizedBox(width: 8),
                IconButton(onPressed: IncrementComments, icon: Icon(Icons.comment,size:18,color: Colors.blue)),
                Text(
                  post.comments.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight:FontWeight.w300
                  ),

                ),
              //  Spacer(flex:1),
                IconButton(onPressed: delete, icon: Icon(Icons.delete,size:14,color: Colors.red))
              ],

            ),
          ],

        ),

      ),
    );
  }
}
