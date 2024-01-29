import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:jli_frontend/ui/card_row.dart';
import 'package:jli_frontend/ui/connect_page.dart';
import 'package:jli_frontend/ui/legal_aid.dart';
import 'package:jli_frontend/ui/legal_info.dart';
import 'package:jli_frontend/ui/profile_page.dart';
import 'package:jli_frontend/ui/rehab_page.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: Container(
        height: 70,
        width: 100,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(254, 182, 161, 149),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.white,
                ),
                Text(
                  "Events",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              // height: 300,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                    child: Text("How to use?",style: GoogleFonts.lato(fontSize: 25),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FinalHomeScreenCard(),
                          FinalHomeScreenCard(),
                          FinalHomeScreenCard(),
                          FinalHomeScreenCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: const Color(0xFFD8B4A0),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: SizedBox(
                          width: 182,
                          height: 188,
                          child: Column(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Govt Registration and Services",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.lato(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 100,
                                width: 180,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/card-image-5.png"),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Color(0xffa0806c),
                        child: Container(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/card-image-6.png"),
                                            fit: BoxFit.cover)),
                                  )),
                              Text(
                                "Legal Help Centre",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "powered by Gemini",
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontStyle: FontStyle.italic),
                                textAlign: TextAlign.end,
                              )
                            ],
                          ),
                          width: 200,
                          height: 188,
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      )
                    ],
                  ),
                  Card(
                    color: Color(0xFFD8B4A0),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)),
                    child: Container(
                      width: 390,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.folder_copy_outlined,
                            color: Colors.black,
                            size: 50,
                          ),
                          Text(
                            "Other Legal Resources",
                            style: GoogleFonts.lato(
                                fontSize: 25, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                fallbackWidth: 390,
                fallbackHeight: 300,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeScreenCard extends StatelessWidget {
  HomeScreenCard({super.key, required this.image, required this.onImageWidget});

  final AssetImage image;
  final Widget onImageWidget;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.transparent,
      // Set card color to transparent
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 155,
            decoration: BoxDecoration(
              image: DecorationImage(image: image, fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          onImageWidget,
        ],
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
    );
  }
}

class FinalHomeScreenCard extends StatelessWidget {
  const FinalHomeScreenCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // color: Colors.black26,
      child: Container(
        height: 200,
        width: 175,
        decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
