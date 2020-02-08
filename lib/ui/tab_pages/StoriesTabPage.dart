import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:convert/convert.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';



import 'package:marvel_max/bean/stories_data_entity.dart';
import 'package:marvel_max/ui/detail_pages/stories_detail_page.dart';

import '../../MyColors.dart';

class StoriesTabPage extends StatefulWidget {


  @override
  _TabPageState createState() => new _TabPageState();

}

class _TabPageState extends State<StoriesTabPage> with AutomaticKeepAliveClientMixin{
  // 总数
  int _count = 0;
  int total;
  String _host="http://gateway.marvel.com";
  String _getStoriesUrl="/v1/public/stories";
  String _privateKey="2b018f19399848cc6d35b8da8cc480d4016c34ed";
  String _publicKey="c5ac95ce33d844d8ef3a9664eaff803d";
  String timeStamp="";
  String hash="";
  StoriesDataEntity stories;
  List<StoriesDataDataResult> storiesEntityList=new List<StoriesDataDataResult>();
  int offset;


  Future<bool> getFreshStories() async{
    getTimeStamp();
    getHash();
    offset=Random().nextInt(11600);
    print(offset);
    Map<String, dynamic> paras = {"apikey":_publicKey,"ts":timeStamp,"hash":hash,"offset":offset};


    Dio dio = Dio();
    final response = await dio.get(
      _host+_getStoriesUrl,
      queryParameters: paras,);
    print(response.statusCode);



    Map userMap = json.decode(response.toString());
    stories = new StoriesDataEntity.fromJson(userMap);
    storiesEntityList=new List<StoriesDataDataResult>();
    storiesEntityList.addAll(stories.data.results);

    offset=offset+stories.data.count;
    total=stories.data.total;


    return false;

  }

  Future<bool> getStories() async{
    getTimeStamp();
    getHash();

    Map<String, dynamic> paras = {"apikey":_publicKey,"ts":timeStamp,"hash":hash,"offset":offset};


    Dio dio = Dio();
    final response = await dio.get(
      _host+_getStoriesUrl,
      queryParameters: paras,);
    print(response.statusCode);



    Map userMap = json.decode(response.toString());
    stories = new StoriesDataEntity.fromJson(userMap);

    storiesEntityList.addAll(stories.data.results);

    total=stories.data.total;


    return false;

  }

  void getTimeStamp() {
    timeStamp=DateTime.now().millisecondsSinceEpoch.toString();
  }

  void getHash() {
    var content = new Utf8Encoder().convert(timeStamp+_privateKey+_publicKey);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    hash= hex.encode(digest.bytes);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding:false,
      backgroundColor: MyColors.detail_bg,
      body: EasyRefresh.custom(

        header: ClassicalHeader(

          textColor:Colors.white70,
          infoColor:Colors.white70,


        ),
        footer: ClassicalFooter(
          textColor:Colors.white70,
          infoColor:Colors.white70,
        ),
        firstRefresh: true,
        firstRefreshWidget: Container(
          decoration: new BoxDecoration(color: MyColors.detail_bg),
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: SizedBox(
                height: 200.0,
                width: 300.0,
                child: Container(
                  color: MyColors.detail_bg,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitRotatingPlain(
                          color: MyColors.detail_text_color,
                          size: 25.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Loading Stories Data From Marvel Universe..",
                          textScaleFactor: 1.0,
                          style: TextStyle(fontSize: 12,color: MyColors.detail_text_color),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
        slivers: <Widget>[

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                print(index);
                return
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 8, 5, 0),
                    child: Container(
                      decoration: new BoxDecoration(color:MyColors.characters_card_bg),
                      child: Row(
                        children: <Widget>[


                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                               Get.to(StoriesDetailPageTest(
                                 stories: storiesEntityList[index],
                               ));
                              },

                              child: Container(

                                height: 100,
                                padding: EdgeInsets.all(
                                  10.0,
                                ),
                                color: MyColors.detail_card_bg,
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: <Widget>[
                                    Expanded(child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: storiesTitleTextBuild(index),
                                        ),
                                        Expanded(child: Container(
                                          margin: EdgeInsets.only(top: 0.0,bottom: 0.0,right:10.0),
                                          alignment: Alignment.bottomRight,
                                          child:  Text(
                                            'Modified: '+storiesEntityList[index].modified.split('T')[0],
                                            overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
                                            maxLines: 3,
                                            style: TextStyle(fontSize: 12,color:MyColors.detail_text_color),
                                          ),
                                        ),)

                                      ],
                                    ),)


                                  ],
                                )),),
                          ),
                        ],
                      ),
                    ),
                  );
              },
              childCount: _count,
            ),
          ),
        ],
        onRefresh: () async {
          await getFreshStories();
          await Future.delayed(Duration(seconds: 0), () {
            setState(() {
              _count = stories.data.count;
            });
          });
        },
        onLoad: () async {
          await getStories();
          await Future.delayed(Duration(seconds: 0), () {
            setState(() {
              _count += stories.data.count;

            });
          });
        },
      ),
    );
  }

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

  }

  @override
  bool get wantKeepAlive => true;

  Widget storiesTitleTextBuild(int index) {
    if(storiesEntityList[index].title.length==0){
      return  Text(
       'Name Not Found',
        overflow: TextOverflow.ellipsis,
        maxLines: 5, textScaleFactor: 1.0,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:MyColors.detail_text_color),
      );

    }
    return  Text(
      storiesEntityList[index].title+'...',
      overflow: TextOverflow.ellipsis,
      maxLines: 5, textScaleFactor: 1.0,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:MyColors.detail_text_color),
    );

  }//是否保存状态


}





