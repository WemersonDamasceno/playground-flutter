import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_with_clean/app/core/connectivity/domain/connectivity_service.dart';
import 'package:login_with_clean/app/core/errors/errors.dart';
import 'package:login_with_clean/app/core/errors/messages.dart';
import 'package:login_with_clean/app/modules/login/domain/entities/user.dart';
import 'package:login_with_clean/app/modules/login/domain/errors/errors.dart';
import 'package:login_with_clean/app/modules/login/domain/repositories/login_repository.dart';

part 'login_with_google.g.dart';

abstract class LoginWithGoogle {
  Future<Either<Failure, User>> call();
}

@Injectable()
class LoginWithGoogleImpl implements LoginWithGoogle{
  final LoginRepository loginRepository;
  final ConnectivityService connectivityService;

  LoginWithGoogleImpl(this.loginRepository, this.connectivityService);

  @override
  Future<Either<Failure, User>> call() async {

    final isOnline = await connectivityService.isOnline();

    if(!isOnline){
      return Left(ErrorLogin(message: Messages.OFFILINE_CONNECTION));
    }

    loginRepository.executeLoginGoogle();
  }
}