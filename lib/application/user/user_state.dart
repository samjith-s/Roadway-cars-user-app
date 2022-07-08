part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({UserModel? user}) = _UserState;

  factory UserState.initial() => const UserState(user: null);
}
