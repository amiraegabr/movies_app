// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/avatars
  $AssetsImagesAvatarsGen get avatars => const $AssetsImagesAvatarsGen();

  /// File path: assets/images/branding.png
  AssetGenImage get branding =>
      const AssetGenImage('assets/images/branding.png');

  /// File path: assets/images/forgot_password.png
  AssetGenImage get forgotPassword =>
      const AssetGenImage('assets/images/forgot_password.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// Directory path: assets/images/onboarding
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();

  /// List of all assets
  List<AssetGenImage> get values => [branding, forgotPassword, logo];
}

class $AssetsImagesAvatarsGen {
  const $AssetsImagesAvatarsGen();

  /// File path: assets/images/avatars/avatar1.png
  AssetGenImage get avatar1 =>
      const AssetGenImage('assets/images/avatars/avatar1.png');

  /// File path: assets/images/avatars/avatar2.png
  AssetGenImage get avatar2 =>
      const AssetGenImage('assets/images/avatars/avatar2.png');

  /// File path: assets/images/avatars/avatar3.png
  AssetGenImage get avatar3 =>
      const AssetGenImage('assets/images/avatars/avatar3.png');

  /// File path: assets/images/avatars/avatar4.png
  AssetGenImage get avatar4 =>
      const AssetGenImage('assets/images/avatars/avatar4.png');

  /// File path: assets/images/avatars/avatar5.png
  AssetGenImage get avatar5 =>
      const AssetGenImage('assets/images/avatars/avatar5.png');

  /// File path: assets/images/avatars/avatar6.png
  AssetGenImage get avatar6 =>
      const AssetGenImage('assets/images/avatars/avatar6.png');

  /// File path: assets/images/avatars/avatar7.png
  AssetGenImage get avatar7 =>
      const AssetGenImage('assets/images/avatars/avatar7.png');

  /// File path: assets/images/avatars/avatar8.png
  AssetGenImage get avatar8 =>
      const AssetGenImage('assets/images/avatars/avatar8.png');

  /// File path: assets/images/avatars/avatar9.png
  AssetGenImage get avatar9 =>
      const AssetGenImage('assets/images/avatars/avatar9.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    avatar1,
    avatar2,
    avatar3,
    avatar4,
    avatar5,
    avatar6,
    avatar7,
    avatar8,
    avatar9,
  ];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/movie_posters_onboarding.png
  AssetGenImage get moviePostersOnboarding => const AssetGenImage(
    'assets/images/onboarding/movie_posters_onboarding.png',
  );

  /// File path: assets/images/onboarding/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding/onboarding1.png');

  /// File path: assets/images/onboarding/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding/onboarding2.png');

  /// File path: assets/images/onboarding/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding/onboarding3.png');

  /// File path: assets/images/onboarding/onboarding4.png
  AssetGenImage get onboarding4 =>
      const AssetGenImage('assets/images/onboarding/onboarding4.png');

  /// File path: assets/images/onboarding/onboarding5.png
  AssetGenImage get onboarding5 =>
      const AssetGenImage('assets/images/onboarding/onboarding5.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    moviePostersOnboarding,
    onboarding1,
    onboarding2,
    onboarding3,
    onboarding4,
    onboarding5,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    String? package,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
