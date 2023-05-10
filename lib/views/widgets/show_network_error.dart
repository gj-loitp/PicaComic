import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pica_comic/base.dart';

import '../../eh_network/eh_main_network.dart';

Widget showNetworkError(BuildContext context, void Function() retry, {bool showBack = true, bool eh=false}){
  final topPadding = showBack?0:80;
  return SafeArea(child: Stack(
    children: [
      if(showBack)
      Positioned(
        left: 8,
        top: 12,
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: ()=>Get.back(),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height/2-80-topPadding,
        left: 0,
        right: 0,
        child: const Align(
          alignment: Alignment.topCenter,
          child: Icon(Icons.error_outline,size:60,),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: MediaQuery.of(context).size.height/2-10-topPadding,
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 300,
            child: eh?
            (EhNetwork().status?Text(EhNetwork().message):const Text("网络错误"))
                :(network.status?Text(network.message):const Text("网络错误")),
          )
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        top: MediaQuery.of(context).size.height/2+40-topPadding,
        child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 100,
              height: 40,
              child: FilledButton(
                onPressed: ()=>retry(),
                child: const Text("重试"),
              ),
            )
        ),
      ),
    ],
  ));
}