
import 'package:flutter_wordpress/flutter_wordpress.dart';

class WordPressApi{

  WordPress wordPress;

  WordPressApi(String baseUrl,{authenticator = WordPressAuthenticator.JWT,String adminName = '', String adminKey = ''}){
    wordPress = WordPress(
      baseUrl: baseUrl,
      adminName: adminName,
      adminKey: adminKey,
    );
  }
}