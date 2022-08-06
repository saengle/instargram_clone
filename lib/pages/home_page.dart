import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Instagram Clone',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: _buildBody());
  }

  _buildBody() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'Instagram에 오신 것을 환영합니다',
                    style: TextStyle(fontSize: 24),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Text('사진과 동영상을 보려면 팔로우하세요'),
                  Padding(padding: EdgeInsets.all(16.0)),
                  SizedBox(
                    width: 260,
                    child: Card(
                      elevation: 4,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 80, height: 80,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage('https://img.vogue.co.kr/vogue/2022/05/style_627a16c2b312b.jpeg'),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Text('이메일주소', style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('김태리'),
                          Padding(padding: EdgeInsets.all(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(width: 80, height:80, child: Image.network('https://img.vogue.co.kr/vogue/2022/05/style_627a1704d56c2.jpeg', fit: BoxFit.cover,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(width: 80, height:80, child: Image.network('https://pbs.twimg.com/media/EajGbIgVcAMObVC?format=jpg&name=medium', fit: BoxFit.cover,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: SizedBox(width: 80, height:80, child: Image.network('https://thumb.mt.co.kr/06/2022/01/2022011709144144793_3.jpg/dims/optimize/', fit: BoxFit.cover,)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Facebook 친구'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4,0,4,4),
                            child: ElevatedButton(onPressed: () {}, child: Text('팔로우',)
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
