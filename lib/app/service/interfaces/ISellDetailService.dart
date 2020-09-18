

import 'package:flutterfoodapp/app/models/sell_detail_service_model.dart';

abstract class ISellDetailService {
  Future<List<SellDetailModel>> getSellDetailList();
}
