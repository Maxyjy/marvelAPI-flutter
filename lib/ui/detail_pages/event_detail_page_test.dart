import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:convert/convert.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:marvel_max/bean/comic_data_entity.dart';
import 'package:marvel_max/bean/detail_event_character_entity.dart';
import 'package:marvel_max/bean/detail_event_comic_entity.dart';
import 'package:marvel_max/bean/detail_event_series_entity.dart';
import 'package:marvel_max/bean/event_data_entity.dart';
import 'package:marvel_max/bean/series_data_entity.dart';
import 'package:marvel_max/photo_view.dart';

import 'package:marvel_max/ui/detail_pages/series_detail_page.dart';
import 'package:marvel_max/ui/see_all_pages/see_all_comics.dart';
import 'package:marvel_max/ui/see_all_pages/see_all_stories.dart';

import 'package:marvel_max/utils/photo_view_hero_attributes.dart';
import 'package:marvel_max/bean/detail_event_character_entity.dart';

import 'package:marvel_max/bean/character_entity.dart';
import 'package:marvel_max/bean/character_data_entity.dart';

import '../../MyColors.dart';
import 'package:marvel_max/ui/see_all_pages/see_all_creators.dart';

import 'character_detail_page.dart';
import 'comic_detail_page.dart';



class EventDetailPageTest extends StatefulWidget {
  final EventDataDataResult event;
  EventDetailPageTest({Key key, @required this.event}) : super(key: key);

  @override
  _TabPageState createState() => new _TabPageState(event);
}

