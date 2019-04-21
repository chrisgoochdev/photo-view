# Flutter Photo View 

[![Build Status - Travis](https://travis-ci.org/renancaraujo/photo_view.svg?branch=master)](https://travis-ci.org/renancaraujo/photo_view) [![Pub](https://img.shields.io/pub/v/photo_view.svg?style=popout)](https://pub.dartlang.org/packages/photo_view) [![Chat](https://badges.gitter.im/photo_view/Lobby.svg)](https://gitter.im/photo_view/Lobby)

A simple zoomable image/content widget for Flutter.

PhotoView enables images to become able to zoom and pan with user gestures such as pinch, rotate and drag.

It also can show any widget instead of an image, such as Container, Text or a SVG. 

Even though being super simple to use, PhotoView is extremely customizable though its options and the controllers. 


## Installation

Add `photo_view` as a dependency in your pubspec.yaml file ([what?](https://flutter.io/using-packages/)).

Import Photo View:
```dart
import 'package:photo_view/photo_view.dart';
```

## Docs & API

The [API Docs](https://pub.dartlang.org/documentation/photo_view/latest/photo_view/photo_view-library.html) some detailed information about how to use PhotoView.


If you want to see it in practice, check the [example app](/example/lib) that explores most of Photo View's use cases or download the latest version apk on the [releases page](https://github.com/renancaraujo/photo_view/releases)
 

## (Very) Basic usage

Given a `ImageProvider imageProvider` (such as [AssetImage](https://docs.flutter.io/flutter/painting/AssetImage-class.html) or [NetworkImage](https://docs.flutter.io/flutter/painting/NetworkImage-class.html)):

```dart
@override
Widget build(BuildContext context) {
  return Container(
    child: PhotoView(
      imageProvider: AssetImage("assets/large-image.jpg"),
    )
  );
}
```

Result: 

![In action](https://user-images.githubusercontent.com/6718144/56463745-45ec0380-63b0-11e9-8e56-0dba5deabb1a.gif)


Read more about the `PhotoView` widget [here](https://pub.dartlang.org/documentation/photo_view/latest/photo_view/PhotoView-class.html).


## Gallery

To show several images and let user change between them, use `PhotoViewGallery`.

Read more about the gallery [here](https://pub.dartlang.org/documentation/photo_view/latest/photo_view_gallery/PhotoViewGallery-class.html).

```dart
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
// ...


@override
Widget build(BuildContext context) {
  return Container(
    child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: AssetImage(widget.galleryItems[index].image),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroTag: galleryItems[index].id,
        );
      },
      itemCount: galleryItems.length,
      loadingChild: widget.loadingChild,
      backgroundDecoration: widget.backgroundDecoration,
      pageController: widget.pageController,
      onPageChanged: onPageChanged,
    )
  );
}
```

Gallery sample in the example app: 

![In action](https://user-images.githubusercontent.com/6718144/56463769-e93d1880-63b0-11e9-8586-55827c95b89c.gif)

See the code [here](https://github.com/renancaraujo/photo_view/blob/master/example/lib/screens/examples/gallery/gallery_example.dart).



## Usage with controllers

When you need to interact with PhotoView's internal state values, `PhotoViewController` and `PhotoViewScaleStateController` are the way to.

Controllers, when specified to PhotoView widget, enables the author(you) to listen for state updates through a `Stream` and change those values externally.

Read more about controllers [here](https://pub.dartlang.org/documentation/photo_view/latest/photo_view/PhotoView-class.html#controllers).

In the example app, we can see what can be achieved with controllers: 

![In action](https://user-images.githubusercontent.com/6718144/56464051-3328fd00-63b7-11e9-9c4d-73b04f72a81e.gif)

### More screenshots


| Custom background small image nd custom alignemnt | Limited scale | Hero animation | Part of the screen | Custom child  |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| ![In action](https://github.com/renancaraujo/photo_view/blob/master/screen2.gif) | ![In action](https://github.com/renancaraujo/photo_view/blob/master/screen3.gif) | ![In action](https://github.com/renancaraujo/photo_view/blob/master/screen4.gif) | ![In action](https://github.com/renancaraujo/photo_view/blob/master/screen6.gif) |


