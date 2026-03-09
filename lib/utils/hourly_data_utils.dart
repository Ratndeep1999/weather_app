class HourlyDataUtils {
  /// get Hourly items length
  static int getHourlyItemLength(weatherModel) {
    return weatherModel?.forecast?.forecastday?[0].hour?.length ?? 0;
  }

  /// get Hourly items data
  static ({String temp, String icon, bool isCurrent, String time})
  getHourlyData(weatherModel, int index) {
    /// Get Hourly data
    final hourlyData = weatherModel?.forecast?.forecastday?[0].hour?[index];

    /// Get hours
    final apiHour = hourlyData?.time?.hour ?? 0;

    /// Get device time
    final now = DateTime.now();

    /// Match api and local device hours
    final isCurrent = (apiHour == now.hour);

    /// Get minutes
    final minute = "${isCurrent ? now.minute : 0}".padLeft(2, '0');
    final istHour = apiHour == 0 ? 0 : (apiHour % 12 == 0 ? 12 : apiHour % 12);
    final hour = istHour.toString().padLeft(2, '0');
    return (
      temp: hourlyData?.tempC?.toStringAsFixed(0) ?? "--",
      icon: hourlyData?.condition?.icon ?? '',
      isCurrent: isCurrent,
      time: "$hour:$minute",
    );
  }
}
