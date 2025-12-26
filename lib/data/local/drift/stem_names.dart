import 'package:flutter/material.dart';
import 'package:stemix_frontend/theme/icons/custom_icons_icons.dart';

enum StemName { vocals, bass, drums, other, piano, guitar }

IconData getStemIcon(StemName stemName) {
  switch (stemName) {
    case StemName.vocals:
      return CustomIcons.microphone;
    case StemName.bass:
      return CustomIcons.bass;
    case StemName.drums:
      return CustomIcons.drum;
    case StemName.other:
      return CustomIcons.music;
    case StemName.piano:
      return CustomIcons.piano;
    case StemName.guitar:
      return CustomIcons.guitars;
  }
}
