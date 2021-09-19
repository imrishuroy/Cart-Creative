import 'package:bloc/bloc.dart';
import 'package:cart_creative/config/paths.dart';
import 'package:cart_creative/models/failure.dart';
import 'package:cart_creative/repositories/auth/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection(Paths.users);

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  void showPassword(bool showPassword) {
    emit(state.copyWith(
        showPassword: !showPassword, status: LoginStatus.initial));
  }

  void signInWithEmail() async {
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.loginInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: LoginStatus.succuss));
    } on Failure catch (error) {
      emit(state.copyWith(failure: error, status: LoginStatus.error));
    }
  }

  void googleSignIn() async {
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      final user = await _authRepository.signInWithGoogle();

      if (user != null) {
        final doc = await _usersRef.doc(user.userId).get();
        if (!doc.exists) {
          _usersRef.doc(user.userId).set(user.toMap());
        }
      }
      emit(state.copyWith(status: LoginStatus.succuss));
    } on Failure catch (error) {
      emit(state.copyWith(failure: error, status: LoginStatus.error));
    }
  }

  void appleLogin() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      final user = await _authRepository.signInWithApple();
      if (user != null) {
        final doc = await _usersRef.doc(user.userId).get();
        if (!doc.exists) {
          _usersRef.doc(user.userId).set(user.toMap());
        }
      }
      emit(state.copyWith(status: LoginStatus.succuss));
    } on Failure catch (error) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          failure: Failure(message: error.message),
        ),
      );
    }
  }
}
