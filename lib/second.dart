import 'package:flutter/material.dart';
import 'package:shayari/shayari.dart';
import 'package:shayari/third.dart';

class second extends StatefulWidget {

  String ti;
  String images;
  int index1;

  second(this.ti,this.images, this.index1);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {

  List<String> shayari = [];

  @override
  void initState() {
    super.initState();

    if(widget.index1==0)
      {
        shayari = other;
      }
    if(widget.index1==1)
      {
        shayari = bu;
      }
    if(widget.index1==2)
      {
        shayari = lv;
      }
    if(widget.index1==3)
      {
        shayari = gd;
      }
    if(widget.index1==4)
      {
        shayari = srb;
      }
    if(widget.index1==5)
      {
        shayari = sd;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ti),
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
          itemCount: shayari.length,
          itemBuilder: (context, index) {
          return InkWell(
            onTap: () {

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                int len = shayari.length;
                return third(shayari[index],index,len,shayari);

              },));

              setState(() {

              });
            },
            child: Container(
              height: 65,
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
                  leading: Image.asset(
                    widget.images,
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                  title: Text(shayari[index],maxLines: 1),
                ),
              ),
            ),
          );
        },),
      ),
    );
  }
}
