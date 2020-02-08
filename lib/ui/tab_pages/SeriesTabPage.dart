import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:convert/convert.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:marvel_max/bean/series_data_entity.dart';
import 'package:marvel_max/photo_view.dart';

import 'package:marvel_max/ui/detail_pages/series_detail_page.dart';
import 'package:marvel_max/utils/photo_view_hero_attributes.dart';
import '../../MyColors.dart';


class SeriesTabPage extends StatefulWidget {


  @override
  _TabPageState createState() => new _TabPageState();

}

class _TabPageState extends State<SeriesTabPage> with AutomaticKeepAliveClientMixin{
  // 总数
  int _count = 0;
  int total;
  String _host="http://gateway.marvel.com";
  String _getCharactersUrl="/v1/public/series";
  String _privateKey="2b018f19399848cc6d35b8da8cc480d4016c34ed";
  String _publicKey="c5ac95ce33d844d8ef3a9664eaff803d";
  String timeStamp="";
  String hash="";
  SeriesDataEntity series;
  List<SeriesDataDataResult> seriesEntityList=new List<SeriesDataDataResult>();
  int offset;

  Future<bool> getFreshSeries() async{
    getTimeStamp();
    getHash();
    offset=Random().nextInt(7500);
    print(offset);
    Map<String, dynamic> paras = {"apikey":_publicKey,"ts":timeStamp,"hash":hash,"offset":offset};


    Dio dio = Dio();
    final response = await dio.get(
      _host+_getCharactersUrl,
      queryParameters: paras,);
    print(response.statusCode);



    Map userMap = json.decode(response.toString());
    series = new SeriesDataEntity.fromJson(userMap);
    seriesEntityList=new List<SeriesDataDataResult>();
    seriesEntityList.addAll(series.data.results);

    offset=offset+series.data.count;
    total=series.data.total;


    return false;

  }

  Future<bool> getSeries() async{
    getTimeStamp();
    getHash();

    Map<String, dynamic> paras = {"apikey":_publicKey,"ts":timeStamp,"hash":hash,"offset":offset};


    Dio dio = Dio();
    final response = await dio.get(
      _host+_getCharactersUrl,
      queryParameters: paras,);
    print(response.statusCode);



    Map userMap = json.decode(response.toString());
    series = new SeriesDataEntity.fromJson(userMap);

    seriesEntityList.addAll(series.data.results);

    total=series.data.total;


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

  Widget buildSeriesDescText(SeriesDataDataResult seriesDataDataResult) {
    if(seriesDataDataResult.description==null){
      if(seriesDataDataResult.startYear!=null&&seriesDataDataResult.endYear!=null){
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(margin: EdgeInsets.fromLTRB(0, 2, 0, 0),child:     Text('Start Year: '+seriesDataDataResult.startYear.toString()+' End Year: '+seriesDataDataResult.endYear.toString(),textAlign: TextAlign.start, textScaleFactor: 1.0,style: TextStyle(fontSize: 14,color: MyColors.detail_text_color),),
            ),
            Container(margin: EdgeInsets.fromLTRB(0, 2, 0, 0),child:   Text('Rating: '+seriesDataDataResult.rating.toString(),textAlign: TextAlign.start, maxLines: 1,overflow: TextOverflow.ellipsis,textScaleFactor: 1.0,style: TextStyle(fontSize: 14,color: MyColors.detail_text_color),),
            ),
            Container(margin: EdgeInsets.fromLTRB(0, 2, 0, 0),child:
            Text("Type: "+seriesDataDataResult.type,textAlign: TextAlign.start, textScaleFactor: 1.0,style: TextStyle(fontSize: 14,color: MyColors.detail_text_color),),),

          ],
        );
      }
      return new Text(
        '',
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
        maxLines: 1,textScaleFactor: 1.0,
        style: TextStyle(
            fontSize: 14,
            color: MyColors.detail_text_color),
      );
    }

    return new Text(
      seriesDataDataResult.description,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,textScaleFactor: 1.0,
      style: TextStyle(fontSize: 14,color: MyColors.detail_text_color),
    );


  }
  NetworkImage buildNetWorkImage(SeriesDataDataResultsThumbnail seriesDataDataResultsThumbnail) {
    String url="";
    url=seriesDataDataResultsThumbnail.path+"."+seriesDataDataResultsThumbnail.extension;
    return NetworkImage(url);

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
                          "Loading Series Data From Marvel Universe..",
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
                      decoration: new BoxDecoration(color:MyColors.detail_card_bg),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Container(

                            height: 130.0,

                              child: RaisedButton(

                                color:MyColors.image_holder_bg,clipBehavior:Clip.none,
                                elevation:0,highlightElevation:0,disabledElevation:0,

                                child:
                                Container(

                                  width: 100.0,
                                  height:130.0,
                                  child:
                                  Image.network(seriesEntityList[index].thumbnail.path+'.'+seriesEntityList[index].thumbnail.extension,fit: BoxFit.fill,),
                                ),


                                onPressed: openDialog(context,seriesEntityList[index].thumbnail.path+'.'+seriesEntityList[index].thumbnail.extension,),
                                padding:EdgeInsets.all(0),
                              ),


                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(SeriesDetailPageTest(
                                  series: seriesEntityList[index],
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
                                            seriesEntityList[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textScaleFactor: 1.0,
                                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: MyColors.detail_text_color),
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 4.0),
                                          child:  buildSeriesDescText(seriesEntityList[index]),
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
          await getFreshSeries();
          await Future.delayed(Duration(seconds: 0), () {
            setState(() {
              _count = series.data.count;
            });
          });
        },
        onLoad: () async {
          await getSeries();
          await Future.delayed(Duration(seconds: 0), () {
            setState(() {
              _count += series.data.count;

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

