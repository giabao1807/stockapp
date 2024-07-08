import 'package:get/get_utils/src/extensions/export.dart';

import '../../resource/asset_path.dart';

enum Privacy {
  Public(
    1,
    'public',
    'public_description',
    AssetPath.public,
    AssetPath.earth,
    'public_group',
  ),

  Private(
    2,
    'private',
    'private_description',
    AssetPath.private,
    AssetPath.lock,
    'private_group',
  );

  factory Privacy.from(int? value) =>
      values.firstWhereOrNull((element) => element.value == value) ??
      Privacy.Public;

  const Privacy(this.value, this.title, this.subTitle, this.icon,
      this.icNoBackground, this.key);
  final int value;
  final String title;
  final String subTitle;
  final String icon;
  final String icNoBackground;
  final String key;
}
