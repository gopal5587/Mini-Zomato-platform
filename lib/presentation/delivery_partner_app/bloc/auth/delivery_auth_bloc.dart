import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_auth_event.dart';
part 'delivery_auth_state.dart';

class DeliveryAuthBloc extends Bloc<DeliveryAuthEvent, DeliveryAuthState> {
  DeliveryAuthBloc() : super(DeliveryAuthInitial()) {
    on<DeliveryLoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    DeliveryLoginRequested event,
    Emitter<DeliveryAuthState> emit,
  ) async {
    emit(DeliveryAuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));

      if (event.email == 'partner@test.com' && event.password == 'password') {
        emit(const DeliveryAuthSuccess(partnerId: 'partner_xyz_123'));
      } else {
        emit(const DeliveryAuthFailure(message: 'Invalid partner credentials.'));
      }
    } catch (e) {
      emit(DeliveryAuthFailure(message: 'An error occurred: ${e.toString()}'));
    }
  }
}