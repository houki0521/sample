final List<String> prefectures = [
    '選択してください',
    '北海道',
    '青森県',
    '岩手県',
    '宮城県',
    '秋田県',
    '山形県',
    '福島県',
    '茨城県',
    '栃木県',
    '群馬県',
    '埼玉県',
    '千葉県',
    '東京都',
    '神奈川県',
    '新潟県',
    '富山県',
    '石川県',
    '福井県',
    '山梨県',
    '長野県',
    '岐阜県',
    '静岡県',
    '愛知県',
    '三重県',
    '滋賀県',
    '京都府',
    '大阪府',
    '兵庫県',
    '奈良県',
    '和歌山県',
    '鳥取県',
    '島根県',
    '岡山県',
    '広島県',
    '山口県',
    '徳島県',
    '香川県',
    '愛媛県',
    '高知県',
    '福岡県',
    '佐賀県',
    '長崎県',
    '熊本県',
    '大分県',
    '宮崎県',
    '鹿児島県',
    '沖縄県',
  ];

final List<int> day_number = [for (int day = 1; day < 32; day++) day];

  final List<int> month_number = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
  ];

  // final List<int> day_number = [for(int day = 1; day < 32; day++) day];

  
Map<int, String> weekdayNames = {
  DateTime.monday: '月',
  DateTime.tuesday: '火',
  DateTime.wednesday: '水',
  DateTime.thursday: '木',
  DateTime.friday: '金',
  DateTime.saturday: '土',
  DateTime.sunday: '日',
};
List<String> weekdays = ['月', '火', '水', '木', '金', '土', '日'];

final List<int> year_number = [for (int year = 1900; year <= 2024; year++) year];
