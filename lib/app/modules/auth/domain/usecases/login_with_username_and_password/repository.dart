import 'params.dart';
import 'result_typedef.dart';

abstract class Repository {
  LoginResult call(Params params);
}
