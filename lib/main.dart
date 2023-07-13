import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cim_plus/route/route.dart';
import 'package:flutter_cim_plus/style/index.dart';
import 'package:flutter_cim_plus/utils/database_helper.dart';
import 'package:flutter_cim_plus/utils/sotre_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'http/http.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 初始化本地存储工具
  await GetStorage.init();

  /// 如果token存在，则直接跳转到首页去
  Map<String, dynamic> res = StoreUtil.store.read('userInfo');
  bool loginFlag = false;
  if (res != null && res['token'].toString().isNotEmpty) {
    loginFlag = true;
  }

  /// 初始化本地数据库
  DatabaseHelper.initializeDatabase();

  /// 初始化网络工具
  await initNetwork();
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp(
    loginFlag: loginFlag,
  ));
}

class MyApp extends StatelessWidget {
  final bool loginFlag;

  const MyApp({Key? key, required this.loginFlag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) => GetMaterialApp(
        title: 'CIM-PLUS',
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: loginFlag ? AppRoutes.home : AppPages.initial,
        getPages: AppPages.routes,
        theme: AppTheme.dark,
        themeMode: ThemeMode.system,
        darkTheme: AppTheme.dark,
        navigatorObservers: [AppPages.observer],
        builder: (context, widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
      ),
      designSize: const Size(375, 812),
    );
  }
}

Future<void> initNetwork() async {
  // final List<Interceptor> interceptors = <Interceptor>[];
  //
  // /// 统一添加身份验证请求头
  // interceptors.add(AuthInterceptor());
  //
  // /// 刷新Token
  // interceptors.add(TokenInterceptor());
  //
  // /// 打印Log(生产模式去除)
  // if (!Constant.inProduction) {
  //   interceptors.add(LoggingInterceptor());
  // }
  //
  // /// 适配数据(根据自己的数据结构，可自行选择添加)
  // interceptors.add(AdapterInterceptor());
  // configDio(
  //   baseUrl: 'http://192.168.31.176:8083',
  //   interceptors: interceptors,
  // );

  // configDio(
  //   baseUrl: 'http://192.168.31.176:8083',
  //   interceptors: authInterceptors,
  // );
}
