import 'package:flutter_bili_app/http/request/ranking_request.dart';
import 'package:flutter_bili_app/model/ranking_mo.dart';
import 'package:hi_net/hi_net.dart';

///排行榜
class RankingDao {
  //https://api.devio.org/uapi/fa/ranking?sort=like&pageIndex=1&pageSize=40
  static get(String sort, {int pageIndex = 1, pageSize = 10}) async {
    RankingRequest request = RankingRequest();
    request
        .add("sort", sort)
        .add("pageIndex", pageIndex)
        .add("pageSize", pageSize);
    var result = await HiNet.getInstance().fire(request);
    print(result);
    return RankingMo.fromJson(result["data"]);
  }
}
