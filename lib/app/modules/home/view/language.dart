import 'package:get/get.dart';
import 'package:get_learn/app/languages/ban.dart';
import 'package:get_learn/app/languages/eng.dart';

class Language extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}