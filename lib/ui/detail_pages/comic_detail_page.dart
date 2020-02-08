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
import 'package:marvel_max/bean/detail_comic_character_entity.dart';
import 'package:marvel_max/bean/detail_comic_series_entity.dart';
import 'package:marvel_max/bean/detail_event_character_entity.dart';
import 'package:marvel_max/bean/detail_event_comic_entity.dart';
import 'package:marvel_max/bean/detail_event_series_entity.dart';
import 'package:marvel_max/bean/event_data_entity.dart';
import 'package:marvel_max/bean/series_data_entity.dart';
import 'package:marvel_max/photo_view.dart';
import 'package:marvel_max/ui/detail_pages/series_detail_page.dart';
import 'package:marvel_max/ui/see_all_pages/see_all_comics.dart';
import 'package:marvel_max/utils/photo_view_hero_attributes.dart';
import 'package:marvel_max/bean/detail_event_character_entity.dart';
import 'package:marvel_max/bean/character_entity.dart';
import 'package:marvel_max/bean/character_data_entity.dart';
import '../../MyColors.dart';
import 'package:marvel_max/ui/see_all_pages/see_all_creators.dart';
import 'package:marvel_max/ui/see_all_pages/see_all_stories.dart';
import 'package:marvel_max/ui/see_all_pages/web_view_test.dart';
import 'character_detail_page.dart';

class ComicDetailPage extends StatefulWidget {
  final ComicDataDataResult comic;
  ComicDetailPage({Key key, @required this.comic}) : super(key: key);

  @override
  _TabPageState createState() => new _TabPageState(comic);
}

