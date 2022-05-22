import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  final _dummyAvatar =
      'https://media.istockphoto.com/vectors/user-icon-flat-isolated-on-white-background-user-symbol-vector-vector-id1300845620?k=20&m=1300845620&s=612x612&w=0&h=f4XTZDAv7NPuZbG0habSpU0sNgECM0X7nbKzTUta3n8=';
  final _dummyImage =
      'https://i2.wp.com/www.kedi9.com/wp-content/uploads/2020/08/scottish.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SUnet')), body: _postListView());
  }

  Widget _postAuthorRow() {
    const double avatarDiameter = 44;
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 2),
                child: CachedNetworkImage(
                  imageUrl: _dummyAvatar,
                  fit: BoxFit.cover,
                ),
              ),
            )),
        Text(
          'UserName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )
      ],
    );
  }

  Widget _postImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: _dummyImage,
      ),
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(
          'post_caption.post_caption.post_caption.post_caption.post_caption.post_caption.post_caption.'),
    );
  }

  Widget _postView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(),
        _postImage(),
        _postLike(),
        _postCaption(),
        _postCommentsButton(),
      ],
    );
  }

  Widget _postLike() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      child: LikeButton(
        mainAxisAlignment: MainAxisAlignment.start,
        size: 25,
      ),
    );
  }

  Widget _postCommentsButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'View Comments',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _postListView() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _postView();
        });
  }
}
