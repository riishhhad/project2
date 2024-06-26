import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project2/repository/Modelclass/Rishad.dart';

import '../repository/API/animeapi.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  late  Rishad animeModel;
  Animeapi animeapi= Animeapi();
  ApiBloc() : super(ApiInitial()) {
    on<ApiEvent>((event, emit) async{

   emit(AnimeblocLoading());

   try {
     animeModel = await animeapi.getAnime();
     emit(AnimeblocLoaded());
   }

catch(a) {
  emit(AnimeblocError());
}


      // TODO: implement event handler
    });
  }
}
