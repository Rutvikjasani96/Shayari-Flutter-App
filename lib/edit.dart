import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';


class edit extends StatefulWidget {

  String shayaril;

  edit(this.shayaril);


  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {

  List<Color> clr = [
    Colors.grey,
    Colors.white,
    Colors.black,
    Colors.yellow,
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.deepOrange,
    Colors.green,
    Colors.greenAccent,
    Colors.red,
    Colors.pink,
    Colors.yellowAccent,
    Colors.amberAccent,
    Colors.limeAccent,
    Colors.deepOrangeAccent,
    Colors.lightGreenAccent,
    Colors.redAccent,
    Colors.lightGreen,
    Colors.deepPurple,
  ];
  List<Color> fclr = [
    Colors.grey,
    Colors.white,
    Colors.black,
    Colors.yellow,
    Colors.blueAccent,
    Colors.cyanAccent,
    Colors.deepOrange,
    Colors.green,
    Colors.greenAccent,
    Colors.red,
    Colors.pink,
    Colors.yellowAccent,
    Colors.amberAccent,
    Colors.limeAccent,
    Colors.deepOrangeAccent,
    Colors.lightGreenAccent,
    Colors.redAccent,
    Colors.lightGreen,
    Colors.deepPurple,
  ];
  Color clr1 = Colors.deepPurple.shade100;
  Color clr2 = Colors.black;

  double fsize = 20;

  List<String> fo = [
    "one",
    "two",
    "three",
    "four",
    "five",
  ];

  String cfo = "first";

  List<String> emj = [
    "😀 😃 😄 😁 😆 😅 😂 🤣 🥲 ☺ ",
    "😉 😌 😍 🥰 😘 😗 😙 😚 😋 😛",
    "👋 🤚 🖐 ✋ 🖖 👌 🤌 🤏 ✌️ 🤞",
    "👉 👆 🖕 👇 ☝️ 👍 👎 ✊ 👊 🤛",
    "👃 🫀 🫁 🧠 🦷 🦴 👀 👁 👅 👄",
    "👶 👧 🧒 👦 👩 🧑 👨 👩‍🦱 🧑‍🦱 👨‍🦱",
    "👱 👱‍♂️ 👩‍🦳 🧑‍🦳 👨‍🦳 👩‍🦲 🧑‍🦲 👨‍🦲 🧔 👵",
    "💁 💁‍♂️ 🙅‍♀️ 🙅 🙅‍♂️ 🙆‍♀️ 🙆 🙆‍♂️ 🙋‍♀️ 🙋",
    "🧳 🌂 ☂️ 🧵 🪡 🪢 🧶 👓 🕶 🥽",
    "🧗🏻‍♂️ 🏇🏻 🏂🏻 🏌🏻‍♀️ 🏌🏻 🏌🏻‍♂️ 🏄🏻‍♀️ 🏄🏻 🏄🏻‍♂️ 🚣🏻‍♀️",
  ];

  String cemj = "😀 😃 😄 😁 😆 😅 😂 🤣 🥲 ☺ ";

  late String folderpath;


  @override
  void initState() {
    super.initState();

    String path = "storage/emulated/0/download";
    Directory directory = Directory(path);
    void createAppFolder() async {



      if(await directory.exists())
      {
        print("Already Exist.");
      }
      else
      {
        await directory.create();
      }



    }
    createAppFolder();
    folderpath = directory.path;
  }

    GlobalKey _globalKey = new GlobalKey();

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: RepaintBoundary(
                key: _globalKey,
                child: Container(
                  height: 400,
                  width: 400,
                  margin: EdgeInsets.only(top: 50,left: 18,right: 18),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: clr1,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.shade100,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(-4, -4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text("          ${cemj}\n${widget.shayaril}\n          ${cemj}",style: TextStyle(fontFamily: "${cfo}",fontSize: fsize,color: clr2,fontWeight: FontWeight.bold),),
                ),
              ),
            ),
          ),
          Expanded(
              // flex: 3,
              child: Container(
            height: double.infinity,
          )),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {

                        showModalBottomSheet( builder: (context) {
                          return Container(
                            height: 150,
                            child: GridView.builder(
                                itemCount: clr.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {

                                      clr1 = clr[index];

                                      setState(() {

                                      });

                                    },
                                    child: GridTile(child: Container(
                                      color: clr[index],
                                    )),
                                  );
                            },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10,mainAxisSpacing: 10,crossAxisSpacing: 10)),
                          );
                        }, context: context);

                        setState(() {

                        });
                      },
                      child: Container(
                        height: 30,
                        width: 80,
                        color: Colors.red,
                          alignment: Alignment.center,
                          child: Text("Background"),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                        showModalBottomSheet(builder: (context) {
                          return Container(
                            height: 150,
                              child: GridView.builder(
                                  itemCount: fclr.length,
                                  itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {

                                    clr2 = fclr[index];

                                    setState(() {

                                    });

                                  },
                                  child: GridTile(child: Container(
                                    color: fclr[index],
                                  )),
                                );
                              },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10,mainAxisSpacing: 10,crossAxisSpacing: 10)),
                          );
                        },context: context);

                        setState(() {

                        });

                      },
                      child: Container(
                          height: 30,
                          color: Colors.red,
                          width: 80,
                          alignment: Alignment.center,
                          child: Text("Text Color"),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                        _capturePng().then((value) => (value) async {
                          DateTime d = DateTime.now();
                          print(d);

                          String time = "${d.year}${d.month}${d.day}${d.hour}${d.minute}${d.second}${d.millisecond}";

                          String imagepath = "${folderpath}/Image$time.jpg";

                          File file = new File(imagepath);

                          await file.create();

                          file.writeAsBytesSync(value);

                          Share.shareFiles([file.path], text: 'Shayari picture');

                        });

                        setState(() {

                        });

                      },
                      child: Container(
                          height: 30,
                          color: Colors.red,
                          width: 80,
                          alignment: Alignment.center,
                          child: Text("Share"),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {

                        showModalBottomSheet(builder: (context) {
                          return Container(
                            height: 150,
                            child: GridView.builder(
                                itemCount: fo.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {

                                      cfo = fo[index];

                                      setState(() {

                                      });

                                    },
                                    child: Container(
                                      height: 200,
                                      color: Colors.redAccent,
                                      alignment: Alignment.center,
                                      child:  Text("${fo[index]}"),

                                    ),
                                  );
                            },gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 5  ,mainAxisSpacing: 10,crossAxisSpacing: 10)),
                          );
                        }, context: context);

                        setState(() {

                        });

                      },
                      child: Container(
                          height: 30,
                          width: 80,
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: Text("Font"),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                        showModalBottomSheet(builder: (context) {
                          return Container(
                            height: 100,
                            child: ListView.separated(
                              itemCount: emj.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {

                                    cemj = emj[index];

                                    setState(() {

                                    });

                                  },
                                  child: Container(
                                    height: 20,
                                    width: 50,
                                    child: Text(emj[index]),
                                  ),
                                );
                            }, separatorBuilder: (BuildContext context, int index) { return Divider(); },),
                          );
                        }, context: context);

                        setState(() {

                        });

                      },
                      child: Container(
                          height: 30,
                          width: 80,
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: Text("Emoji"),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                        showModalBottomSheet(builder: (context) {
                          return Container(
                            height: 100,
                            child: StatefulBuilder(builder: (context, setState1) {
                              return Slider(min: 10,max: 50,onChanged: (value) {

                                fsize = value;

                                setState1(() {

                                });

                                setState(() {

                                });

                              },value: fsize);
                            },)
                          );
                        }, context: context);

                        setState(() {

                        });

                      },
                      child: Container(
                          height: 30,
                          width: 80,
                          color: Colors.red,
                          alignment: Alignment.center,
                          child: Text("Text Size"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
