// ignore_for_file: unrelated_type_equality_checks

import 'package:audit_app/features/audit/audit_page.dart';
import 'package:audit_app/features/home/home_page.dart';
import 'package:audit_app/features/profile/profile_page.dart';
import 'package:audit_app/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabViewPage extends StatefulWidget {
  const TabViewPage({Key? key}) : super(key: key);

  @override
  State<TabViewPage> createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(
      length: 3,
      initialIndex: tabIndex,
      child: Scaffold(
        body:  TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            AuditPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicator: BoxDecoration(
            color:  appBarColor,
            borderRadius: BorderRadius.zero,
          ),
          unselectedLabelColor: whiteColor,
          labelColor: whiteColor,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 27,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.home_outlined,
                      size: 27,color: blueColor,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 27,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      CupertinoIcons.list_dash,
                      size: 22,color: blueColor,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 27,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person,
                      size: 25,color: blueColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
