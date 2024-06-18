import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_waste_app/modules/home/statistics/cubit/statistics_state.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(InitialState());
  static StatisticsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> buttonsNameList = [
    "Visits",
    "Income",
    "Waste Tracker",
    "Points",
  ];
  void onChangeIndex(int index) {
    currentIndex = index;

    emit(ChangeStatisticsButtonsState());
  }
}
