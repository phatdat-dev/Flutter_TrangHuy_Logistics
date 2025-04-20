/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/logo
  $AssetsImagesLogoGen get logo => const $AssetsImagesLogoGen();
}

class $AssetsImagesLogoGen {
  const $AssetsImagesLogoGen();

  /// File path: assets/images/logo/logo-removebg-crop-1152x1152-circle-768.png
  AssetGenImage get logoRemovebgCrop1152x1152Circle768 => const AssetGenImage('assets/images/logo/logo-removebg-crop-1152x1152-circle-768.png');

  /// File path: assets/images/logo/logo-removebg-crop-512x512.png
  AssetGenImage get logoRemovebgCrop512x512 => const AssetGenImage('assets/images/logo/logo-removebg-crop-512x512.png');

  /// File path: assets/images/logo/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logoRemovebgCrop1152x1152Circle768, logoRemovebgCrop512x512, logo];
}

class AssetsCore {
  const AssetsCore._();

  static const String package = 'package_core';

  static const String aEnv = 'packages/package_core/.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  static const String package = 'package_core';

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    @Deprecated('Do not specify package for a generated library asset') String? package = package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, @Deprecated('Do not specify package for a generated library asset') String? package = package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => 'packages/package_core/$_assetName';
}
