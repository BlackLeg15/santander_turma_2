import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/entity.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/exceptions.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/params.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/repository.dart';
import 'package:santander_turma_2/app/modules/auth/domain/usecases/login_with_username_and_password/usecase_impl.dart';

class RepositoryMock extends Mock implements Repository {}

void main() {
  late UsecaseImpl usecaseImpl;
  late RepositoryMock repository;

  setUp(() {
    repository = RepositoryMock();
    usecaseImpl = UsecaseImpl(repository);
    registerFallbackValue(Params('', ''));
  });

  test('Se parametros corretos, a função deve suceder', () async {
    when(() => repository(any())).thenAnswer((invocation) async => Right(LoggedUserEntity('', '')));
    expect(usecaseImpl(Params('Adby', '123456')), completion(isA<Right>()));
  });
  test('Se o username for vazio, a função deve falhar', () async {
    expect(
      usecaseImpl(Params('', '123456')).then(
        (either) => either.fold((exception) => exception, (user) => user),
      ),
      completion(isA<EmptyUsername>()),
    );
  });
}
