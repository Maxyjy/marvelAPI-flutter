import 'dart:convert';
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


class SeeAllStories extends StatefulWidget {
  final int id;
  final int type;
  SeeAllStories({Key key, @required this.id,this.type}) : super(key: key);

  @override
  _TabPageState createState() => new _TabPageState(id,type);

}

class _TabPageState extends State<SeeAllStories> with AutomaticKeepAliveClientMixin{
  _TabPageState(int id,int type) {
    this.id = id;
    this.type= type;
  }

  // 总数
  int _count = 0;
  int total;
  String _host="http://gateway.marvel.com";

  String _getEventStoriesUrl="/v1/public/events";
  String _getComicStoriesUrl="/v1/public/comics";
  String _getSeriesStoriesUrl="/v1/public/series";
  String _getCharacterStoriesUrl="/v1/public/characters";
  String _getCreatorStoriesUrl="/v1/public/creators";

  String _privateKey="2b018f19399848cc6d35b8da8cc480d4016c34ed";
  String _publicKey="c5ac95ce33d844d8ef3a9664eaff803d";
  String timeStamp="";
  String hash="";
  StoriesDataEntity stories;
  List<StoriesDataDataResult> storiesEntityList=new List<StoriesDataDataResult>();
  int offset;
  int id;
  int type;

  Future<bool> getCharacters() async{
    getTimeStamp();
    getHash();

    Map<String, dynamic> paras = {"apikey":_publicKey,"ts":timeStamp,"hash":hash,"offset":_count};

    String url;
    if(type==1){url=_host+_getEventStoriesUrl+'/'+id.toString()+'/stories';}
    if(type==2){url=_host+_getComicStoriesUrl+'/'+id.toString()+'/stories';}
    if(type==3){url=_host+_getSeriesStoriesUrl+'/'+id.toString()+'/stories';}
    if(type==4){url=_host+_getCharacterStoriesUrl+'/'+id.toString()+'/stories';}
    if(type==5){url=_host+_getCreatorStoriesUrl+'/'+id.toString()+'/stories';}

    Dio dio = Dio();
    final response = await dio.get(

      url,

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
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: MyColors.detail_appbar_bg,
        title: Row(
          children: <Widget>[
            Text('See All Stories',textScaleFactor: 1.0,),

          ],
        ),
      ),
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
                          "Loading Data From Marvel Universe..",
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
                                          child:  Text(
                                            storiesEntityList[index].title+'...',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5, textScaleFactor: 1.0,
                                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:MyColors.detail_text_color),
                                          ),
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
          _count=0;
          await getCharacters();
          await Future.delayed(Duration(seconds: 0), () {
            setState(() {
              _count = stories.data.count;
            });
          });
        },
        onLoad: () async {
          await getCharacters();
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
  bool get wantKeepAlive => true;//是否保存状态


}





