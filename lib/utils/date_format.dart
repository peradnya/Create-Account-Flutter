class DateFormat {
  static const _weekday = [
    '',
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];

  static const _month = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'Mei',
    'Jun',
    'Jul',
    'Agt',
    'Sep',
    'Okt',
    'Nov',
    'Des',
  ];

  static String formatDate(DateTime date) {
    if (date == null) {
      return '';
    } else {
      return '${_weekday[date.weekday]}, ${date.day.toString().padLeft(2, '0')} ${_month[date.month]} ${date.year}';
    }
  }

  static String formatTime(DateTime date) {
    if (date == null) {
      return '';
    } else {
      return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    }
  }
}
