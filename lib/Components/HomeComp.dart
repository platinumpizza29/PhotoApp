// ignore_for_file: unused_local_variable, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:photoapp/Pages/ImageDetails.dart';

class HomeComp extends StatefulWidget {
  const HomeComp({super.key});

  @override
  State<HomeComp> createState() => _HomeCompState();
}

class _HomeCompState extends State<HomeComp> {
  List<dynamic> allImages = [];

  @override
  void initState() {
    getAllImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          // Provider.of<User>(context).user["userName"],
          "keyur",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 27),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(LineIcons.bell)),
          IconButton(
              onPressed: () {
                handleActionSheet();
              },
              icon: Icon(LineIcons.plus))
        ],
      ),
      body: RefreshIndicator(
          onRefresh: () => getAllImages(),
          child: ListView.builder(
              itemCount: allImages.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ImageDetails(
                                  image: allImages[index],
                                  // user: Provider.of<User>(context).user,
                                  user: "Keyur",
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          allImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              })),
    );
  }

  void handleActionSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              title: Text(
                "Options",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              cancelButton: CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(
                      color: CupertinoColors.destructiveRed),
                ),
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {
                    handleImagePicker(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  child: Text('Device', style: GoogleFonts.poppins()),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    handleImageCapture(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Camera',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ));
  }

  Future<void> handleImagePicker(ImageSource source) async {
    var imagePicker = ImagePicker();
    final pickedFile =
        await imagePicker.pickImage(source: source, requestFullMetadata: true);
    if (pickedFile != null) {
      var img = await _cropImage(imageFile: pickedFile);
      var userId = 105.toString();
      var uri = dotenv.env["SERVER_URI"];
      FormData formData = FormData.fromMap({
        "userId": userId,
        "imageFile": await MultipartFile.fromFile(img!.path, filename: img.name)
      });
      var response = await Dio().post(uri!, data: formData);
      print(response);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: CupertinoColors.activeGreen,
          content: Text(
            response.toString(),
            style: GoogleFonts.poppins(),
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("No Image Selected or Clicked!", style: GoogleFonts.poppins()),
        backgroundColor: CupertinoColors.destructiveRed,
      ));
    }
  }

  Future<XFile?> _cropImage({required XFile imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return XFile(croppedImage.path);
  }

  Future<void> handleImageCapture(ImageSource source) async {
    var imagePicker = ImagePicker();
    final pickedFile =
        await imagePicker.pickImage(source: source, requestFullMetadata: true);
    if (pickedFile != null) {
      var img = await _cropImage(imageFile: pickedFile);
      var userId = 105.toString();
      var uri = dotenv.env["SERVER_URI"];
      FormData formData = FormData.fromMap({
        "userId": userId,
        "imageFile": await MultipartFile.fromFile(img!.path, filename: img.name)
      });
      var response = await Dio().post(uri!, data: formData);
      print(response);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: CupertinoColors.activeGreen,
          content: Text(
            response.toString(),
            style: GoogleFonts.poppins(),
          )));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("No Image Selected or Clicked!", style: GoogleFonts.poppins()),
        backgroundColor: CupertinoColors.destructiveRed,
      ));
    }
  }

  getAllImages() async {
    var uri = dotenv.env["GET_ALL_IMAGES"];
    Response response = await Dio().get(uri!);
    List<dynamic> responseList = response.data;
    setState(() {
      allImages = responseList.reversed.toList();
    });
  }
}
