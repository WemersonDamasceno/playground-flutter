import 'package:dartz/dartz.dart';
import '../../../../core/errors/errors.dart';
import '../../../../modules/login/domain/entities/user.dart';

abstract class LoginRepository{
  Future<Either<Failure, User>> executeLoginGoogle();
}