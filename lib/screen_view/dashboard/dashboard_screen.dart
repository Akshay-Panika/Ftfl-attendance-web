import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_attendance_web/custom_widget/custom_colors.dart';
import 'package:ftfl_attendance_web/custom_widget/custom_hw.dart';
import 'package:ftfl_attendance_web/custom_widget/custom_textstyle.dart';
import 'package:ftfl_attendance_web/screen_view/dashboard/contant/dashboard.dart';
import 'package:ftfl_attendance_web/screen_view/dashboard/contant/manager.dart';
import 'contant/drawer.dart';
import 'contant/emoloyee.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Dashboard(),
    Employee(),
    Manager(),
  ];

  void _onMenuTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColor.backColor,

      /// Appbar
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        shape: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.5)),
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "FTFL Technology",
            style: textStyle20(color: Colors.blue.shade900),
          ),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Akshay Panika",
                style: textStyle12(fontWeight: FontWeight.w600),
              ),
              Text(
                "App Developer",
                style: textStyle14(fontWeight: FontWeight.w600, color: Colors.grey),
              ),
            ],
          ),
          10.width,
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/akshay.jpg'),
          ),
          50.width
        ],
      ),

      drawer: screenWidth.width > 500 ? null : CustomDrawer(),

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Side Menu
          screenWidth.width > 500
              ? Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(right: BorderSide(color: Colors.grey, width: 0.5))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      10.height,
                      ListTile(
                        leading: Icon(Icons.dashboard,color: _selectedIndex==0? Colors.green:null,),
                        title: Text(
                          "Dashboard",
                          style: textStyle14(color: _selectedIndex==0? Colors.green:null),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(Icons.arrow_forward_outlined, color: _selectedIndex==0? Colors.green:null,),
                        onTap: () => _onMenuTap(0),
                      ),

                      ListTile(
                        leading: Icon(Icons.person,color: _selectedIndex==1? Colors.green:null,),
                        title: Text(
                          "Employee",
                          style: textStyle14(color: _selectedIndex==1? Colors.green:null),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(Icons.arrow_forward_outlined, color: _selectedIndex==1? Colors.green:null,),
                        onTap: () => _onMenuTap(1),
                      ),

                      ListTile(
                        leading: Icon(Icons.person_pin,color: _selectedIndex==2? Colors.green:null,),
                        title: Text(
                          "Manager",
                          style: textStyle14(color: _selectedIndex==2? Colors.green:null),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Icon(Icons.arrow_forward_outlined, color: _selectedIndex==2? Colors.green:null,),
                        onTap: () => _onMenuTap(2),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text(
                            "Settings",
                            style: textStyle14(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text(
                            "Log Out",
                            style: textStyle14(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
              : SizedBox(),

          /// Main Content
          Expanded(
            flex: 5,
            child: _screens[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
