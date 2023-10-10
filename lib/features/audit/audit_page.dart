// ignore_for_file: prefer_const_constructors

import 'package:audit_app/providers/audit_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/ui_state.dart';
import '../../repositories/common_repository.dart';
import '../../styles/colors.dart';
import '../../styles/textstyles.dart';

class AuditPage extends StatefulWidget {
  const AuditPage({Key? key}) : super(key: key);

  @override
  State<AuditPage> createState() => _AuditPageState();
}

class _AuditPageState extends State<AuditPage> {
  GetAuditListProvider getAuditListProvider =
  GetAuditListProvider(commonRepository: CommonRepository());

  @override
  void initState() {
    getAuditListProvider.checkGetAuditList();
    super.initState();
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
          "Audit",
          style: titleTextStyle,
        ),
        centerTitle: true,
      ),
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
        child: auditWidget()
      ),
    ));
  }

  Widget auditWidget() {
    return ChangeNotifierProvider<GetAuditListProvider>(
      create: (ctx) {
        return getAuditListProvider;
      },
      child: Consumer<GetAuditListProvider>(builder: (ctx, data, _) {
        var state = data.getAuditListLiveData().getValue();
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
          return Column(
            children: [
              Text(
                'Recent Audit List',
                style: titleTextStyle,
              ),
              SizedBox(height: 8,),
              ListView.separated(
              physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 12,
        separatorBuilder: (context, _) => const SizedBox(height: 9),
        itemBuilder: (context, index) => Column(children: [
        InkWell(
        child: Container(
        padding: const EdgeInsets.symmetric(
        vertical: 0.0, horizontal: 0.0),
        height: 66,
        width: double.infinity,
        decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: whiteColor),
        borderRadius:
        const BorderRadius.all(Radius.circular(10))),
        child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
        vertical: 0.0, horizontal: 12.0),
        leading: Transform.translate(
        offset: const Offset(-0, -4),
        child: const CircleAvatar(
        maxRadius: 19,
        backgroundColor: backGroundColor,
        child: Icon(
        CupertinoIcons.list_dash,
        color: blueColor,
        size: 19,
        ),
        ),
        ),
        title: Transform.translate(
        offset: const Offset(-8, -5),
        child: Text(
        'Audit Name',
        overflow: TextOverflow.ellipsis,
        style: titleTextStyle,
        ),
        ),
        subtitle: Transform.translate(
        offset: const Offset(-8, -7),
        child: Text(
        'Audit Description',
        overflow: TextOverflow.ellipsis,
        style: subTextStyle,
        ),
        ),
        trailing: Transform.translate(
        offset: const Offset(-0, -7),
        child: Text(
        'Audit date',
        style: subTextStyle,
        ),
        )),
        ),
        onTap: () {},
        ),
        ])),
            ],
          );
        } else if (state is Success) {
          return ListView.separated(
            physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12,
              separatorBuilder: (context, _) => const SizedBox(height: 9),
              itemBuilder: (context, index) => Column(children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 0.0),
                    height: 66,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: whiteColor),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10))),
                    child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 12.0),
                        leading: Transform.translate(
                          offset: const Offset(-0, -4),
                          child: const CircleAvatar(
                            maxRadius: 19,
                            backgroundColor: backGroundColor,
                            child: Icon(
                              CupertinoIcons.list_dash,
                              color: blueColor,
                              size: 19,
                            ),
                          ),
                        ),
                        title: Transform.translate(
                          offset: const Offset(-8, -5),
                          child: Text(
                            'Audit Name',
                            overflow: TextOverflow.ellipsis,
                            style: titleTextStyle,
                          ),
                        ),
                        subtitle: Transform.translate(
                          offset: const Offset(-8, -7),
                          child: Text(
                            'Audit Description',
                            overflow: TextOverflow.ellipsis,
                            style: subTextStyle,
                          ),
                        ),
                        trailing: Transform.translate(
                          offset: const Offset(-0, -7),
                          child: Text(
                            'Audit date',
                            style: subTextStyle,
                          ),
                        )),
                  ),
                  onTap: () {},
                ),
              ]));
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
