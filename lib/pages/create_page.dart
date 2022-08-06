import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: _getImage(),
          child: Icon(Icons.add_a_photo)),
    );
  }

  _buildAppBar() {
    return AppBar(
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.send))],
    );
  }

  _buildBody() {
    return Column(
      children: [
        Text('No Images'),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요'),
          controller: textEditingController,
        )
      ],
    );
  }

  _getImage() async {
    Future image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
    _image = image;
    });
  }
}
