// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../../core/ui_state.dart';
import '../../models/call_model.dart';
import '../../providers/home_provider.dart';
import '../../repositories/common_repository.dart';
import '../../styles/colors.dart';
import '../../styles/textstyles.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetHomeListProvider getHomeListProvider =
  GetHomeListProvider(commonRepository: CommonRepository());
  final optionItems = <CallModel>[];

  @override
  void initState() {
    super.initState();
    getHomeListProvider.checkGetHomeList();
    optionItems
        .add(CallModel(Icons.phone_in_talk, '  Fire Service', '080004074'));
    optionItems.add(
        CallModel(Icons.phone_in_talk, 'Netherlands Police', '11284452631'));
    optionItems
        .add(CallModel(Icons.phone_in_talk, 'Petroinfotech', '5987345764'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: appBarColor,
              elevation: 1,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                "Home Page",
                style: titleTextStyle,
              ),
              centerTitle: true,
            ),
            backgroundColor: backGroundColor,
            body: SingleChildScrollView(
              child: homeWidget(),
            )));
  }

  Widget homeWidget() {
    return ChangeNotifierProvider<GetHomeListProvider>(
      create: (ctx) {
        return getHomeListProvider;
      },
      child: Consumer<GetHomeListProvider>(builder: (ctx, data, _) {
        var state = data.getHomeListLiveData().getValue();
        print(state);
        if (state is IsLoading) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height / 1.3,
            child: Center(
              child: CircularProgressIndicator(
                color: blueColor,
              ),
            ),
          );
        } else if (state is IsEmpty) {
          return Center(
            child: Text(
              'Something Went Wrong!',
              style: titleTextStyle,
            ),
          );
        } else if (state is Success) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                // child: ListView.separated(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   separatorBuilder: (context, index) => SizedBox(height: 8),
                //   itemCount: data.getHomeList.dtAbstract!.length,
                //   itemBuilder: (context, index) => SizedBox(
                //       height: 48,
                //       child: Column(
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Expanded(
                //                 child: Container(
                //                     padding:
                //                         EdgeInsets.fromLTRB(12, 12, 12, 20),
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(12),
                //                       color: whiteColor,
                //                     ),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Container(
                //                           padding: EdgeInsets.all(10),
                //                           width: 200,
                //                           decoration: BoxDecoration(
                //                             borderRadius:
                //                                 BorderRadius.circular(10),
                //                             color: pendingColor,
                //                           ),
                //                           child: Text(
                //                             '${data.getHomeList.dtAbstract?[index].count}',
                //                             style: titleTextStyle,
                //                           ),
                //                         ),
                //                         SizedBox(
                //                           height: 8,
                //                         ),
                //                         Text(
                //                           '${data.getHomeList.dtAbstract?[index].item}',
                //                           style: subTextStyle,
                //                         )
                //                       ],
                //                     )),
                //               ),
                //               SizedBox(
                //                 width: 8,
                //               ),
                //               Expanded(
                //                 child: Container(
                //                     padding:
                //                         EdgeInsets.fromLTRB(12, 12, 12, 20),
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(12),
                //                       color: whiteColor,
                //                     ),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: [
                //                         Container(
                //                           padding: EdgeInsets.all(10),
                //                           width: 200,
                //                           decoration: BoxDecoration(
                //                             borderRadius:
                //                                 BorderRadius.circular(10),
                //                             color: pendingColor,
                //                           ),
                //                           child: Text(
                //                             '${data.getHomeList.dtAbstract?[index].count}',
                //                             style: titleTextStyle,
                //                           ),
                //                         ),
                //                         SizedBox(
                //                           height: 8,
                //                         ),
                //                         Text(
                //                           '${data.getHomeList.dtAbstract?[index].item}',
                //                           style: subTextStyle,
                //                         )
                //                       ],
                //                     )),
                //               ),
                //             ],
                //           ),
                //         ],
                //       )),
                // )
                child: Column(children: [
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.getHomeList.dtAbstract!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 3 / 1.9,),
                      itemBuilder: (context, index) =>
                          Container(
                            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: whiteColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: data.getHomeList.dtAbstract![index]
                                        .item == 'Pending Actions'
                                        ? pendingColor
                                        : data.getHomeList.dtAbstract![index]
                                        .item == 'My Observations in 2023'
                                        ? observationsColor
                                        :data.getHomeList.dtAbstract![index]
                                        .item == 'My Expired Competencies'? expiredColor:data.getHomeList.dtAbstract![index]
                                        .item == 'Upcoming/ Ongoing Journeys'? upcomingColor:data.getHomeList.dtAbstract![index]
                                        .item == 'Audit In Progress'? progressColor: blueColor,
                                  ),
                                  child: Text(
                                    '${data.getHomeList.dtAbstract![index]
                                        .count}',
                                    style: titleTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${data.getHomeList.dtAbstract![index].item}',
                                  style: subTextStyle,
                                )
                              ],
                            ),
                          ))
                ]),
                //next
                //       Column(
                //     children: [
                //     Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //           child: Container(
                //               padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(12),
                //                 color: whiteColor,
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Container(
                //                     padding: EdgeInsets.all(10),
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(10),
                //                       color: pendingColor,
                //                     ),
                //                     child: Text(
                //                       '307',
                //                       style: titleTextStyle,
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 8,
                //                   ),
                //                   Text(
                //                     'Pending Actions',
                //                     style: subTextStyle,
                //                   )
                //                 ],
                //               )),
                //         ),
                //         SizedBox(
                //           width: 8,
                //         ),
                //         Expanded(
                //             child: Container(
                //                 padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(12),
                //                   color: whiteColor,
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment:
                //                   CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                       padding: EdgeInsets.all(10),
                //                       width: 200,
                //                       decoration: BoxDecoration(
                //                         borderRadius:
                //                         BorderRadius.circular(10),
                //                         color: progressColor,
                //                       ),
                //                       child: Text(
                //                         '92',
                //                         style: titleTextStyle,
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height: 8,
                //                     ),
                //                     Text(
                //                       'Audit In Progress',
                //                       style: subTextStyle,
                //                     )
                //                   ],
                //                 ))),
                //       ],
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //           child: Container(
                //               padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(12),
                //                 color: whiteColor,
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Container(
                //                     padding: EdgeInsets.all(10),
                //                     width: 200,
                //                     decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(10),
                //                       color: expiredColor,
                //                     ),
                //                     child: Text(
                //                       '9',
                //                       style: titleTextStyle,
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 8,
                //                   ),
                //                   Text(
                //                     'My Expired competencies',
                //                     style: subTextStyle,
                //                   )
                //                 ],
                //               )),
                //         ),
                //         SizedBox(
                //           width: 8,
                //         ),
                //         Expanded(
                //             child: Container(
                //                 padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(12),
                //                   color: whiteColor,
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment:
                //                   CrossAxisAlignment.start,
                //                   children: [
                //                     Container(
                //                       padding: EdgeInsets.all(10),
                //                       width: 200,
                //                       decoration: BoxDecoration(
                //                         borderRadius:
                //                         BorderRadius.circular(12),
                //                         color: observationsColor,
                //                       ),
                //                       child: Text(
                //                         '20',
                //                         style: titleTextStyle,
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height: 8,
                //                     ),
                //                     Text(
                //                       'My Observations in 2023',
                //                       style: subTextStyle,
                //                     )
                //                   ],
                //                 ))),
                //       ],
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ),
                //     Container(
                //         padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(12),
                //           color: whiteColor,
                //         ),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Container(
                //               padding: EdgeInsets.all(10),
                //               width: 200,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(12),
                //                 color: upcomingColor,
                //               ),
                //               child: Text(
                //                 '640',
                //                 style: titleTextStyle,
                //               ),
                //             ),
                //             SizedBox(
                //               height: 8,
                //             ),
                //             Text(
                //               'Upcoming/Ongoing Journeys',
                //               style: subTextStyle,
                //             )
                //           ],
                //         )),
                //     SizedBox(
                //       height: 10,
                //     ),
                //   ],
                // ),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: daysWithoutColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 17),
                        child: Text(
                          'Days Without LTI',
                          style: titleTextStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 10, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: daysWithoutColor,
                                      ),
                                      child: Text(
                                        '11',
                                        style: titleTextStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Petroinfotech Pvt Ltd',
                                      style: subTextStyle,
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: daysWithoutColor,
                                      ),
                                      child: Text(
                                        '11',
                                        style: titleTextStyle,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Petroinfotech Pvt Ltd',
                                      style: subTextStyle,
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(18, 12, 18, 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: whiteColor,
                                  gradient: LinearGradient(
                                    colors: const [
                                      backGroundColor,
                                      whiteColor,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Man Hours worked',
                                      style: subTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '3877889',
                                      style: titleTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Man Hours worked till last month',
                                      style: subTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '3876689',
                                      style: titleTextStyle,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(18, 12, 18, 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: whiteColor,
                                  gradient: LinearGradient(
                                    colors: const [
                                      backGroundColor,
                                      whiteColor,
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'KM Driven',
                                      style: subTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '145444',
                                      style: titleTextStyle,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'KM Driven till last month',
                                      style: subTextStyle,
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '145444',
                                      style: titleTextStyle,
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                      // Container(
                      //   height: 400.0,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //       boxShadow: const [
                      //         BoxShadow(color: daysWithoutColor, blurRadius: 8.0)
                      //       ],
                      //       color: daysWithoutColor),
                      //   child: CustomPaint(
                      //     painter: CurvedPainter(),
                      //   ),
                      // ),
                    ],
                  )),
              SizedBox(
                height: 13,
              ),
              Align(
                child: Text(
                  'Emergency Contact',
                  style: titleTextStyle,
                ),
                alignment: Alignment(0, -1),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 40),
                child: Container(
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12)),
                    width: double.infinity,
                    height: 154,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          Divider(
                            color: Colors.black12,
                            height: 0,
                          ),
                      itemCount: optionItems.length,
                      itemBuilder: (context, index) =>
                          SizedBox(
                            height: 48,
                            child: ListTile(
                              onTap: () {
                                FlutterPhoneDirectCaller.callNumber(
                                    optionItems[index].phone);
                              },
                              leading: Transform.translate(
                                offset: Offset(4, 4),
                                child: Icon(
                                  optionItems[index].icon,
                                  size: 21,
                                  color: blueColor,
                                ),
                              ),
                              title: Align(
                                alignment: Alignment(-1.2, 0),
                                child: Text(
                                  optionItems[index].text +
                                      ' - ' +
                                      optionItems[index].phone,
                                  style: titleTextStyle,
                                ),
                              ),
                            ),
                          ),
                    )),
              ),
            ],
          );
        } else if (state is Failure) {
          return Center(
            child: Text(
              'Something Went Wrong!',
              style: titleTextStyle,
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = curvedColor
      ..strokeWidth = 12;

    var path = Path();

    path.moveTo(0, size.height * 0.84);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.71,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.95,
        size.width * 1.0, size.height * 0.79);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
