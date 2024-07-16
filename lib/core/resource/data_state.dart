
abstract class DataState{}

class SuccessState<T> extends DataState{
  T getdata;
  SuccessState({required this.getdata});
}

class SuccessStateList<T> extends DataState{
  List<T> getdataNew;
  List<T>? getdataInProgress;
  List<T>? getdataCompleted;
  SuccessStateList({required this.getdataNew, this.getdataInProgress, this.getdataCompleted});
}


class ErrorState extends DataState{
  String error;
  ErrorState({required this.error});
}