class _TabPageState extends State<EventDetailPageTest>
    with AutomaticKeepAliveClientMixin {
  _TabPageState(EventDataDataResult event) {
    this.event = event;
  }
  EventDataDataResult event;

  // 总数
  int _count = 0;
  int total;
  int _comiccount = 0;
  int totalComic;
  int swiperindex;
  int _seriescount = 0;
  int totalSeries;

  String _host = "http://gateway.marvel.com";
  String _getDetailEventCharacterUrl = "/v1/public/events/";
  String _privateKey = "2b018f19399848cc6d35b8da8cc480d4016c34ed";
  String _publicKey = "c5ac95ce33d844d8ef3a9664eaff803d";
  String timeStamp = "";
  String hash = "";

  DetailEventCharacterEntity detailEventCharacterEntity;
  List<DetailEventCharacterDataResult> eventsCharacterEntityList =
      new List<DetailEventCharacterDataResult>();

  DetailEventComicEntity detailEventComicEntity;
  List<DetailEventComicDataResult> eventsComicsEntityList =
      new List<DetailEventComicDataResult>();

  DetailEventSeriesEntity detailEventSeriesEntity;
  List<DetailEventSeriesDataResult> eventsSeriesEntityList =
  new List<DetailEventSeriesDataResult>();


  ComicDataEntity comics;
  List<ComicDataDataResult> jumpToComic=new List<ComicDataDataResult>();


  SeriesDataEntity series;
  List<SeriesDataDataResult> jumpToSeries=new List<SeriesDataDataResult>();

  CharacterDataEntity characters;
  List<TestDataResult> jumpToCharacter=new List<TestDataResult>();

  int offset;

  Future<bool> getDetailCharacter() async {
    getTimeStamp();
    getHash();

    Map<String, dynamic> paras = {
      "apikey": _publicKey,
      "ts": timeStamp,
      "hash": hash,
      "offset": _count,
    };

    String url = _host +
        _getDetailEventCharacterUrl +
        event.id.toString() +
        '/characters';
    print(url);
    Dio dio = Dio();
    final response = await dio.get(
      url,
      queryParameters: paras,
    );
    print(response.statusCode);
    Map userMap = json.decode(response.toString());

    detailEventCharacterEntity =
        new DetailEventCharacterEntity.fromJson(userMap);
    eventsCharacterEntityList.addAll(detailEventCharacterEntity.data.results);

    characters=new CharacterDataEntity.fromJson(userMap);
    jumpToCharacter.addAll(characters.data.results);

    total = detailEventCharacterEntity.data.total;

    return false;
  }

  Future<bool> getDetailComic() async {
    getTimeStamp();
    getHash();

    Map<String, dynamic> paras = {
      "apikey": _publicKey,
      "ts": timeStamp,
      "hash": hash,
      "offset": _comiccount,
    };

    String url =
        _host + _getDetailEventCharacterUrl + event.id.toString() + '/comics';
    print(url);
    Dio dio = Dio();
    final response = await dio.get(
      url,
      queryParameters: paras,
    );
    print(response.statusCode);
    Map userMap = json.decode(response.toString());

    detailEventComicEntity = new DetailEventComicEntity.fromJson(userMap);

    comics = new ComicDataEntity.fromJson(userMap);
    jumpToComic.addAll(comics.data.results);

    eventsComicsEntityList.addAll(detailEventComicEntity.data.results);

    totalComic = detailEventComicEntity.data.total;

    return false;
  }

  Future<bool> getDetailSeries() async {
    getTimeStamp();
    getHash();

    Map<String, dynamic> paras = {
      "apikey": _publicKey,
      "ts": timeStamp,
      "hash": hash,
      "offset": _seriescount,
    };

    String url =
        _host + _getDetailEventCharacterUrl + event.id.toString() + '/series';
    print(url);
    Dio dio = Dio();
    final response = await dio.get(
      url,
      queryParameters: paras,
    );
    print(response.statusCode);
    Map userMap = json.decode(response.toString());




    detailEventSeriesEntity = new DetailEventSeriesEntity.fromJson(userMap);
    eventsSeriesEntityList.addAll(detailEventSeriesEntity.data.results);

    series = new SeriesDataEntity.fromJson(userMap);
    jumpToSeries.addAll(series.data.results);

    totalSeries = detailEventSeriesEntity.data.total;

    return false;
  }

  void getTimeStamp() {
    timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
  }

  void getHash() {
    var content =
        new Utf8Encoder().convert(timeStamp + _privateKey + _publicKey);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    hash = hex.encode(digest.bytes);
  }

  Widget buildCharactersText(
      EventDataDataResultsCharacters eventDataDataResultsCharacters) {
    if (eventDataDataResultsCharacters.available == 0) {
      return new Text('',textScaleFactor: 1.0,);
    }

    String characters = 'characters: ';
    for (int i = 0; i < eventDataDataResultsCharacters.items.length; i++) {
      characters =
          characters + eventDataDataResultsCharacters.items[i].name + '  ';
    }
    return new Text(characters,textScaleFactor: 1.0,);
  }

  NetworkImage buildNetWorkImage(
      EventDataDataResultsThumbnail eventDataDataResultsThumbnail) {
    String url = "";
    url = eventDataDataResultsThumbnail.path +
        "." +
        eventDataDataResultsThumbnail.extension;
    return NetworkImage(url);
  }



  firstSeriesRefresh() async {
    if(event.series.available!=0){
      await getDetailSeries();}
    await Future.delayed(Duration(seconds: 0), () {
      setState(() {
        _seriescount = eventsSeriesEntityList.length;
      });
    });

  }
  firstCharactersRefresh() async {
    if(event.characters.available!=0){
      await getDetailCharacter();}
    await Future.delayed(Duration(seconds: 0), () {
      setState(() {
        _count = eventsCharacterEntityList.length;

      });
    });

  }
  firstComicsRefresh() async {
    if(event.comics.available!=0){
      await  getDetailComic();}
    await Future.delayed(Duration(seconds: 0), () {
      setState(() {
        swiperindex=eventsComicsEntityList.length~/2;
        _comiccount = eventsComicsEntityList.length;

      });
    });

  }
  Widget buildCharacterList() {
    if (event.characters.available == 0) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 15),

      width: double.infinity,
      height: 300.0,
      decoration:
          BoxDecoration(color: MyColors.detail_container_bg, boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 15.0), //阴影xy轴偏移量
            blurRadius: 15.0, //阴影模糊程度
            spreadRadius: 1.0 //阴影扩散程度
            )
      ]),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Text(
              'Characters',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textScaleFactor: 1.0,
            ),
          ),
          Container(
            height: 200.0,
            width: double.infinity,
            child: EasyRefresh.custom(
              header: ClassicalHeader(

                textColor:Colors.white70,
                infoColor:Colors.white70,


              ),
              footer: ClassicalFooter(
                textColor:Colors.white70,
                infoColor:Colors.white70,
              ),
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      print(index);
                      return buildCharacterCard(index);
                    },
                    childCount: _count,
                  ),
                ),
              ],
              onRefresh: () async {
                await getDetailCharacter();
                await Future.delayed(Duration(seconds: 0), () {
                  setState(() {
                    _count = detailEventCharacterEntity.data.count;
                  });
                });
              },
              onLoad: () async {
                await getDetailCharacter();
                await Future.delayed(Duration(seconds: 0), () {
                  setState(() {
                    _count += detailEventCharacterEntity.data.count;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildComicList() {
    if (event.comics.available == 0) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 460.0,
      decoration:
          BoxDecoration(color: MyColors.detail_container_bg, boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 15.0), //阴影xy轴偏移量
            blurRadius: 15.0, //阴影模糊程度
            spreadRadius: 1.0 //阴影扩散程度
            )
      ]),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 5, 20),

            height: 80.0,
            child: Row(children: <Widget>[
              Expanded(child:  Container(alignment: Alignment.centerLeft,child:  Text(
                'Comics',textAlign: TextAlign.end,
                style: TextStyle(color: Colors.white, fontSize: 20),
                textScaleFactor: 1.0,
              ),),),
              Expanded(child:  Container(alignment: Alignment.centerRight,

                child:  RaisedButton(
                    color: MyColors.detail_container_bg,
                    elevation: 0,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child:Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text(
                  'See All ',textAlign: TextAlign.end,
                  style: TextStyle(color: MyColors.detail_see_all_text_color, fontSize: 14),
                  textScaleFactor: 1.0,
                ),),onPressed:(){

                  Get.to(SeeAllComics(
                      id:event.id,
                    type: 1,
                  ));
                }
                )),),
            ],),
          ),

          Container(
            height: 360.0,
            width: double.infinity,
            child: Container(

                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 300.0,
                              child: RaisedButton(
                                elevation: 0,
                                disabledElevation: 0,
                                highlightElevation: 0,
                                color: MyColors.image_holder_bg,
                                child: Container(
                                  width: 245.0,
                                  height: 300.0,
                                  child: Image.network(
                                    eventsComicsEntityList[index]
                                            .thumbnail
                                            .path +
                                        '.' +
                                        eventsComicsEntityList[index]
                                            .thumbnail
                                            .extension,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                  onPressed: () {
                                    Get.to(ComicDetailPage(
                                      comic: jumpToComic[index],
                                    ));
                                  },
                                padding: EdgeInsets.all(0),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Text(
                                eventsComicsEntityList[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: MyColors.detail_text_color),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: _comiccount,
                  viewportFraction: 0.6,
                  scale: 0.8,
                  autoplay: false,
                  loop: false,
                ),

            ),
          ),
        ],
      ),
    );
  }

  Widget buildSeriesList() {
    if (event.series.available == 0) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 300.0,
      decoration:
      BoxDecoration(color: MyColors.detail_container_bg, boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 15.0), //阴影xy轴偏移量
            blurRadius: 15.0, //阴影模糊程度
            spreadRadius: 1.0 //阴影扩散程度
        )
      ]),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            alignment: Alignment.centerLeft,
            height: 60.0,
            child: Text(
              'Series',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textScaleFactor: 1.0,
            ),
          ),
          Container(
            height: 200.0,
            width: double.infinity,
            child: EasyRefresh.custom(
              header: ClassicalHeader(

                textColor:Colors.white70,
                infoColor:Colors.white70,


              ),
              footer: ClassicalFooter(
                textColor:Colors.white70,
                infoColor:Colors.white70,
              ),
              scrollDirection: Axis.horizontal,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      print(index);
                      return buildSeriesCard(index);
                    },
                    childCount: _seriescount,
                  ),
                ),
              ],
              onRefresh: () async {
                await getDetailSeries();
                await Future.delayed(Duration(seconds: 0), () {
                  setState(() {
                    _seriescount = detailEventSeriesEntity.data.count;
                  });
                });
              },
              onLoad: () async {
                await getDetailSeries();
                await Future.delayed(Duration(seconds: 0), () {
                  setState(() {
                    _seriescount += detailEventSeriesEntity.data.count;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCreator() {
    if (event.creators.available ==0) {
      return Container();
    }
    String showCreatorName='';
    for(int i=0;i<event.creators.returned;i++){
      showCreatorName=showCreatorName+event.creators.items[i].name+'\n';
    }
    String showCreatorRole='';
    for(int i=0;i<event.creators.returned;i++){
      showCreatorRole=showCreatorRole+'Role:'+event.creators.items[i].role+'\n';
    }
    return  Container(
      padding: EdgeInsets.only(bottom: 15),
      margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        decoration:
        BoxDecoration(color: MyColors.detail_container_bg, boxShadow: [
        BoxShadow(
        color: Colors.black26,
        offset: Offset(0.0, 15.0), //阴影xy轴偏移量
    blurRadius: 15.0, //阴影模糊程度
    spreadRadius: 1.0 //阴影扩散程度
    )
    ]) ,child: Column(children: <Widget>[

      Container(
        padding: EdgeInsets.fromLTRB(15, 15, 5, 20),

        height: 80.0,
        child: Row(children: <Widget>[
          Expanded(child:  Container(alignment: Alignment.centerLeft,child:  Text(
            'Creators',textAlign: TextAlign.end,
            style: TextStyle(color: Colors.white, fontSize: 20),
            textScaleFactor: 1.0,
          ),),),
          Expanded(child:  Container(alignment: Alignment.centerRight,

              child:  RaisedButton(
                  color: MyColors.detail_container_bg,
                  elevation: 0,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text(
                    'See All ',textAlign: TextAlign.end,
                    style: TextStyle(color: MyColors.detail_see_all_text_color, fontSize: 14),
                    textScaleFactor: 1.0,
                  ),),onPressed:(){

                Get.to(SeeAllCreators(
                  id:event.id,
                  type: 1,
                ));

              }


              )),),

        ],),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child:  Row(children: <Widget>[
        Expanded(
          child: Container(alignment: Alignment.topLeft,child: Text(showCreatorName,textScaleFactor: 1.0,style: TextStyle(height: 1.2,color: MyColors.detail_text_color),)
          ),
        ),
        Expanded(
          child: Container(alignment: Alignment.topLeft,child: Text(showCreatorRole,textScaleFactor: 1.0,style: TextStyle(height: 1.2,color: MyColors.detail_text_color),),

          ),
        ),
      ],),),


    ],),);
  }
  Widget buildStories() {
    if (event.stories.available ==0) {
      return Container();
    }
    String temp='';
    for(int i=0;i<=event.stories.returned-1;i++)
    {
      if(event.stories.items[i].name.length==0){
        temp="( Name Not Found )"+'\n';

      }else {
        temp = temp + event.stories.items[i].name + '\n';
      }
    }
    if(event.stories.returned==20) {
      temp = temp + '...' +
          (event.stories.available - event.stories.returned).toString() +
          ' Stories';
    }
    return  Container(
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      decoration:
      BoxDecoration(color: MyColors.detail_container_bg, boxShadow: [
        BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 15.0), //阴影xy轴偏移量
            blurRadius: 15.0, //阴影模糊程度
            spreadRadius: 1.0 //阴影扩散程度
        )
      ]) ,child: Column(children: <Widget>[

      Container(
        padding: EdgeInsets.fromLTRB(15, 15, 5, 20),

        height: 80.0,
        child: Row(children: <Widget>[
          Expanded(child:  Container(alignment: Alignment.centerLeft,child:  Text(
            'Stories',textAlign: TextAlign.end,
            style: TextStyle(color: Colors.white, fontSize: 20),
            textScaleFactor: 1.0,
          ),),),
          Expanded(child:  Container(alignment: Alignment.centerRight,

              child:  RaisedButton(
                color: MyColors.detail_container_bg,
                  elevation: 0,
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child:Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text(
                'See All ',textAlign: TextAlign.end,
                style: TextStyle(color: MyColors.detail_see_all_text_color, fontSize: 14),
                textScaleFactor: 1.0,
              ),),onPressed:(){

                Get.to(SeeAllStories(
                  id:event.id,
                  type: 1,
                ));

              }


              )),),

        ],),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          alignment: Alignment.topLeft,child: Text('Available: '+event.stories.available.toString(),textScaleFactor: 1.0,style: TextStyle(fontSize: 18,height: 1.2,color: MyColors.detail_text_color),)
      ),
      Container(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          alignment: Alignment.topLeft,child: Text(temp,textScaleFactor: 1.0,style: TextStyle(height: 1.5,color: MyColors.detail_text_color),)
      ),
      Padding(padding: EdgeInsets.only(bottom: 30),),

    ],),);
  }

  Widget buildCharacterCard(int index) {
    if (index == 0) {
      return Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          ),
          GestureDetector(
            onTap: () {
              Get.to(CharacterDetailPageTest(
                character: jumpToCharacter[index],
              ));
            },

            child: Container(
            child: Container(
              width: 130.0,
              decoration: new BoxDecoration(color: MyColors.detail_card_bg),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(   color: MyColors.image_holder_bg,),
                    height: 150.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        width: 130.0,
                        height: 150.0,
                        child: Image.network(
                          eventsCharacterEntityList[index].thumbnail.path +
                              '.' +
                              eventsCharacterEntityList[index]
                                  .thumbnail
                                  .extension,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: MyColors.detail_card_bg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 110.0,
                            child: Text(
                              eventsCharacterEntityList[index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          ),
          GestureDetector(
            onTap: () {
              Get.to(CharacterDetailPageTest(
                character: jumpToCharacter[index],
              ));
            },

            child: Container(
            child: Container(
              width: 130.0,
              decoration: new BoxDecoration(color: MyColors.detail_card_bg),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(color: MyColors.image_holder_bg),
                    height: 150.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        width: 130.0,
                        height: 150.0,
                        child: Image.network(
                          eventsCharacterEntityList[index].thumbnail.path +
                              '.' +
                              eventsCharacterEntityList[index]
                                  .thumbnail
                                  .extension,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: MyColors.detail_card_bg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 110.0,
                            child: Text(
                              eventsCharacterEntityList[index].name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),),
        ],
      );
    }
  }

  Widget buildComicCard(int index) {
    if (index == 0) {
      return Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          ),
          Container(
            child: Container(
              width: 140.0,
              decoration: new BoxDecoration(color: MyColors.detail_card_bg),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(color: MyColors.detail_card_bg),
                    height: 200.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: RaisedButton(
                        elevation: 0,
                        disabledElevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          width: 140.0,
                          height: 200.0,
                          child: Image.network(
                            eventsComicsEntityList[index].thumbnail.path +
                                '.' +
                                eventsComicsEntityList[index]
                                    .thumbnail
                                    .extension,
                            fit: BoxFit.fill,
                          ),
                        ),
                        onPressed: openDialog(
                          context,
                          eventsComicsEntityList[index].thumbnail.path +
                              '.' +
                              eventsComicsEntityList[index].thumbnail.extension,
                        ),
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: MyColors.detail_card_bg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 110.0,
                            child: Text(
                              eventsComicsEntityList[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          ),
          Container(
            child: Container(
              width: 140.0,
              decoration: new BoxDecoration(color: MyColors.detail_card_bg),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(color: MyColors.detail_card_bg),
                    height: 200.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: RaisedButton(
                        elevation: 0,
                        disabledElevation: 0,
                        highlightElevation: 0,
                        child: Container(
                          width: 140.0,
                          height: 200.0,
                          child: Image.network(
                            eventsComicsEntityList[index].thumbnail.path +
                                '.' +
                                eventsComicsEntityList[index]
                                    .thumbnail
                                    .extension,
                            fit: BoxFit.fill,
                          ),
                        ),
                        onPressed: openDialog(
                          context,
                          eventsComicsEntityList[index].thumbnail.path +
                              '.' +
                              eventsComicsEntityList[index].thumbnail.extension,
                        ),
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: MyColors.detail_card_bg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 110.0,
                            child: Text(
                              eventsComicsEntityList[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget buildSeriesCard(int index) {
    if (index == 0) {
      return Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          ),
          GestureDetector(
            onTap: () {
              Get.to(SeriesDetailPageTest(
                series: jumpToSeries[index],
              ));
            },

            child: Container(
            child: Container(
              width: 130.0,
              decoration: new BoxDecoration(color: MyColors.detail_card_bg),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(color: MyColors.image_holder_bg),
                    height: 150.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        width: 130.0,
                        height: 150.0,
                        child: Image.network(
                          eventsSeriesEntityList[index].thumbnail.path +
                              '.' +
                              eventsSeriesEntityList[index]
                                  .thumbnail
                                  .extension,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: MyColors.detail_card_bg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 110.0,
                            child: Text(
                              eventsSeriesEntityList[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          ),
          GestureDetector(
            onTap: () {
              Get.to(SeriesDetailPageTest(
                series: jumpToSeries[index],
              ));
            },
            child: Container(
            child: Container(
              width: 130.0,
              decoration: new BoxDecoration(color: MyColors.detail_card_bg),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(color: MyColors.image_holder_bg),
                    height: 150.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        width: 130.0,
                        height: 150.0,
                        child: Image.network(
                          eventsSeriesEntityList[index].thumbnail.path +
                              '.' +
                              eventsSeriesEntityList[index]
                                  .thumbnail
                                  .extension,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: MyColors.detail_card_bg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 110.0,
                            child: Text(
                              eventsSeriesEntityList[index].title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),),
        ],
      );
    }
  }

  Widget buildStartEndColumn() {
    if (event.start == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Text(
              'Not Found',
              style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
              textScaleFactor: 1.0,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 8, 15, 0),
            child: Text(
              'Not Found',
              style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
              textScaleFactor: 1.0,
            ),
          ),
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
          child: Text(
            '' + event.start,
            style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
            textScaleFactor: 1.0,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 8, 15, 0),
          child: Text(
            '' + event.end,
            style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
            textScaleFactor: 1.0,
          ),
        ),
      ],
    );
  }

  VoidCallback openDialog(BuildContext context, String url) => () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: GestureDetector(
                child: Container(
                  child: PhotoView(
                    tightMode: true,
                    imageProvider: NetworkImage(url),
                    heroAttributes:
                        const PhotoViewHeroAttributes(tag: "someTag"),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            );
          },
        );
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.detail_bg,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: MyColors.detail_appbar_bg,
        title: Text('Event',textScaleFactor: 1.0,),
//        Row(
//          children: <Widget>[
//            Expanded(
//                child: Container(
//              alignment: Alignment.centerRight,
//              child: IconButton(
//                  highlightColor: Colors.transparent,
//                  icon: Icon(Icons.search),
//                  onPressed: () => print('1111')),
//            )),
//          ],
//        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: MyColors.detail_container_bg,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                          blurRadius: 15.0, //阴影模糊程度
                          spreadRadius: 1.0 //阴影扩散程度
                          )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
                      child: Text(
                        event.title,
                        style: TextStyle(
                            fontSize: 25, color: MyColors.detail_text_color),
                        textScaleFactor: 1.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Text(
                        'ID: ' + event.id.toString(),
                        style: TextStyle(
                            fontSize: 14, color: MyColors.detail_hint_color),
                        textScaleFactor: 1.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                      child: Text(
                        'Modified: ' + event.modified.split('T')[0],
                        style: TextStyle(
                            fontSize: 14, color: MyColors.detail_hint_color),
                        textScaleFactor: 1.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Text(
                        event.description,
                        style: TextStyle(
                            fontSize: 14, color: MyColors.detail_text_color),
                        textScaleFactor: 1.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Text(
                                'StartTime: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: MyColors.detail_text_color),
                                textScaleFactor: 1.0,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                              child: Text(
                                'EndTime: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: MyColors.detail_text_color),
                                textScaleFactor: 1.0,
                              ),
                            ),
                          ],
                        ),
                        buildStartEndColumn(),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      height: 250.0,
                      width: 250.0,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: RaisedButton(
                          color: MyColors.image_holder_bg,
                          elevation: 0,
                          disabledElevation: 0,
                          highlightElevation: 0,
                          child: Container(
                            height: 250.0,
                            width: 250.0,
                            child: Image.network(
                              event.thumbnail.path +
                                  '.' +
                                  event.thumbnail.extension,
                              fit: BoxFit.fill,
                            ),
                          ),
                          onPressed: openDialog(
                            context,
                            event.thumbnail.path +
                                '.' +
                                event.thumbnail.extension,
                          ),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    ),
                  ],
                ),
              ),

              buildCharacterList(),

              buildComicList(),

              buildSeriesList(),

              buildStories(),

              buildCreator(),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    firstCharactersRefresh();
    firstSeriesRefresh();
    firstComicsRefresh();
    // TODO: implement initState
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

//是否保存状态

}

class HeroPhotoViewWrapper extends StatelessWidget {
  const HeroPhotoViewWrapper({
    this.imageProvider,
    this.loadingChild,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final Widget loadingChild;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  Widget buildLoadingChild() {
    return CircularProgressIndicator(
      strokeWidth: 4.0,
      valueColor: new AlwaysStoppedAnimation<Color>(MyColors.app_bar),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: GestureDetector(
        onTapDown: (_) {
          Navigator.pop(context);
        },
        child: PhotoView(
          imageProvider: imageProvider,
          loadingChild: buildLoadingChild(),
          backgroundDecoration: backgroundDecoration,
          minScale: minScale,
          maxScale: maxScale,
          heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
        ),
      ),
    );
  }
}
