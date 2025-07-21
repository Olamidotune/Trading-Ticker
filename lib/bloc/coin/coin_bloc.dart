import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_event.dart';
part 'coin_state.dart';
part 'coin_bloc.freezed.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(_Initial()) {
    on<CoinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
