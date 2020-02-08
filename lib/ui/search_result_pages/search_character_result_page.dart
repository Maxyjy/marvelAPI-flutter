import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:convert/convert.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:marvel_max/photo_view.dart';

import 'package:marvel_max/ui/detail_pages/character_detail_page.dart';
import 'package:marvel_max/utils/photo_view_hero_attributes.dart';


import 'package:marvel_max/bean/character_data_entity.dart';

import '../../MyColors.dart';


class SearchCharacterResultPage extends StatefulWidget {
  final String value;
  final int type;
  SearchCharacterResultPage({Key key, @required this.value ,this.type}) : super(key: key);
  @override
  _TabPageState createState() => new _TabPageState(value,type);


}

class _TabPageState extends State<SearchCharacterResultPage> with AutomaticKeepAliveClientMixin{
  _TabPageState(String value,int type) {
    this.value = value;
    this.type = type;
  }

  String titleString='Characters Result';

  String value;
  int type;
  // 总数
  int _count = 0;
  int total;
  String _host="http://gateway.marvel.com";
  String _getCharactersUrl="/v1/public/characters";
  String _privateKey="2b018f19399848cc6d35b8da8cc480d4016c34ed";
  String _publicKey="c5ac95ce33d844d8ef3a9664eaff803d";
  String timeStamp="";
  String hash="";
  CharacterDataEntity characters;
  List<TestDataResult> charactersEntityList=new List<TestDataResult>();


  Future<bool> getFreshCharacters() async{
    getTimeStamp();
    getHash();

    Map<String, dynamic> paras = {"apikey":_publicKey,"ts":timeStamp,"hash":hash,"offset":_count,"nameStartsWith":value};


    Dio dio = Dio();
    final response = await dio.get(
      _host+_getCharactersUrl,
      queryParameters: paras,);
    print(response.statusCode);



    Map userMap = json.decode(response.toString());
    characters = new CharacterDataEntity.fromJson(userMap);
    charactersEntityList=new List<TestDataResult>();
    charactersEntityList.addAll(characters.data.results);

    total=characters.data.total;
    if(total==0){

      setState(() {
        titleString='Search No Results';
      });

    }

    return false;

  }

  Future<bool> getCharacters() async{
    getTimeStamp();
    getHash();

    Map<String, dynamic> paras = {"apikey":_publicKey,"ts":timeStamp,"hash":hash,"offset":_count,"nameStartsWith":value};


    Dio dio = Dio();
    final response = await dio.get(
      _host+_getCharactersUrl,
      queryParameters: paras,);
    print(response.statusCode);



    Map userMap = json.decode(response.toString());
    characters = new CharacterDataEntity.fromJson(userMap);

    charactersEntityList.addAll(characters.data.results);

    total=characters.data.total;

    if(total==0){
      setState(() {
        titleString='Search No Results';
      });
    }

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


  NetworkImage buildNetWorkImage(TestDataResultsThumbnail testDataResultsThumbnail) {
    String url="";
    url=testDataResultsThumbnail.path+"."+testDataResultsThumbnail.extension;
    return NetworkImage(url);

  }
  VoidCallback openDialog(BuildContext context,String url) => () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child:GestureDetector(child: Container(
            child: PhotoView(
              tightMode: true,
              imageProvider:  NetworkImage(url),
              heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
            ),
          ),               onTap: () => Navigator.pop(context),),


        );
      },
    );
  };
  Widget buildSeriesDescText(TestDataResult testDataResult) {
    if(testDataResult.description==null||testDataResult.description.length==0){

      return new Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[

        Row(children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Comics: ',
                overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
                maxLines: 3,
                style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
              ),Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 2),),
              Text(
                'Events: ',
                overflow: TextOverflow.ellipsis,
                maxLines: 3, textScaleFactor: 1.0,
                style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
              ),
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                testDataResult.comics.available.toString(),
                overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
                maxLines: 3,
                style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
              ),Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 2),),
              Text(
                testDataResult.events.available.toString(),
                overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
                maxLines: 3,
                style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0),),
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
            Text(
              'Series: ',
              overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
              maxLines: 3,
              style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
            ),Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 2),),
            Text(
              'Stories: ',
              overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
              maxLines: 3,
              style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
            ),
          ],),
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
            Text(
              testDataResult.series.available.toString(),
              overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
              maxLines: 3,
              style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
            ),Padding(padding: EdgeInsets.fromLTRB(0, 2, 0, 2),),
            Text(
              testDataResult.stories.available.toString(),
              overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
              maxLines: 3,
              style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
            ),
          ],),
        ],),

        Padding(padding: EdgeInsets.fromLTRB(0, 5,0, 0),),
        Text(
          'Modified: '+testDataResult.modified.split('T')[0],
          overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
          maxLines: 3,
          style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
        ),


      ],);


    }

    return new Text(
      testDataResult.description,
      overflow: TextOverflow.ellipsis, textScaleFactor: 1.0,
      maxLines: 3,
      style: TextStyle(fontSize: 14,color:MyColors.detail_text_color),
    );


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: MyColors.detail_appbar_bg,
       title: Text(titleString,textScaleFactor: 1.0,),
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
                        child: SpinKitDoubleBounce(
                          color: MyColors.detail_text_color,
                          size: 25.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Text(
                          "Searching Characters..",
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
                      decoration: new BoxDecoration(color:MyColors.image_holder_bg),
                      child: Row(
                        children: <Widget>[

                          Container(

                            height: 100.0,
                            child: AspectRatio(
                              aspectRatio: 1.0,

                              child: RaisedButton(
                                color:MyColors.image_holder_bg,clipBehavior:Clip.none,
                                elevation:0,highlightElevation:0,disabledElevation:0,
                                child:
                                Container(

                                  width: 100.0,
                                  height:100.0,
                                  child:
                                  Image.network(charactersEntityList[index].thumbnail.path+'.'+charactersEntityList[index].thumbnail.extension,fit: BoxFit.fill,),
                                ),


                                onPressed: openDialog(context,charactersEntityList[index].thumbnail.path+'.'+charactersEntityList[index].thumbnail.extension,),
                                padding:EdgeInsets.all(0),
                              ),


                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(CharacterDetailPageTest(
                                  character: charactersEntityList[index],
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
                                              charactersEntityList[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1, textScaleFactor: 1.0,
                                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color:MyColors.detail_text_color),
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.only(top: 5.0),
                                            child:  buildSeriesDescText(charactersEntityList[index]),
                                          ),
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
          await getFreshCharacters();
          await Future.delayed(Duration(seconds: 0), () {
            setState(() {
              _count = characters.data.count;
            });
          });
        },
        onLoad: () async {
          await getCharacters();
          await Future.delayed(Duration(seconds: 0), () {
            setState(() {
              _count += characters.data.count;

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
  Widget buildLoadingChild(){
    return CircularProgressIndicator(strokeWidth: 4.0,
      valueColor: new AlwaysStoppedAnimation<Color>(MyColors.app_bar),);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child:GestureDetector(
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