class _TabPageState extends State<ComicDetailPage>
    with AutomaticKeepAliveClientMixin {
  _TabPageState(ComicDataDataResult comic) {
    this.comic = comic;
  }
  ComicDataDataResult comic;

  // 总数
  int _count = 0;
  int total;
  int _comiccount = 0;
  int totalComic;
  int swiperindex;
  int _seriescount = 0;
  int totalSeries;

  String _host = "http://gateway.marvel.com";
  String _getDetailComicCharacterUrl = "/v1/public/comics/";
  String _privateKey = "2b018f19399848cc6d35b8da8cc480d4016c34ed";
  String _publicKey = "c5ac95ce33d844d8ef3a9664eaff803d";
  String timeStamp = "";
  String hash = "";

  DetailComicCharacterEntity detailComicCharacterEntity;
  List<DetailComicCharacterDataResult> comicsCharacterEntityList =
      new List<DetailComicCharacterDataResult>();

  DetailComicSeriesEntity detailComicSeriesEntity;


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
        _getDetailComicCharacterUrl +
        comic.id.toString() +
        '/characters';
    print(url);
    Dio dio = Dio();
    final response = await dio.get(
      url,
      queryParameters: paras,
    );
    print(response.statusCode);
    Map userMap = json.decode(response.toString());

    detailComicCharacterEntity =
        new DetailComicCharacterEntity.fromJson(userMap);
    comicsCharacterEntityList.addAll(detailComicCharacterEntity.data.results);

    characters=new CharacterDataEntity.fromJson(userMap);
    jumpToCharacter.addAll(characters.data.results);


    total = detailComicCharacterEntity.data.total;

    return false;
  }

  Future<bool> getDetailSeries() async {
    getTimeStamp();
    getHash();

//http://gateway.marvel.com/v1/public/series/216

    Map<String, dynamic> paras = {
      "apikey": _publicKey,
      "ts": timeStamp,
      "hash": hash,
    };

    String url = comic.series.resourceURI;
    print(url);
    Dio dio = Dio();
    final response = await dio.get(
      url,
      queryParameters: paras,
    );
    print(response.statusCode);
    Map userMap = json.decode(response.toString());

    detailComicSeriesEntity = new DetailComicSeriesEntity.fromJson(userMap);
    series=new SeriesDataEntity.fromJson(userMap);


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

  firstCharactersRefresh() async {
    if(comic.characters.available!=0) {
      await getDetailCharacter();
    }


    await Future.delayed(Duration(seconds: 0), () {
      setState(() {
        _count = comicsCharacterEntityList.length;
      });
    });
  }
  firstSeriesRefresh() async {

    await getDetailSeries();

    await Future.delayed(Duration(seconds: 0), () {
      setState(() {

      });
    });
  }

  Widget buildCharacterList() {
    if (comic.characters.available == 0) {
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
                textColor: Colors.white70,
                infoColor: Colors.white70,
              ),
              footer: ClassicalFooter(
                textColor: Colors.white70,
                infoColor: Colors.white70,
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
                    _count = detailComicCharacterEntity.data.count;
                  });
                });
              },
              onLoad: () async {
                await getDetailCharacter();
                await Future.delayed(Duration(seconds: 0), () {
                  setState(() {
                    _count += detailComicCharacterEntity.data.count;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  Widget buildStartEndColumn() {
    if (detailComicSeriesEntity.data.results[0].startYear == null) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),

        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'StartTime: Not Found',
              style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
              textScaleFactor: 1.0,
            ),
          ),
          Container(
            child: Text(
              'EndTime: Not Found',
              style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
              textScaleFactor: 1.0,
            ),
          ),
        ],
      ),);
    }
    return Container(   padding: EdgeInsets.fromLTRB(15, 0, 0, 0),child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(

          child: Text(
            'StartTime: ' + detailComicSeriesEntity.data.results[0].startYear.toString(),
            style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
            textScaleFactor: 1.0,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(
            'EndTime: ' + detailComicSeriesEntity.data.results[0].endYear.toString(),
            style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
            textScaleFactor: 1.0,
          ),
        ),
      ],
    ),);
  }
  Widget buildStories() {
    if (comic.stories.available ==0) {
      return Container();
    }
    String temp='';
    for(int i=0;i<=comic.stories.returned-1;i++)
    {
      if(comic.stories.items[i].name.length==0){
        temp="( Name Not Found )"+'\n';

      }else {
        temp = temp + comic.stories.items[i].name + '\n';
      }
    }
    if(comic.stories.returned==20) {
      temp = temp + '...' +
          (comic.stories.available - comic.stories.returned).toString() +
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
                  color: MyColors.detail_container_bg,elevation: 0,child:Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),child: Text(
                'See All ',textAlign: TextAlign.end,
                style: TextStyle(color: MyColors.detail_see_all_text_color, fontSize: 14),
                textScaleFactor: 1.0,
              ),),onPressed:(){

                Get.to(SeeAllStories(
                  id:comic.id,
                  type:2,
                ));

              }


              )),),

        ],),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          alignment: Alignment.centerLeft,child: Text('Available: '+comic.stories.available.toString(),textScaleFactor: 1.0,style: TextStyle(fontSize: 18,height: 1.2,color: MyColors.detail_text_color),)
      ),
      Container(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
          alignment: Alignment.centerLeft,child: Text(temp,textScaleFactor: 1.0,style: TextStyle(height: 1.5,color: MyColors.detail_text_color),)
      ),
      Padding(padding: EdgeInsets.only(bottom: 30),),

    ],),);
  }
  Widget buildSeriesContainer() {
    if (detailComicSeriesEntity != null) {
      return Container(
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
        ]),
        child: Column(
          children: <Widget>[

            Column(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 5, 20),

                height: 80.0,
                child: Row(children: <Widget>[
                  Expanded(child:  Container(alignment: Alignment.centerLeft,child:  Text(
                    'Series',textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textScaleFactor: 1.0,
                  ),),),
                  Expanded(child:  Container(alignment: Alignment.centerRight,

                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          color: MyColors.detail_container_bg,
elevation: 0,
                          onPressed: (){

                       Get.to(SeriesDetailPageTest(
                         series: series.data.results[0],
                       ));

                     },child: Container(child: Text(
                        'See Detail ',textAlign: TextAlign.end,
                        style: TextStyle(color: MyColors.detail_see_all_text_color, fontSize: 14),
                        textScaleFactor: 1.0,
                      ),),

                      )),),

                ],),
              ),
              Row(
                children: <Widget>[Expanded(child: Container( padding: EdgeInsets.fromLTRB(15, 0, 15, 15),child: Text(
                  '' + detailComicSeriesEntity.data.results[0].title,overflow: TextOverflow.ellipsis,maxLines: 5,textScaleFactor: 1.0,
                  style: TextStyle(fontSize: 16, color: MyColors.detail_text_color),
                ),),)],

              ),

            ],),




            buildStartEndColumn(),
            Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Text('Rating: '+detailComicSeriesEntity.data.results[0].rating,overflow: TextOverflow.ellipsis,maxLines: 1,textScaleFactor: 1.0,
                  style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),),

              ),
              Container(

                padding: EdgeInsets.fromLTRB(10, 15, 15, 0),
                child: Text('Type: '+detailComicSeriesEntity.data.results[0].type,overflow: TextOverflow.ellipsis,maxLines: 1,textScaleFactor: 1.0,
                  style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),),

              ),


            ],),
            buildSeriesDesc(),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 200.0,

                child: RaisedButton(

                  color:MyColors.image_holder_bg,clipBehavior:Clip.none,
                  elevation:0,highlightElevation:0,disabledElevation:0,

                  child:
                  Container(

                    width: 200.0,

                    child:
                    Image.network(detailComicSeriesEntity.data.results[0].thumbnail.path+'.'+detailComicSeriesEntity.data.results[0].thumbnail.extension,fit: BoxFit.fitWidth,),
                  ),


                  onPressed: openDialog(context,detailComicSeriesEntity.data.results[0].thumbnail.path+'.'+detailComicSeriesEntity.data.results[0].thumbnail.extension,),
                  padding:EdgeInsets.all(0),
                ),


            ),
            Padding(padding: EdgeInsets.only(top: 50),),
          ],
        ),
      );
    }
    return Container();
  }

  Widget buildSeriesDesc() {
    if (detailComicSeriesEntity.data.results[0].description != null &&
        detailComicSeriesEntity.data.results[0].description.toString().length >
            0) {
      return
        Container(
          padding: EdgeInsets.fromLTRB(15,10, 15, 0),
          child: Text(
          detailComicSeriesEntity.data.results[0].description,overflow: TextOverflow.ellipsis,textScaleFactor: 1.0,maxLines: 20,
          textAlign:TextAlign.left,style: TextStyle(fontSize: 16, color: MyColors.detail_text_color,),
        ),);


    }
    return Container();
  }

  Widget buildCreator() {
    if (comic.creators.available == 0) {
      return Container();
    }
    String showCreatorName = '';
    for (int i = 0; i < comic.creators.returned; i++) {
      showCreatorName = showCreatorName + comic.creators.items[i].name + '\n';
    }
    String showCreatorRole = '';
    for (int i = 0; i < comic.creators.returned; i++) {
      showCreatorRole =
          showCreatorRole + 'Role:' + comic.creators.items[i].role + '\n';
    }
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.only(bottom: 15),
      width: double.infinity,
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
                      id:comic.id,
                      type: 2,
                    ));

                  }


                  )),),

            ],),
          ),
         Container(
           padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
           child:  Row(
           children: <Widget>[
             Expanded(
               child: Container(
                   alignment: Alignment.topLeft,
                   child: Text(
                     showCreatorName,textScaleFactor: 1.0,
                     style: TextStyle(
                         height: 1.2, color: MyColors.detail_text_color),
                   )),
             ),
             Expanded(
               child: Container(
                 alignment: Alignment.topLeft,
                 child: Text(
                   showCreatorRole,textScaleFactor: 1.0,
                   style: TextStyle(
                       height: 1.2, color: MyColors.detail_text_color),
                 ),
               ),
             ),
           ],
         ),),
        ],
      ),
    );
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
                    decoration: new BoxDecoration(color: MyColors.image_holder_bg),
                    height: 150.0,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        width: 130.0,
                        height: 150.0,
                        child: Image.network(
                          comicsCharacterEntityList[index].thumbnail.path +
                              '.' +
                              comicsCharacterEntityList[index]
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
                              comicsCharacterEntityList[index].name,
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
                          comicsCharacterEntityList[index].thumbnail.path +
                              '.' +
                              comicsCharacterEntityList[index]
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
                              comicsCharacterEntityList[index].name,
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

  Widget buildDateColumn() {
    if (comic == null) {
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
            '' + comic.dates[0].date.split('T')[0],
            style: TextStyle(fontSize: 14, color: MyColors.detail_text_color),
            textScaleFactor: 1.0,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 8, 15, 0),
          child: Text(
            '' + comic.dates[1].date.split('T')[0],
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
        title: Text('Comic'),
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
                        comic.title,
                        style: TextStyle(
                            fontSize: 25, color: MyColors.detail_text_color),
                        textScaleFactor: 1.0,
                      ),
                    ),
                    buildVariantDesc(),
                    Container(

                      child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                          child: Text(
                            'ID: ' + comic.id.toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: MyColors.detail_hint_color),
                            textScaleFactor: 1.0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          child: Text(
                            'IssueNumber: ' + comic.issueNumber.toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: MyColors.detail_hint_color),
                            textScaleFactor: 1.0,
                          ),
                        ),

                      ],
                    ),),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Text(
                        'Format: ' + comic.format,
                        style: TextStyle(
                            fontSize: 14,
                            color: MyColors.detail_hint_color),
                        textScaleFactor: 1.0,maxLines: 1,overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                      child: Text(
                        'Modified: ' + comic.modified.split('t')[0],
                        style: TextStyle(
                            fontSize: 14, color: MyColors.detail_hint_color),
                        textScaleFactor: 1.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 0),
                      child: Text(
                        'PrintPrice: ' + comic.prices[0].price.toString()+'\$',
                        style: TextStyle(
                            fontSize: 16, color: MyColors.detail_text_color),
                        textScaleFactor: 1.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Text(
                        comic.description,
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
                                'On Sale Date: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: MyColors.detail_text_color),
                                textScaleFactor: 1.0,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                              child: Text(
                                'Foc Date: ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: MyColors.detail_text_color),
                                textScaleFactor: 1.0,
                              ),
                            ),
                          ],
                        ),
                        buildDateColumn(),
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                      height: 375.0,
                      width: 250.0,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: RaisedButton(
                          color: MyColors.image_holder_bg,
                          elevation: 0,
                          disabledElevation: 0,
                          highlightElevation: 0,
                          child: Container(
                            height: 375.0,
                            width: 250.0,
                            child: Image.network(
                              comic.thumbnail.path +
                                  '.' +
                                  comic.thumbnail.extension,
                              fit: BoxFit.fill,
                            ),
                          ),
                          onPressed: openDialog(
                            context,
                            comic.thumbnail.path +
                                '.' +
                                comic.thumbnail.extension,
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
              buildSeriesContainer(),
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
    // TODO: implement initState
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildVariantDesc() {
    if (comic.variantDescription.length > 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Text(
          'Variant: ' + comic.variantDescription,
          style: TextStyle(fontSize: 18, color: MyColors.white),
          textScaleFactor: 1.0,
        ),
      );
    }
    return Container();
  }

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
