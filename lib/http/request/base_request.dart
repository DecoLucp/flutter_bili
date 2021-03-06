import 'package:flutter_bili_app/http/dao/login_dao.dart';
// import 'package:hi_net/request/hi_base_request.dart';
import 'package:flutter_bili_app/util/hi_constants.dart';
import 'package:hi_net/request/hi_base_request.dart';

abstract class BaseRequest extends HiBaseRequest {
  @override
  String url() {
    if (needLogin()) {
      //给需要登录的接口携带登录令牌
      addHeader(LoginDao.BOARDING_PASS, LoginDao.getBoardingPass());
    }
    return super.url();
  }

  Map<String, dynamic> header = {
    HiConstants.authTokenK: HiConstants.authTokenV,
    HiConstants.courseFlagK: HiConstants.courseFlagV
  };
}
