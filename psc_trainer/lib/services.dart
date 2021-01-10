

import 'dart:io';

class admobServices{

  String getAdmobAppId(){

    if(Platform.isIOS){
      return null;
    }
    else if(Platform.isAndroid){
      return "ca-app-pub-8112596810774973~8829134132";
    }else{
      return null;
    }
  }


  String getAdmobaddId(){

    if(Platform.isIOS){
      return null;
    }
    else if(Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/6300978111'; /*'ca-app-pub-8112596810774973/3449826700';*/
    }else{
      return null;
    }
  }


}


class Admanager{
  String interstitial = "ca-app-pub-3940256099942544/1033173712";//"ca-app-pub-8112596810774973/2193937395";
  String rewarded ="ca-app-pub-3940256099942544/5224354917";//"ca-app-pub-8112596810774973/5511107164";

}