import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:my_gallery_app/core/app_asset.dart';
import 'package:my_gallery_app/screens/login_screen.dart';
import 'package:my_gallery_app/services/home_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool uploadTapped = false ;
  bool dataCame = false ;
  List ? images ;


  getGalleryData() async{

   images = await HomeServices().getMyGallery("eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2VlNjdlMWY4NDg1ZGFmZTM2NjQzNDQwZTZkYmQ5ODc4MzEzOGRlNmI2NDM4NzhmNzI3NmEzN2MxZjQ2MzdlYzUyYmE2YmYyNTZjYTM3YWYiLCJpYXQiOjE3MTI1OTkyNDIuNjc3NzYyLCJuYmYiOjE3MTI1OTkyNDIuNjc3NzYzLCJleHAiOjE3NDQxMzUyNDIuNjc0NTY0LCJzdWIiOiIzMDkiLCJzY29wZXMiOltdfQ.mezBBoO45wfEQkIk2iJa_XwsBg_aL75R7CkQM0n0WUC31XCQrcPVpFiUrTC6hC1rR9weyEwQhgUecVHmNDKqqgdjJIYsqbkeleJZmaTq2Zz2M5XlL5502jySMmwjmnI8LKk-kFTLTQc6VCSHtU_uoK9b0G5Us1bazgN9YuOTTb-UhtvtPWXCwX5a8Oux1Amh8SaIk34-7kloAi59CuQqoTn4vTwmNoGgFvHfxuKrmPBrfqIv3VsNmN0qc5vWub6eh5kkPWcUGyYdeUmPs3E5dlJctfG8ht9DUqtTWlp2VM7KglQ3vaNAXlKnASjwyPF7BT8cP5aj5CXLJm3jfgcGAIHhyoPHaM-wSn2urmdkTlgllSsInqtP3Ofgb6ObxcbbLfbNFbpBJG9__XVeCvyocUOO9bkR8ERC8q7tgU9UguvpdCFu_wHKY-hchf_3jSekSbBG_ri2xV5rNyJBTjgs4yNNSuxmlcAY318LhDh-ErR6gnIP49i6NtYqh1ki7Wd_1E4MWiEfEMZx-d80WL8GbnraZv1db6OJvGoctqB7fsxVEPINBPtwDULD9EuIXr1eqt0PbFWEr37-KW4SsOGsaAosTXtxqgmbXiNQCGFMFmFLG4B5P3oWEWvrqx49Q7U7ntx58IaCqI328eqWEmih4_C4Uz_CSgkpd97eJ4fg4kI");
   setState(() {
     dataCame = true ;
   });
   print(images);
  }

  @override
  void initState() {
    getGalleryData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(221, 205, 255, 1),
          body: Stack(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    AppAsset.bgEllipse,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    "assets/images/home/Vector.png",
                    fit: BoxFit.fill,
                    color: Colors.white.withOpacity(.6),
                  )),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 13.0),
                  child: CircleAvatar(
                    radius: 33,
                    child: Image.asset("assets/images/home/Ellipse 1641.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0,top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(74, 74, 74, 1),
                      ),
                    ),
                    const Text(
                      "Mina",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(74, 74, 74, 1),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * .35,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/home/logout.png",
                                  height: 28,
                                ),
                                const Text(
                                  "log out",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            uploadTapped ?  null : showUploadOverlay(context);
                            setState(() {
                              uploadTapped=true;
                            });

                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * .35,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  "assets/images/home/upload.png",
                                  height: 28,
                                ),
                                const Text(
                                  "upload",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),

                    Expanded(
                      child: ConditionalBuilder(
                        condition: dataCame,
                        builder: (context) => GridView.count(
                          crossAxisCount: 3, // Number of columns
                          children: List.generate(images!.length, (index) {
                            return Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              margin: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Image.network(images![index],fit: BoxFit.fill,),
                            );
                          }),
                        ),
                        fallback: (context) => const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void showUploadOverlay(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 150,
        left: 0,
        right: 0,
        bottom: 0,
        child: GestureDetector(
          onTap: (){
            overlayEntry?.remove();
            setState(() {
              uploadTapped=false;
            });
          },
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width*.8,
              height: MediaQuery.of(context).size.height*.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white.withOpacity(.5),

              ),
              child:ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity
                  child:  Center(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*.5,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(239, 216, 249, 1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/upload/gallery.png"),
                              const Text("Gallery",style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(74, 74, 74, 1)
                              ),)
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*.5,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(235, 246, 255, 1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/upload/camera.png"),
                              const Text("Camera",style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(74, 74, 74, 1)
                              ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry);
  }

}
