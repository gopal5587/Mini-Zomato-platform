part of 'auth_bloc.dart';

// The abstract class for all authentication states.
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

// The initial state, when the app starts.
final class AuthInitial extends AuthState {}

// The state when authentication is in progress (e.g., showing a loading spinner).
final class AuthLoading extends AuthState {}

// The state when the user is successfully authenticated.
// It holds the user's information (e.g., a user ID or token).
final class AuthSuccess extends AuthState {
  final String userId; // Example user data

  const AuthSuccess({required this.userId});

  @override
  List<Object> get props => [userId];
}

// The state when authentication fails.
// It holds an error message to show to the user.
final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure({required this.message});

  @override
  List<Object> get props => [message];
}