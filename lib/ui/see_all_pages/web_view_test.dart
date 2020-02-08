
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:marvel_max/photo_view.dart';
import 'package:marvel_max/utils/photo_view_hero_attributes.dart';

import '../../MyColors.dart';



class WebViewTest extends StatefulWidget {
  final int id;
  WebViewTest({Key key, @required this.id}) : super(key: key);

  @override
  _TabPageState createState() => new _TabPageState(id);
}

class _TabPageState extends State<WebViewTest>
    with AutomaticKeepAliveClientMixin {
  _TabPageState(int id) {
    this.id = id;
  }
  int id;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(_) => new  Container

          (
          decoration: new BoxDecoration(color:Colors.black),
          child: WebviewScaffold(
            appBar: AppBar(
              brightness: Brightness.dark,
              backgroundColor: MyColors.detail_appbar_bg,
              title: Text('Comic'),

            ),

          url: "https://read.marvel.com/#/book/"+id.toString(),


        ),)

      },

    );
  }

  @override
  void initState() {

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
