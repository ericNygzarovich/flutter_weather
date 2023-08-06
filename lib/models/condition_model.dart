abstract final class ConditionModel {
  static String? returnCondition(String forecastFromServer) {
    switch (forecastFromServer) {
      case 'clear':
        return 'ясно';
      case 'partly-cloudy':
        return 'малооблачно';
      case 'cloudy':
        return 'облачно с прояснениями';
      case 'overcast':
        return 'пасмурно';
      case 'light-rain':
        return 'небольшой дождь';
      case 'rain':
        return 'дождь';
      case 'heavy-rain':
        return 'cильный дождь';
      case 'showers':
        return 'ливень';
      case 'wet-snow':
        return 'дождь со снегом';
      case 'light-snow':
        return 'небольшой снег';
      case 'snow':
        return 'снег';
      case 'snow-showers':
        return 'снегопад';
      case 'hail':
        return 'град';
      case 'thunderstorm':
        return 'гроза';
      case 'thunderstorm-with-rain':
        return 'дождь с грозой';
      case 'thunderstorm-with-hail':
        return 'гроза с градом';
    }

    return null;
  }
}
