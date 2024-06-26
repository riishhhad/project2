import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/Bloc/api_bloc.dart';
import 'package:project2/ui/screen2.dart';

import '../repository/Modelclass/Rishad.dart';

class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  @override
  void initState() {
    BlocProvider.of<ApiBloc>(context).add(FetchanimeEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Rishad result;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          AppBar(
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.list,
            ),
            title: Center(child: Text('FilmKu')),
            actions: [Icon(Icons.notification_add)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Now Showing',
                  style: TextStyle(
                    color: Color(0xFF110E46),
                    fontSize: 16,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10, top: 10),
                child: Text(
                  'See more',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFAAA8B0),
                    fontSize: 10,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 310,
            child: BlocBuilder<ApiBloc, ApiState>(
              builder: (context, state) {
                if (state is AnimeblocLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is AnimeblocError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                if (state is AnimeblocLoaded) {
                  result = BlocProvider.of<ApiBloc>(context).animeModel;

                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: result.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => screen2(

                          img:result.data![index].image.toString(),
                          titile: result.data![index].title
                              .toString(),
                          discrption: result.data![index].synopsis
                              .toString(),
                          genies: result.data![index].genres!,
                        )));
                      },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: SizedBox(
                                    width: 150,
                                    child: Image.network(
                                        result.data![index].image.toString())),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: SizedBox(
                                  width: 150,
                                  child: Text(
                                    result.data![index].title.toString(),
                                    style: TextStyle(
                                      color: Color(0xFF212529),
                                      fontSize: 15,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 25),
                                    child: SizedBox(
                                        width: 20,
                                        height: 10,
                                        child: Image.asset('assets/2.png')),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      '9.1/10 IMDb',
                                      style: TextStyle(
                                        color: Color(0xFF212529),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          width: 200,
                          height: 200,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF9FAFB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x28000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 20,
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Popular',
                  style: TextStyle(
                    color: Color(0xFF110E47),
                    fontSize: 16,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.w900,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  'See more',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFAAA8B0),
                    fontSize: 10,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              height: 330,
              child: BlocBuilder<ApiBloc, ApiState>(
                builder: (context, state) {
                  if (state is AnimeblocLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is AnimeblocError) {
                    return Center(
                      child: Text("Error"),
                    );
                  }

                  if (state is AnimeblocLoaded) {
                    result = BlocProvider.of<ApiBloc>(context).animeModel;

                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: result.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(onTap: (){
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) => screen2(

                            img:result.data![index].image.toString(),
                            titile: result.data![index].title
                                .toString(),
                            discrption: result.data![index].synopsis
                                .toString(),
                            genies: result.data![index].genres!,
                          )));
                        },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Container(
                                    width: 120,
                                    height: 150,
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        result.data![index].image.toString()),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10, top: 10),
                                      child: SizedBox(
                                        width: 230,
                                        height: 30,
                                        child: Text(
                                          result.data![index].title.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontFamily: 'Mulish',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 5),
                                          child: SizedBox(
                                              width: 15,
                                              child: Image.asset('assets/2.png')),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 5, top: 5),
                                          child: Text(
                                            '6.4/10 IMDb',
                                            style: TextStyle(
                                              color: Color(0xFF9B9B9B),
                                              fontSize: 12,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                              letterSpacing: 0.24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 35,
                                      width: 240,
                                      child: BlocBuilder<ApiBloc, ApiState>(
                                        builder: (context, state) {
                                          if (state is AnimeblocLoading) {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                          if (state is AnimeblocError) {
                                            return Center(
                                              child: Text("Error"),
                                            );
                                          }
                                          if (state is AnimeblocLoaded) {
                                            result =
                                                BlocProvider.of<ApiBloc>(context)
                                                    .animeModel;
                                          }
                                          return ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: result.data![index].genres!.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: Container(
                                                  width: 61,
                                                  height: 18,
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 4),
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFDBE3FF),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            top: 3),
                                                        child: SizedBox(
                                                          width: 30,
                                                          child: Text(
                                                            result.data![index]
                                                                .genres
                                                                .toString(),
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF87A3E8),
                                                              fontSize: 8,
                                                              fontFamily:
                                                                  'Mulish',
                                                              fontWeight:
                                                                  FontWeight.w700,
                                                              height: 0,
                                                              letterSpacing: 0.16,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                width: 20,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 30,
                                            height: 10,
                                            child: Icon(CupertinoIcons.clock)),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        '1h 47m',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            width: 150,
                            height: 150,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF9FAFB),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x28000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 20,
                        );
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ]),
        ));
  }
}
