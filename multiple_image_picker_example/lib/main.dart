import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_image_picker_example/viewmodel/image_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),

      minTextAdapt: true, // 너비와 높이의 최소값에 따라 텍스트를 조정할 지 여부 판단

        builder: (context, child) => MaterialApp(
            builder: (context, child) {
              return MediaQuery(
                //화면마다 각각 다르게 css를 주는 함수
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!, // child는 null이 아님을 해서 에러 방지 해둠.
              );
            },
            theme: ThemeData(
                fontFamily:
                'Pretendard'), //전체 테마 폰트를 설정해뒀음. 변경하고 싶으면 Theme.of().textTheme 사용하면 됨
            debugShowCheckedModeBanner: true, //Debug 모양 나오는거 없애기
            home: const MyApp(), //home을 실행할때 로딩창으로 띄움
            ),
    ),

  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => ImageViewModel(),
          )
        ],
        child: Scaffold(
          appBar: AppBar(),
          body: MainScreen()
        ),
      ),
    );
  }
}


class MainScreen extends StatefulWidget {



  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ImageViewModel imageViewModel;
  String? imagePath = null;


  @override
  Widget build(BuildContext context) {
    imageViewModel = Provider.of<ImageViewModel>(context);
    if(imageViewModel.images.length < 1) {
      imageViewModel.addImage(ImageAddIcon());
    }
    return Container(
      height: 100.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: imageViewModel.images
      ),
    );
  }
}

/*
TextButton(onPressed: () async{
XFile? imageFile = await ImagePicker().pickImage(source : ImageSource.gallery);
imagePath = imageFile!.path;
setState(() {

});
}, child: Text("select image")),
*/

class ImageAddIcon extends StatelessWidget {
  late ImageViewModel imageViewModel;

  @override
  Widget build(BuildContext context) {
    imageViewModel = Provider.of<ImageViewModel>(context);
    return Container(
      width: 68.w,
      height: 68.w,
      margin: EdgeInsets.only(top: 16, left: 16, bottom: 16),
      child: IconButton(
        onPressed: () async {
          XFile? imageFile = await ImagePicker().pickImage(source : ImageSource.gallery);
          var newItem = await ImageTile(imageFile!, imageViewModel.images.length);
          imageViewModel.addImage(newItem);
          print("image added");
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}



class ImageTile extends StatelessWidget {
  XFile imageFile;
  int index;
  ImageTile(this.imageFile, this.index);

  late ImageViewModel imageViewModel;

  @override
  Widget build(BuildContext context) {
    imageViewModel = Provider.of<ImageViewModel>(context);
    return Container(
      width: 68.w,
      height: 68.w,
      margin: EdgeInsets.only(top: 16, left: 16, bottom: 16),
      child: Stack(
        children: [
          Container(
            width: 68.w,
            height: 68.w,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.file(
                File(imageFile.path),
                fit: BoxFit.fill,

              ),
            )
          ),


          Positioned(
              right: 4,
              top: 4,
              width: 20.w,
              height: 20.h,
              child: InkWell(
                onTap: (){
                  imageViewModel.removeImage(index);
                },
                child: SvgPicture.asset('assets/iconx.svg'),
              )
          )
        ],
      ),
    );
  }
}



