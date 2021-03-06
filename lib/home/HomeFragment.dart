import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/api/ApiManager.dart';
import 'package:news/home/HomeTabsScreen.dart';
import 'package:news/model/Category.dart';
import 'package:news/model/SouresResponse.dart';


class HomeFragment extends StatefulWidget {
  Category category;

  HomeFragment(this.category);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
   late Future<SourcesResponse> newsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = getNewsSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: newsFuture,
        builder: (builContext, snapShot) {
          if (snapShot.hasData) {
            return HomeTabs(snapShot.data!.sources);
          } else if (snapShot.hasError) {
            return Text('error loading data'); // assignment reload
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
