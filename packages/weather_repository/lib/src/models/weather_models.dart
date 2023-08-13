export 'weather_models.dart';

class WeatherObject {
  final String nowDate;
  final Info info;
  final Fact fact;
  final List<Forecast> forecast;

  WeatherObject({
    required this.nowDate,
    required this.info,
    required this.fact,
    required this.forecast,
  });

  factory WeatherObject.fromJason(Map<String, dynamic> data) {
    return WeatherObject(
      nowDate: data['now_dt'],
      fact: Fact.fromJson(data['fact']),
      forecast: (data['forecasts'] as List<dynamic>).map((dynamic element) => Forecast.fromJson(element)).toList(),
      info: Info.fromJson(data['info']),
    );
  }
}

class Info {
  final double lat;
  final double lon;
  final String url;
  final Tzinfo tzinfo;

  Info({
    required this.lat,
    required this.lon,
    required this.url,
    required this.tzinfo,
  });

  factory Info.fromJson(Map<String, dynamic> data) {
    return Info(
      lat: data['lat'],
      lon: data['lon'],
      url: data['url'],
      tzinfo: Tzinfo.fromJson(data['tzinfo']),
    );
  }
}

class Tzinfo {
  final int offset;
  final String name;
  final String abbr;
  final bool dst;

  Tzinfo({
    required this.abbr,
    required this.dst,
    required this.name,
    required this.offset,
  });

  factory Tzinfo.fromJson(Map<String, dynamic> json) {
    return Tzinfo(
      offset: json['offset'],
      dst: json['dst'],
      name: json['name'],
      abbr: json['abbr'],
    );
  }
}

class Fact {
  final int temp;
  final int feelsLikes;
  final String condition;
  final dynamic windSpeed;
  final dynamic windGust;
  final String windDir;
  final int pressureMm;
  final int humidity;
  final String daytime;
  final bool polar;
  final String season;
  final int precType;
  final dynamic precStrength;
  final bool isThunder;
  final dynamic cloudness;
  final int tempWater;
  final String icon;
  final int obsTime;

  Fact({
    required this.cloudness,
    required this.isThunder,
    required this.temp,
    required this.tempWater,
    required this.feelsLikes,
    required this.icon,
    required this.condition,
    required this.windSpeed,
    required this.windGust,
    required this.pressureMm,
    required this.humidity,
    required this.daytime,
    required this.polar,
    required this.season,
    required this.obsTime,
    required this.windDir,
    required this.precType,
    required this.precStrength,
  });

  factory Fact.fromJson(Map<String, dynamic> data) {
    return Fact(
      cloudness: data['cloudness'],
      isThunder: data['is_thunder'],
      precStrength: data['prec_strength'],
      precType: data['prec_type'],
      temp: data['temp'],
      tempWater: data['temp_water'] ?? 0,
      feelsLikes: data['feels_like'],
      icon: data['icon'],
      condition: data['condition'],
      windSpeed: data['wind_speed'],
      windGust: data['wind_gust'],
      pressureMm: data['pressure_mm'],
      humidity: data['humidity'],
      daytime: data['daytime'],
      polar: data['polar'],
      season: data['season'],
      obsTime: data['obs_time'],
      windDir: data['wind_dir'],
    );
  }
}

class Forecast {
  final String date;
  final int week;
  final String sunrise;
  final String sunset;
  final int moonCode;
  final String moonText;
  final Parts parts;
  final List<Hour> hours;

  Forecast({
    required this.date,
    required this.moonCode,
    required this.moonText,
    required this.parts,
    required this.sunrise,
    required this.sunset,
    required this.week,
    required this.hours,
  });

  factory Forecast.fromJson(Map<String, dynamic> data) {
    return Forecast(
      date: data['date'],
      moonCode: data['moon_code'],
      moonText: data['moon_text'],
      parts: Parts.fromJson(data['parts']),
      sunrise: data['sunrise'],
      sunset: data['sunset'],
      week: data['week'],
      hours: (data['hours'] as List<dynamic>).map((dynamic element) => Hour.fromJson(element)).toList(),
    );
  }
}

class Parts {
  final TimeOfDayForecat night;
  final TimeOfDayForecat morning;
  final TimeOfDayForecat day;
  final TimeOfDayForecat evening;

  Parts({
    required this.day,
    required this.morning,
    required this.night,
    required this.evening,
  });

  factory Parts.fromJson(Map<String, dynamic> data) {
    return Parts(
      night: TimeOfDayForecat.fromJson(data['night']),
      morning: TimeOfDayForecat.fromJson(data['morning']),
      day: TimeOfDayForecat.fromJson(data['day']),
      evening: TimeOfDayForecat.fromJson(data['evening']),
    );
  }
}

class Hour {
  final dynamic temp;
  final String hour;
  final String icon;

  Hour({
    required this.hour,
    required this.icon,
    required this.temp,
  });

  factory Hour.fromJson(Map<String, dynamic> data) {
    return Hour(
      hour: data['hour'],
      icon: data['icon'],
      temp: data['temp'],
    );
  }
}

class TimeOfDayForecat {
  final int tempMin;
  final int tempMax;
  final int tempAvg;
  final int feelsLike;
  final String icon;
  final String condition;
  final String daytime;
  final bool polar;
  final dynamic windSpeed;
  final dynamic windGust;
  final String windDir;
  final int pressureMm;
  final int pressurePa;
  final int humidity;
  final int precType;
  final dynamic cloudness;

  TimeOfDayForecat({
    required this.tempMin,
    required this.tempMax,
    required this.tempAvg,
    required this.feelsLike,
    required this.icon,
    required this.condition,
    required this.daytime,
    required this.polar,
    required this.windSpeed,
    required this.windDir,
    required this.windGust,
    required this.humidity,
    required this.precType,
    required this.pressureMm,
    required this.pressurePa,
    required this.cloudness,
  });

  factory TimeOfDayForecat.fromJson(Map<String, dynamic> data) {
    return TimeOfDayForecat(
      tempAvg: data['temp_avg'],
      tempMax: data['temp_max'],
      tempMin: data['temp_min'],
      condition: data['condition'],
      polar: data['polar'],
      precType: data['prec_type'],
      pressureMm: data['pressure_mm'],
      pressurePa: data['pressure_pa'],
      humidity: data['humidity'],
      icon: data['icon'],
      feelsLike: data['feels_like'],
      windDir: data['wind_dir'],
      windGust: data['wind_gust'],
      windSpeed: data['wind_speed'],
      daytime: data['daytime'],
      cloudness: data['cloudness'],
    );
  }
}
