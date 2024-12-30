import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom_widget/custom_card.dart';
import '../../../custom_widget/custom_decoration.dart';
import '../../../custom_widget/custom_text_padding.dart';
import '../../../custom_widget/custom_textstyle.dart';

class Manager extends StatefulWidget {
  const Manager({super.key});

  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  final TextEditingController _searchController = TextEditingController();
  List<String> managerList = List.generate(10, (index) => 'Manager ${index + 1}');
  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = managerList;
  }

  void _filterEmployees(String query) {
    setState(() {
      filteredList = managerList
          .where((employee) => employee.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textPaddingWidget(
          text: 'Manager List',
          textStyle: textStyle20(color: Colors.black),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Search Bar
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 10),
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: textStyle14(),
                    onChanged: _filterEmployees,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search here..',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            // Add Employee, Filter, Export Buttons
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 10),
              child: Row(
                children: [
                  CustomCard(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 15),
                        SizedBox(width: 10),
                        Text("Add Manager", style: textStyle12()),
                      ],
                    ),
                  ),
                  CustomCard(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt_sharp, size: 15),
                        SizedBox(width: 10),
                        Text("Filter", style: textStyle12()),
                      ],
                    ),
                  ),
                  CustomCard(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.file_download, size: 15),
                        SizedBox(width: 10),
                        Text("Export List", style: textStyle12()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Employee List
        Expanded(
          child: Container(
            margin: screenWidth.width > 500
                ? EdgeInsets.only(left: 40, right: 40, bottom: 40)
                : EdgeInsets.only(left: 10, right: 10),
            decoration: customDecoration(
              color: Colors.white,
              borderRadius: 20,
              borderColor: Colors.grey,
              borderWidth: 0.5,
            ),
            child: filteredList.isEmpty
                ? Center(
              child: Text(
                'No Manager Found',
                style: textStyle14(color: Colors.grey),
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.person, color: Colors.grey),
                  title: Text(
                    filteredList[index],
                    style: textStyle14(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Role: Developer',
                    style: textStyle12(color: Colors.grey),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {},
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
