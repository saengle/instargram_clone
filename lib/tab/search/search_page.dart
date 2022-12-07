import 'package:flutter/material.dart';
import 'package:instargram_clone/create/create_page.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  final List<String> _urls = const [
    'https://www.city.kr/files/attach/images/238/298/170/028/81561c9a8de9ed058ddbbfe5d2138bc9.jpg',
    'https://img.extmovie.com/files/attach/images/135/875/790/057/1a21518d9c95758d6a410ea86856f9d6.jpg',
    'http://cdn.ggilbo.com/news/photo/202208/926599_758569_2224.jpg',
    'https://img.vogue.co.kr/vogue/2020/06/style_5ef15e0250110-1117x1400.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreatePage()),
            );
          }),
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 1.0, crossAxisSpacing: 1.0),
          itemCount: _urls.length,
          itemBuilder: (BuildContext context, int index) {
            final url = _urls[index];
            return Image.network(url, fit: BoxFit.cover);
          },
        ),
      ),
    );
  }
}
