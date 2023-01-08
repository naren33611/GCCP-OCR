import 'dart:io';
import 'package:flutter/services.dart';
import 'api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OCR",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File _image;
  late Uint8List _imageBytes;
  final picker = ImagePicker();
  late String _imageName;
  late CloudApi api;
  bool isUploaded = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/credentials.json').then((json) =>
    api = CloudApi(json)
    );
    _getImage();
  }

  void _getImage() async {
    final pickedfile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if(pickedfile != null) {
        print(pickedfile.path);
        _image = File(pickedfile.path);
        _imageBytes = _image.readAsBytesSync();
        _imageName = _image.path.split('/').last;
        isUploaded = false;
      }
      else {
        print("No image selected");
      }
    });
  }

  void _saveImage() async {
    setState(() {
      loading = true;

    });
    final response = await api.save(_imageName, _imageBytes);
    print(response.downloadLink);
    setState(() {
      loading = false;
      isUploaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OCR"),
      ),
      body: Center(
          child: _imageBytes == null ? const Text('No image selected') :
          Stack(children: [
            Image.memory(_imageBytes),
            if(loading)
              const Center(child: CircularProgressIndicator()),
            if(isUploaded)
              const Center(child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Icon(Icons.check,color: Colors.white,size: 60,),
              ),),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: _saveImage,
                child: const Text("Save to cloud"),
              ),
            )
          ],)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Select Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
