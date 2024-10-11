import 'package:bloc/bloc.dart';
import 'package:flutter_basic/Remote_API/homework/features/home/domain/usecase/global_info_usecases.dart';
import '../../../../../core/services/logger_service.dart';
import '../../../domain/entities/genre.dart';
import '../../../domain/entities/image_config_info.dart';

part 'global_info_event.dart';
part 'global_info_state.dart';

class GlobalInfoBloc extends Bloc<GlobalInfoEvent, GlobalInfoState> {
  final GlobalInfoUsecases usecase;
  GlobalInfoBloc(this.usecase) : super(GlobalInfoInitial()) {
    on<GlobalInfoEvent>((event, emit) async {
      emit(GlobalInfoLoading());
      try {
        final genreList = await usecase.getGenre();
        final imageConfig = await usecase.getImageInfo();

        emit(GlobalInfoLoaded(
            genreList: genreList, imageConfigInfo: imageConfig));
      } catch (e) {
        printE("[GlobalInfoBloc] - [GetGlobalInfo] error: ${e.toString()}");
        emit(GlobalInfoError(message: "error occured"));
      }
    });
  }
}
