import 'params.dart';
import 'result_typedef.dart';

abstract class Usecase {
  LoginResult call(Params params);
}
