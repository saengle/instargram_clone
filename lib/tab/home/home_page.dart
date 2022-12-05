import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text('Instagram에 오신것을 환영합니다'),
            const SizedBox(height: 20),
            const Text('사진과 동영상을 보려면 팔로우하세요'),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://img.hankyung.com/photo/202203/01.29461103.1.jpg'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('taeri@test.com'),
                    const SizedBox(height: 8),
                    const Text('닉네임'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://www.city.kr/files/attach/images/238/298/170/028/81561c9a8de9ed058ddbbfe5d2138bc9.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4),
                        Image.network(
                          'https://img.extmovie.com/files/attach/images/135/875/790/057/1a21518d9c95758d6a410ea86856f9d6.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4),
                        Image.network(
                          'https://img.vogue.co.kr/vogue/2020/06/style_5ef15e0250110-1117x1400.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const Text('Facebook 친구'),
                    ElevatedButton(onPressed: () {}, child: const Text('팔로우'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
