/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Attachment.png
  AssetGenImage get attachment =>
      const AssetGenImage('assets/icons/Attachment.png');

  /// File path: assets/icons/Groupcamera.png
  AssetGenImage get groupcamera =>
      const AssetGenImage('assets/icons/Groupcamera.png');

  /// File path: assets/icons/Subtract.png
  AssetGenImage get subtract =>
      const AssetGenImage('assets/icons/Subtract.png');

  /// File path: assets/icons/add_status.svg
  String get addStatus => 'assets/icons/add_status.svg';

  /// File path: assets/icons/dot_menu.svg
  String get dotMenu => 'assets/icons/dot_menu.svg';

  /// File path: assets/icons/emoji.png
  AssetGenImage get emoji => const AssetGenImage('assets/icons/emoji.png');

  /// File path: assets/icons/incall.svg
  String get incall => 'assets/icons/incall.svg';

  /// File path: assets/icons/microphone.png
  AssetGenImage get microphone =>
      const AssetGenImage('assets/icons/microphone.png');

  /// File path: assets/icons/phone_icon.svg
  String get phoneIcon => 'assets/icons/phone_icon.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/av.png
  AssetGenImage get av => const AssetGenImage('assets/images/av.png');

  /// File path: assets/images/flix.jpg
  AssetGenImage get flix => const AssetGenImage('assets/images/flix.jpg');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
