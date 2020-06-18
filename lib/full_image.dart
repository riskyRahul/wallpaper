import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';
import 'package:wallpaper/global.dart';


class FullImage extends StatefulWidget {
  final String heroId;
  final ThemeData themeData;

  FullImage({Key key, @required this.heroId, @required this.themeData})
      : super(key: key);

  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  PageController mPageController =
      new PageController(initialPage: Global.index);
  bool downloading = false;
  var progressString = "";
  bool redioSelected = false;
  int selectedRadioTile;
  var result = "";
  ProgressDialog pr;
  static int currentPage;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return myBody(context);
  }

  Widget myBody(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Downlogind Now: $progressString',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(color: Colors.black, fontSize: 13.0),
        messageTextStyle: TextStyle(color: Colors.black, fontSize: 19.0));

    return Theme(
      data: widget.themeData,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Hero(
              tag: 0,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: PhotoViewGallery.builder(
                  pageController: mPageController,
                  itemCount: Global.photos.length,
                  builder: (context, index) {
                    return PhotoViewGalleryPageOptions(
                      filterQuality: FilterQuality.high,
                      imageProvider: NetworkImage(
                        Global.photos[index].src.large2x,
                      ),
                      minScale: PhotoViewComputedScale.contained * 0.8,
                      maxScale: PhotoViewComputedScale.covered * 2,
                    );
                  },
                  onPageChanged: (page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              top: 28,
              left: 8,
              child: FloatingActionButton(
                tooltip: 'Close',
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                heroTag: 'close',
                mini: true,
                backgroundColor: const Color(0xFF262AAA).withOpacity(0.5),
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                      // width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height - 150,
                      ),
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: Container(
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.height - 200,
                        decoration: BoxDecoration(
                            color: const Color(0xFF262AAA).withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0))),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, left: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    currentPage == null
                                        ? '${Global.photos[Global.index].photographer}'
                                        : '${Global.photos[currentPage].photographer}',
                                    style: TextStyle(
                                      // widget.themeData.textTheme.body1,
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.share),
                                  onPressed: () {
                                    final RenderBox box =
                                        context.findRenderObject();
                                    Share.share(
                                        currentPage == null
                                            ? Global.photos[Global.index].src
                                                .large2x
                                            : Global.photos[currentPage].src
                                                .large2x,
                                        sharePositionOrigin:
                                            box.localToGlobal(Offset.zero) &
                                                box.size);
                                  },
                                ),
                                IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.rotate_right),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  color: Colors.white,
                                  icon: Icon(Icons.file_download),
                                  onPressed: () {
                                    setState(() {
                                      downloading = true;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 16.0,
                      top: 0.0,
                      child: FloatingActionButton(
                        tooltip: 'Set as Wallpaper',
                        backgroundColor:
                            const Color(0xFF262AAA).withOpacity(0.5),
                        child: Icon(
                          Icons.mobile_screen_share
                          // color: widget.themeData.accentColor,
                        ),
                        onPressed: () => _displayDialog(context),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(String result) {
    Toast.show(result, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Set Wallpaper'),
            content: mYcontent(),
            actions: <Widget>[
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('DONE'),
                onPressed: () {
                  _showToast(result);
                  if (result != null) Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget mYcontent() {
    return Container(
      height: 150,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          RadioListTile(
            value: 0,
            groupValue: selectedRadioTile,
            title: Text("Set Home Screen"),
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadioTile(val);
            },
            activeColor: Colors.red,
          ),
          RadioListTile(
            value: 1,
            groupValue: selectedRadioTile,
            title: Text("Set Lock Screen"),
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadioTile(val);
            },
            activeColor: Colors.red,
          ),
          RadioListTile(
            value: 2,
            groupValue: selectedRadioTile,
            title: Text("Set Both Screen"),
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadioTile(val);
            },
            activeColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
