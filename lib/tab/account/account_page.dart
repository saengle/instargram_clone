import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Page'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://cdn.ggilbo.com/news/photo/202208/926599_758569_2224.jpg'),
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
