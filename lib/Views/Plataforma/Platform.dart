import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Platform{

  //int iANDROID_PLATFORM=0;
  //int iIOS_PLATFORM=1;
  //int iWEB_PLATFORM=2;
  double SCREEN_WIDTH = 0;
  double SCREEN_HEIGHT = 0;
  late BuildContext context;

  Platform();

  double getScreenWidth(BuildContext context){
    SCREEN_WIDTH=MediaQuery.of(context).size.width;
    return SCREEN_WIDTH;
  }

  double getScreenHeight(BuildContext context){
    SCREEN_HEIGHT=MediaQuery.of(context).size.height;
    return SCREEN_HEIGHT;
  }

}