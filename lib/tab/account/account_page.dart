import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../detail_post/detail_post_page.dart';
import '../../domain/post.dart';
import 'account_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AccountModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Page'),
        actions: [
          IconButton(
              onPressed: () {
                model.logout();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(model.getProfileImageUrl()),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: const Icon(Icons.add),
                            ),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      '윈터',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Text('3', style: TextStyle(fontSize: 18)),
                    Text('게시물', style: TextStyle(fontSize: 18))
                  ],
                ),
                Column(
                  children: const [
                    Text('0', style: TextStyle(fontSize: 18)),
                    Text('팔로워', style: TextStyle(fontSize: 18))
                  ],
                ),
                Column(
                  children: const [
                    Text('0', style: TextStyle(fontSize: 18)),
                    Text('팔로잉', style: TextStyle(fontSize: 18))
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: StreamBuilder<QuerySnapshot<Post>>(
                    stream: model.myPostsStreamOnly,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('알 수 없는 에러');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Post> posts =
                          snapshot.data!.docs.map((e) => e.data()).toList();

                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                        ),
                        itemCount: posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final post = posts[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPostPage(
                                      post: post,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                  tag: post.id,
                                  child: Image.network(post.imageUrl,
                                      fit: BoxFit.cover)));
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
