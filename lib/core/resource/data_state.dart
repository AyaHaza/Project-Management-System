
abstract class DataState{}

class SuccessState<T> extends DataState{
  T getdata;
  SuccessState({required this.getdata});
}

class SuccessStateList<T> extends DataState{
  List<T> getdata;
  SuccessStateList({required this.getdata});
}


class ErrorState extends DataState{
  String error;
  ErrorState({required this.error});
}