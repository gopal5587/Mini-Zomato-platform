part of 'auth_bloc.dart';

// The abstract class for all authentication events.
// Using 'sealed' ensures that all subclasses are in this file.
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// Event dispatched when the user presses the login button.
class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

// Event for signing out (we'll use this later).
class LogoutRequested extends AuthEvent {}