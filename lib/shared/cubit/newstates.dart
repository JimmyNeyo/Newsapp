abstract class NewStates{} 

class NewsInitialize extends NewStates{}


class NewsGetData extends NewStates{}

class OnTapInNavBar extends NewStates{}





class GetBusinessLoading extends NewStates{}


class GetBusinessSuccess extends NewStates{}

class GetBusinessFail extends NewStates{
  late final String error ;
  GetBusinessFail(this.error);

}





class GetSportsLoading extends NewStates{}


class GetSportsSuccess extends NewStates{}

class GetSportsFail extends NewStates{
  late final String error ;
  GetSportsFail(this.error);

}






class GetScienceLoading extends NewStates{}


class GetScienceSuccess extends NewStates{}

class GetScienceFail extends NewStates{
  late final String error ;
  GetScienceFail(this.error);

}



class GetSearchLoading extends NewStates{}


class GetSearchSuccess extends NewStates{}

class GetSearchFail extends NewStates{
  late final String error ;
  GetSearchFail(this.error);

}






