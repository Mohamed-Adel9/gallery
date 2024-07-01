import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_gallery_app/components/my_text_form_field.dart';
import 'package:my_gallery_app/core/app_asset.dart';
import 'package:my_gallery_app/screens/home_screen.dart';
import 'package:my_gallery_app/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isTapped = false ;
  String token = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 205, 255, 1),
      body: Stack(
        alignment: Alignment.center,
        // hold backGround and ForeGround Items
        children: [
          //backGround Items
          Stack(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(AppAsset.bgEllipse, fit: BoxFit.cover),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            Colors.white10.withOpacity(.01),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 130),
                    child: Image.asset(AppAsset.loveIc),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .4,
                      ),
                      child: Image.asset(
                        AppAsset.bgIcons,
                        width: MediaQuery.of(context).size.width * .9,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

          //foreGround Items

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "My",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(74, 74, 74, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.height * .4,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: 6.0, sigmaY: 6.0), // Adjust blur intensity
                          child: Form(
                            key: _formKey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "LOG IN",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(74, 74, 74, 1),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  MyTextFormField(
                                    emailController: emailController,
                                    hintText: "User Name",
                                    validationText: "User Name can't be Empty",
                                    inputType: TextInputType.emailAddress,
                                  ),
                                  MyTextFormField(
                                    emailController: passwordController,
                                    hintText: "Password",
                                    validationText: "Password can't be Empty",
                                    inputType: TextInputType.visiblePassword,
                                  ),
                                  Container(
                                    height: 46,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade300,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: isTapped ? const Center(child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )) : TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isTapped = true ;
                                        });
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();

                                          LoginServices()
                                              .userLogin(emailController.text,
                                              passwordController.text)
                                              .then((value) {
                                            Navigator.of(context)
                                                .pushReplacement(MaterialPageRoute(
                                              builder: (context) {
                                                return const HomeScreen();
                                              },
                                            ));
                                          });
                                        }
                                      },
                                      child: const Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
