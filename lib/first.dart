import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari/second.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  List<String> ti = ["Other Shayari","Break-Up Shayari","Love Shayari","God Shayari","Sharab Shayari","Sad Shayari"];
  List<String> images = ["pics/other.jpg","pics/breakup.jpg","pics/love.jpg","pics/god.jpg","pics/shrab.jpg","pics/sad.jpg"];
  int ci=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hindi Shayari"),
        actions: [
          IconButton(onPressed: () {
            Share.share('https://play.google.com/');
          }, icon: Icon(Icons.share)),
        ],
        // titleSpacing: 20,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
          ),
        ),

        elevation: 20,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
          return InkWell(
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return second(ti[index],images[index],index);
              },));

              setState(() {

              });
            },
            child: Container(
              height: 80,
              width: 80,
              margin: EdgeInsets.only(top: 18,left: 18,right: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.deepPurple.shade100,width: 3),
                    borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.shade100,
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: Container(
                alignment: Alignment.center,
                child: ListTile(  
                  leading: Container(
                    color: Colors.amber,
                    margin: EdgeInsets.only(top: 0),
                    child: Image.asset(
                        images[index],
                        height: 80,
                        width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(ti[index]),
                ),
              ),
            ),
          );
        },),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ci,
          type: BottomNavigationBarType.shifting,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_contact_cal_sharp),
              label: "Contact Us",
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail),
              label: "Mail",
              backgroundColor: Colors.red,
            ),
          ],
        onTap: (index) {
          ci = index;
          setState(() {

          });
        },
      ),
    );
  }
}
