import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jli_frontend/api/gemini_api.dart';
import 'package:jli_frontend/ui/screens/home/prisoners/find_lawyers_screen.dart';
import 'package:jli_frontend/ui/widgets/chat_bot_message_card.dart';
import 'dart:async';
import '../../../../models/chatbot_message.dart';

class LegalChatBotScreen extends StatefulWidget {
  const LegalChatBotScreen({Key? key}) : super(key: key);

  @override
  State<LegalChatBotScreen> createState() => _LegalChatBotScreenState();
}

class _LegalChatBotScreenState extends State<LegalChatBotScreen> {

  TextEditingController _chatController = TextEditingController();

  List<ChatBotMessage> _chatMessages = [];
  String result = '';

  void askGemini () async {
    result = await GeminiApi.getGeminiData(_chatController.text);
    Timer(const Duration(milliseconds: 1500), () {});
    setState(() {
      _chatMessages.add(ChatBotMessage(message: result, user: 'chatbot'));
    });
  }

  void sendQuery () {
    setState(() {
      _chatMessages.add(ChatBotMessage(message: _chatController.text, user: 'prisoner'));
    });
    askGemini();
    _chatController.clear();

  }

  void findLawyers(){
    // gemini works here
    Timer(const Duration(seconds: 0), () {
      setState(() {

        _chatMessages.add(const ChatBotMessage(message: 'Find me a lawyer', user: 'prisoner'));
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _chatMessages.add(const ChatBotMessage(message: 'Analyzing profile', user: 'chatbot'));
      });
    });

    Timer(const Duration(seconds: 4), () {
      setState(() {
        _chatMessages.add(const ChatBotMessage(message: 'Analyzing charge_sheet.pdf', user: 'chatbot'));
      });
    });

    Timer(const Duration(seconds: 5), () {
      setState(() {

        _chatMessages.add(const ChatBotMessage(message: 'Finding suitable lawyers', user: 'chatbot'));
      });
    });
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const FindLawyersScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: screenSize.height * 0.06,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'JusticeLink',
                style: GoogleFonts.italiana(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'INDIA',
                style: GoogleFonts.juliusSansOne(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 241, 244, 248),
      floatingActionButton: Container(
        width: MediaQuery.sizeOf(context).width*0.93,
        child: Row(

          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.813,
              child: FloatingActionButton(onPressed: () {

              },
                child: TextFormField(
                  controller: _chatController,
                  cursorColor: Colors.black,
                  // autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'For example: What are my fundamental rights?',
                    labelStyle: const TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                    ),
                    hintStyle: const TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color(0x7914181B),
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(225, 224, 227, 231),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 241, 244, 248),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 241, 244, 248),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 241, 244, 248),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(225, 224, 227, 231),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Readex Pro',
                    fontStyle: FontStyle.italic,
                  ),
                ),


              ),
            ),
            IconButton(onPressed: sendQuery, icon: const Icon(Ionicons.send))
          ],
        ),
      ),
      body: SafeArea(
        top: true,
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: 100,
              height: 99,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 244, 248),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Text(
                  'Your Legal Assistant',
                  style: GoogleFonts.juliusSansOne(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Text("Welcome to JusticLink India's legal assistant, powered by Gemini Pro.\nGet answers to your doubts with our chatbot. Also try our 'Find lawyers' feature to find a suitable lawyer for your case.",
              style: GoogleFonts.lato(fontSize: 17,),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Card(
                      elevation: 0.1,
                      color: Colors.grey.withAlpha(10),
                      child: SizedBox(
                        height: 120,
                        width: MediaQuery.sizeOf(context).width*0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('My Rights',style: GoogleFonts.lato(fontSize: 25))
                          ],
                        ),
                      ),
                    ),
                    onTap: (){
                      _chatController.text = 'What are my basic rights?';
                      sendQuery();

                    },
                  ),
                  GestureDetector(
                    onTap: (){
                      print('pressed');
                      findLawyers();
                    },
                    child: Card(
                      elevation: 0.1,
                      // color: Color.fromARGB(200, 192, 169, 169),
                      color: const Color.fromARGB(100, 192, 169, 169),
                      child: SizedBox(
                        height: 120,
                        width: MediaQuery.sizeOf(context).width*0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Find lawyers',style: GoogleFonts.lato(fontSize: 25),),
                            // const Icon(Ionicons.arrow_forward)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: CupertinoColors.systemGrey2.color.withAlpha(100)
                ),
                height: 500,
                width: MediaQuery.sizeOf(context).width*0.8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index,) {
                      return ChatBotMessageCard(message: _chatMessages[index]);
                    },
                    itemCount: _chatMessages.length,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
