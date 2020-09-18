import 'package:flutterfoodapp/app/models/sell_detail_service_model.dart';
import '../../core/constants/enums/http_enums.dart';
import 'base_service.dart';
import './interfaces/ISellDetailService.dart';

class SellDetailService extends BaseService implements ISellDetailService{
  static SellDetailService _instance;
  static SellDetailService get instance {
    if (_instance == null) _instance = SellDetailService._init();
    return _instance;
  }

  SellDetailService._init();

  Future<List<SellDetailModel>> getSellDetailList() async {
    return (await coreDio.fetch<List<SellDetailModel>, SellDetailModel>(
            "Categories/GetAll",
            type: HttpTypes.GET,
            parseModel: SellDetailModel()))
        .data;
  }
}
