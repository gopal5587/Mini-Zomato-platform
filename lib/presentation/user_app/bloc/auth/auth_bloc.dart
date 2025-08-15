import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// We need to import the event and state files.
// The 'part' and 'part of' directives link these files together.
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // Register the event handler for the LoginRequested event.
    on<LoginRequested>(_onLoginRequested);
    
    // Register the event handler for the LogoutRequested event.
    on<LogoutRequested>(_onLogoutRequested);
  }

  // This is the handler for when a login is requested.
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    // 1. Emit a loading state to show a progress indicator in the UI.
    emit(AuthLoading());

    try {
      // 2. Simulate a network call to an authentication service.
      // In a real app, you would call your AuthRepository here.
      // For example: await authRepository.login(email: event.email, password: event.password);
      await Future.delayed(const Duration(seconds: 2));

      // 3. Mocking the login logic.
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(const AuthFailure(message: 'Please enter both email and password.'));
      } else if (event.password.length < 6) {
        emit(const AuthFailure(message: 'Password must be at least 6 characters.'));
      } else {
        // 4. If login is successful, emit the AuthSuccess state.
        // We'll use a mock user ID for now.
        emit(const AuthSuccess(userId: 'mock_user_123'));
      }
    } catch (e) {
      // 5. If any error occurs, emit the AuthFailure state.
      emit(AuthFailure(message: 'An unknown error occurred: ${e.toString()}'));
    }
  }
  
  // Handler for when a logout is requested.
  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    // In a real app, you would clear tokens or user data here.
    await Future.delayed(const Duration(seconds: 1));
    emit(AuthInitial()); // Go back to the initial state.
  }
}