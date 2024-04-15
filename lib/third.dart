import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/edit.dart';

class third extends StatefulWidget {

  String shayari;
  int index1;
  int len;
  List<String> shayaril;

  third(this.shayari, this.index1, this.len, this.shayaril);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {

  late int ci1=0;
  late int index2 = widget.index1+1;
  late int index3;
  TextEditingController controller = TextEditingController();
  PageController pageController = PageController();


  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: widget.index1);

  }

  @override
  Widget build(BuildContext context) {
    // index3 = index2-1;
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.shayari}",maxLines: 1),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 50,
                width: 70,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [Colors.deepPurpleAccent,Colors.deepOrange],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepOrange,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Colors.deepPurpleAccent,
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(-4, -4),
                    ),
                  ],
                ),
                child: Center(child: Text("${index2}/${widget.len}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
              ),
            ),
            Expanded(
              child: Center(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {

                    widget.index1 = value;

                    setState(() {

                    });

                  },
                  itemCount: widget.shayaril.length,
                  itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      // color: Colors.cyanAccent,
                      borderRadius: BorderRadius.circular(20),
                      gradient: RadialGradient(colors: [Colors.white,Colors.deepPurple.shade100],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.shade100,
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(3, 3),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(-4, -4),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(top: 20,bottom: 40,left: 18,right: 18),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Center(child: Text("${widget.shayaril[index2-1]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                  );
                },)
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: ci1,
          selectedFontSize: 15,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.copy),
                label: "Copy",
              backgroundColor: Colors.deepOrange,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chevron_left),
              label: "Previous",
              backgroundColor: Colors.deepPurpleAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_off_sharp),
              label: "Edit",
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chevron_right),
              label: "Next",
              backgroundColor: Colors.deepOrange
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: "Share",
              backgroundColor: Colors.deepOrange
            ),
          ],
        onTap: (index) async {
            ci1=index;
            if(index==0)
              {
                await FlutterClipboard.copy(widget.shayaril[index2-1]).then(( value ) =>

                    Fluttertoast.showToast(
                    msg: "Copied",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                ));
              }
            if(index==1)
              {

                // index3--;
                index2--;
                if(index2==1)
                  {
                    index2 = widget.len;
                  }

                // if(index3==1)
                //   {
                //     index3 = widget.len;
                //   }
              }
            if(index==2)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return edit(widget.shayaril[index2-1]);
                },));
              }
            if(index==3)
              {

                // index3++;
                index2++;
                if(index2==widget.len+1)
                  {
                    index2 = 1;
                  }

                // if(index3==widget.len+1)
                //   {
                //     index3 = 1;
                //   }
              }
            if(index==4)
              {
                Share.share(widget.shayaril[index2-1]);
              }

            setState(() {

            });
        },
      ),
    );
  }
}
