import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_max/ui/search_result_pages/search_comic_result_page.dart';
import 'package:marvel_max/ui/search_result_pages/search_creator_result_page.dart';
import 'package:marvel_max/ui/search_result_pages/search_event_result_page.dart';
import 'package:marvel_max/ui/search_result_pages/search_series_result_page.dart';
import 'MyColors.dart';
import 'package:marvel_max/ui/tab_pages/CharactersTabPage.dart';
import 'package:marvel_max/ui/tab_pages/ComicsTabPage.dart';
import 'package:marvel_max/ui/tab_pages/EventsTabPage.dart';
import 'package:marvel_max/ui/tab_pages/SeriesTabPage.dart';
import 'package:marvel_max/ui/tab_pages/StoriesTabPage.dart';
import 'package:marvel_max/ui/tab_pages/CreatorsTabPage.dart';
import 'package:marvel_max/ui/search_result_pages/search_character_result_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      title: 'MarvelMax',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      home: TabDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TabDemo extends StatefulWidget {
  _TabDemoState createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final _textFieldController = new TextEditingController();
  FocusNode _focusNode = FocusNode();
  bool logoBool = true;
  bool searchBool = false;
  int hintType;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('images/marvellogo.png'), context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: MyColors.app_bar,
        title: buildAppRow(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Material(
            color: MyColors.tab_layout,
            child: TabBar(
                labelPadding: EdgeInsets.zero,
                controller: _tabController,
                isScrollable: true,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: MyColors.marvel_red,
                tabs: <Widget>[
                  Tab(
                      icon: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'EVENTS',
                      textScaleFactor: 1.0,
                    ),
                  )),
                  Tab(
                      icon: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'COMICS',
                      textScaleFactor: 1.0,
                    ),
                  )),
                  Tab(
                      icon: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'SERIES',
                      textScaleFactor: 1.0,
                    ),
                  )),
                  Tab(
                      icon: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'CHARACTERS',
                      textScaleFactor: 1.0,
                    ),
                  )),
                  Tab(
                      icon: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'CREATORS',
                      textScaleFactor: 1.0,
                    ),
                  )),
                  Tab(
                      icon: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Text(
                      'STORIES',
                      textScaleFactor: 1.0,
                    ),
                  )),
                ]),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          EventsTabPage(),
          ComicsTabPage(),
          SeriesTabPage(),
          CharactersTabPage(),
          CreatorsTabPage(),
          StoriesTabPage(),
        ],
      ),
    );
  }

  Widget buildAppRow() {
    print(searchBool);
    return Stack(
      children: <Widget>[
        Visibility(
          visible: logoBool,
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/marvellogo.png',
                height: 23,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        logoBool = false;
                        searchBool = true;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: searchBool,
          child: Row(
            children: <Widget>[
              Container(
                  child: IconButton(
                alignment: Alignment.centerLeft,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    logoBool = true;
                    searchBool = false;
                  });
                },
              )),
              Expanded(
                child: buildTextField(),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  icon: Icon(Icons.search),
                  onPressed: () {
                    Timer timer =
                        new Timer(new Duration(milliseconds: 500), () {
                      if (_textFieldController.text.length > 0) {
                        if (_tabController.index == 0) {
                          Get.to(SearchEventResultPage(
                            value: _textFieldController.text,
                            type: _tabController.index,
                          ));
                        }
                        if (_tabController.index == 1) {
                          Get.to(SearchComicResultPage(
                            value: _textFieldController.text,
                            type: _tabController.index,
                          ));
                        }
                        if (_tabController.index == 2) {
                          Get.to(SearchSeriesResultPage(
                            value: _textFieldController.text,
                            type: _tabController.index,
                          ));
                        }
                        if (_tabController.index == 3) {
                          Get.to(SearchCharacterResultPage(
                            value: _textFieldController.text,
                            type: _tabController.index,
                          ));
                        }
                        if (_tabController.index == 4) {
                          Get.to(SearchCreatorResultPage(
                            value: _textFieldController.text,
                            type: _tabController.index,
                          ));
                        }
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTextField() {
    hintType = _tabController.index;
    String hint;
    if (hintType == 0) {
      hint = 'search events..';
    }
    if (hintType == 1) {
      hint = 'search comics..';
    }
    if (hintType == 2) {
      hint = 'search series..';
    }
    if (hintType == 3) {
      hint = 'search characters..';
    }
    if (hintType == 4) {
      hint = 'search creators..';
    }
    if (hintType == 5) {
      hint = 'stories search not supported';
    }

    return TextField(
      autofocus: true,
      controller: _textFieldController,
      textAlign: TextAlign.start,
      cursorColor: MyColors.detail_text_color,
      focusNode: _focusNode,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
      ),
      style: TextStyle(fontSize: 18, color: MyColors.detail_text_color),
      onSubmitted: (value) {
        Timer timer = new Timer(new Duration(milliseconds: 500), () {
          if (value.length > 0) {
            if (_tabController.index == 0) {
              Get.to(SearchEventResultPage(
                value: value,
                type: _tabController.index,
              ));
            }
            if (_tabController.index == 1) {
              Get.to(SearchComicResultPage(
                value: value,
                type: _tabController.index,
              ));
            }
            if (_tabController.index == 2) {
              Get.to(SearchSeriesResultPage(
                value: value,
                type: _tabController.index,
              ));
            }
            if (_tabController.index == 3) {
              Get.to(SearchCharacterResultPage(
                value: value,
                type: _tabController.index,
              ));
            }
            if (_tabController.index == 4) {
              Get.to(SearchCreatorResultPage(
                value: value,
                type: _tabController.index,
              ));
            }
          }
        });
      },
    );
  }
}
