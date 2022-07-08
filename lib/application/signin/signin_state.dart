part of 'signin_cubit.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState({
    required bool showError,
    required String errorMsg,
    required String? verificationId,
    required bool isImgUploding,
    required String? imgUrl,
  }) = _SigninState;

  factory SigninState.initial() => const SigninState(
        showError: false,
        errorMsg: '',
        verificationId: null,
        imgUrl: null,
        isImgUploding: false,
      );
}
