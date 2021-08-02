import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/ThemeProvider.dart';
import 'package:news/home/HomeFragment.dart';
import 'package:news/home/SideMenu.dart';
import 'package:news/home/categories/CategoriesFragment.dart';
import 'package:news/model/Category.dart';


class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = "Home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Category? selectedCatogory ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/bg.png',
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(' News App'),

          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80))),
        ),
        drawer: Drawer(
          child: SideMenu(onSideMenuItemClick),
        ),
        body: selectedCatogory == null
            ? CategoriesFragment(onCategoryClickCallBack)
            : HomeFragment(selectedCatogory!),
      ),
    );
  }

  void onCategoryClickCallBack(Category category) {
    setState(() {
      selectedCatogory = category;
    });
  }

  void onSideMenuItemClick(SideMenuItem sideMenuItem) {
    Navigator.of(context).pop();
    if (sideMenuItem.id == SideMenuItem.CATEGORIES) {
      setState(() {
        selectedCatogory = null;
      });
    } else if (sideMenuItem.id == SideMenuItem.SETTINGS) {}
  }
}
