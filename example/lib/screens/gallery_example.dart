import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import './app_bar.dart';

class GalleryExample extends StatelessWidget {

  void open (BuildContext context, final int index){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryPhotoViewWrapper(
          imageProvider: AssetImage("assets/gallery1.jpeg"),
          imageProvider2: AssetImage("assets/gallery2.jpeg"),
          imageProvider3: AssetImage("assets/gallery3.jpeg"),
          index: index,
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: "Gallery Example",
            showGoBack: true,
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                      onTap: (){
                        open(context, 0);
                      },
                      child: Hero(
                        tag: "tag1",
                        child: Image.asset("assets/gallery1.jpeg", height: 80.0),
                      ),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                      onTap: (){
                        open(context, 1);
                      },
                      child: Hero(
                        tag: "tag2",
                        child: Image.asset("assets/gallery2.jpeg", height: 80.0),
                      ),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                      onTap: (){
                        open(context, 2);
                      },
                      child: Hero(
                        tag: "tag3",
                        child: Image.asset("assets/gallery3.jpeg", height: 80.0),
                      ),
                    )
                  ),
                ],
              )
            )
          ),
        ],
      ),
    );
  }
}


class GalleryPhotoViewWrapper extends StatefulWidget {
  final ImageProvider imageProvider;
  final ImageProvider imageProvider2;
  final ImageProvider imageProvider3;
  final Widget loadingChild;
  final Color backgroundColor;
  final dynamic minScale;
  final dynamic maxScale;
  final int index;
  final PageController pageController;

  GalleryPhotoViewWrapper({
    this.imageProvider,
    this.imageProvider2,
    this.imageProvider3,
    this.loadingChild,
    this.backgroundColor,
    this.minScale,
    this.maxScale,
    this.index,
  }) :
        this.pageController = PageController(
            initialPage: index
        );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  }

}

class __GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {

  int currentIndex;
  @override
  void initState() {
    currentIndex = widget.index;
    // TODO: implement initState
    super.initState();
  }

  void onPageChange (int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            PhotoViewGallery(
              pageOptions: <PhotoViewGalleryPageOptions>[
                PhotoViewGalleryPageOptions(
                  imageProvider: widget.imageProvider,
                  heroTag: "tag1",
                ),
                PhotoViewGalleryPageOptions(
                  imageProvider: widget.imageProvider2,
                  heroTag: "tag2",
                ),
                PhotoViewGalleryPageOptions(
                  imageProvider: widget.imageProvider3,
                  heroTag: "tag3",
                ),
              ],
              loadingChild: widget.loadingChild,
              backgroundColor: widget.backgroundColor,
              pageController: widget.pageController,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20.0
              ),
              child: Text(
                "Image  $currentIndex",
                style: const TextStyle(
                    color: Colors.white,
                    decoration: null
                ),
              ),
            )
          ],
        )
    );
  }

}


