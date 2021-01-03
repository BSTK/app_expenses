class Formatacao {

  static String dataDDMMYYYYHHMMSS(DateTime data) {
    return
      '${ data.hour }:'
      '${ data.minute }:'
      '${ data.second }'
      ' '
      '${ padddingZero(data.day) }/'
      '${ padddingZero(data.month) }/'
      '${ data.year }';
  }

  static String padddingZero(int data) {
    return (data < 10) ? '0$data' : '$data';
  }

}
