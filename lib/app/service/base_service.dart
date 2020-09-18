import '../../core/init/network/model/ICoreDio.dart';
import '../../core/init/network/network_manager.dart';

abstract class BaseService {
  ICoreDio coreDio = NetworkManager.instance.coreDio;
}
