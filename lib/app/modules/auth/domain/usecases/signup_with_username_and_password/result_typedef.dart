import 'package:dartz/dartz.dart';
import 'entity.dart';
import 'exceptions.dart';

typedef LoginResult = Future<Either<Exception, LoggedUserEntity>>;
