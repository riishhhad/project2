import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen2 extends StatefulWidget {

  final String img;
  final String titile;
  final String discrption;

  final List genies;


  const screen2(
      {super.key,
        required this.img,
        required this.titile,
        required this.discrption,
        required this.genies});

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Icon(
                    CupertinoIcons.back,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20, top: 15),
                  child: Icon(Icons.more_horiz),
                )
              ],
            ),
            SizedBox(width: 350, height: 300, child: Image.network(widget.img)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 5),
                  child: SizedBox(width: 250,height: 60,
                    child: Text(
                      widget.titile,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.40,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(Icons.bookmark_border),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: SizedBox(width: 15, child: Image.asset('assets/3.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 10),
                  child: Text(
                    '9.1/10 IMDb',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 12,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: SizedBox(
                  height: 30,
                  child: ListView.separated(
                    itemCount: widget.genies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 60,
                        height: 10,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: ShapeDecoration(
                          color: Color(0xFFDBE3FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 32,
                              height: 40,
                              child: Text(
                                widget.genies[index],
                                style: TextStyle(
                                  color: Color(0xFF87A3E8),
                                  fontSize: 8,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: 0.16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: Row(
                children: [
                  Text(
                    'Length',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 12,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: SizedBox(
                      width: 30,
                    ),
                  ),
                  Text(
                    'Language',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 12,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 30,
                    ),
                  ),
                  Text(
                    'Rating',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 12,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.24,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    '2h 28min',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 15),
                  child: Text(
                    'English',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60, top: 15),
                  child: Text(
                    'PG-13',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.24,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: Color(0xFF110E47),
                      fontSize: 22,
                      fontFamily: 'Merriweather',
                      fontWeight: FontWeight.w900,
                      height: 0,
                      letterSpacing: 0.32,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 370,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  widget.discrption,
                  style: TextStyle(
                    color: Color(0xFF9B9B9B),
                    fontSize: 12,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.24,
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
