final List<String> prefectures = [
  '未設定',
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
  '海外',
];

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

final List<int> day_number = [for (int day = 1; day < 32; day++) day];

final Map<String, Map<String, Map<String, List<String>>>> menuData = {
  'レストラン': {
    '和食': {
      '日本料理': ['日本料理'],
      '寿司': [
        '寿司'
            '回転寿司'
            '立ち食い寿司'
            'いなり寿司'
            '棒寿司'
      ],
      '海鮮': [
        '海鮮'
            'ふぐ'
            'かに'
            'すっぽん'
            'あんこう'
            'かき'
      ],
      'うなぎ・あなご': [
        'うなぎ'
            'あなご'
            'どじょう'
      ],
      '天ぷら': ['天ぷら'],
      'とんかつ・揚げ物': [
        'とんかつ'
            '牛カツ'
            '串揚げ'
            'からあげ'
            '揚げ物'
      ],
      '焼き鳥・串焼き・鶏料理': [
        '焼き鳥'
            '串焼き'
            'もつ焼き'
            '鳥料理'
            '手羽先'
      ],
      'すき焼き': ['すき焼き'],
      'しゃぶしゃぶ': [
        'しゃぶしゃぶ'
            '豚しゃぶ'
      ],
      'そば': [
        'そば'
            '立ち食いそば'
      ],
      'うどん': [
        'うどん'
            'カレーうどん'
      ],
      '麺類': [
        '麺類'
            '焼きそば'
            '沖縄そば'
            'ほうとう'
            'ちゃんぽん'
      ],
      'お好み焼き・たこ焼き': [
        'お好み焼き'
            'もんじゃ焼き'
            'たこ焼き'
            '明石焼き'
      ],
      '丼': [
        '丼'
            '牛丼'
            '親子丼'
            '天丼'
            'かつ丼'
            '海鮮丼'
            '豚丼'
      ],
      'おでん': ['おでん'],
      'その他': [
        '郷土料理'
            '沖縄料理'
            '牛タン'
            '麦とろ'
            '釜飯'
            'お茶漬け'
            '豆腐料理'
            'ろばた焼き'
            'きりたんぽ'
            'くじら料理'
      ],
    },
    '洋食・西洋料理': {
      '洋食': [
        '洋食'
            'ハンバーグ'
            'オムライス'
            'コロッケ'
            'スープ'
      ],
      'ステーキ・鉄板焼き': [
        'ステーキ'
            '鉄板焼き'
      ],
      'フレンチ': [
        'フレンチ'
            'ビストロ'
      ],
      'イタリアン': [
        'イタリアン'
            'パスタ'
            'ピザ'
      ],
      'スペイン料理': ['スペイン料理'],
      'ヨーロッパ料理': [
        'ヨーロッパ料理'
            'ポルトガル料理'
            'ドイツ料理'
            'ロシア料理'
            'ギリシャ料理'
      ],
      'アメリカ料理': [
        'アメリカ料理'
            'カルフォニア料理'
            'ハワイ料理'
            'ハンバーガー'
            'ホットドッグ'
      ]
    },
    '中華料理': {
      '中華料理': ['中華料理'],
      '四川料理': ['四川料理'],
      '台湾料理': ['台湾料理'],
      '飲茶・点心': ['飲茶・点心'],
      '餃子': ['餃子'],
      '肉まん': ['肉まん'],
      '小籠包': ['小籠包'],
      '中華粥': ['中華粥'],
    },
    'アジア・エスニック': {
      'アジア・エスニック': ['アジア・エスニック'],
      '韓国料理': [
        '韓国料理'
            '冷麺'
      ],
      '東南アジア料理': [
        '東南アジア料理'
            'タイ料理'
            'ベトナム料理'
            'バインミー'
            'インドネシア料理'
            'シンガポール料理'
      ],
      '南アジア料理': [
        '南アジア料理'
            'インド料理'
            'ネパール料理'
            'パキスタン料理'
            'スリランカ料理'
      ],
      '中東料理': [
        '中東料理'
            'トルコ料理'
            'ケバブ'
            'モロッコ料理'
            'ファラフェル'
      ],
      '中南米料理': [
        '中南米料理'
            'メキシコ料理'
            'タコス'
            'ブラジル料理'
            'シュラスコ'
            'ペルー料理'
      ],
      'アフリカ料理': ['アフリカ料理'],
    },
    'カレー': {
      'カレー': ['カレー'],
      'インドカレー': ['インドカレー'],
      'スープカレー': ['スープカレー'],
    },
    '焼肉・ホルモン': {
      '焼肉': ['焼肉'],
      'ホルモン': ['ホルモン'],
      'ジンギスカン': ['ジンギスカン'],
    },
    '鍋': {
      '鍋': ['鍋'],
      'もつ鍋': ['もつ鍋'],
      '水炊き': ['水炊き'],
      'ちゃんこ鍋': ['ちゃんこ鍋'],
      '火鍋': ['火鍋'],
      'うどんすき': ['うどんすき'],
    },
    '居酒屋': {
      '居酒屋': ['居酒屋'],
      'ダイニングバー': ['ダイニングバー'],
      '立ち飲み': ['立ち飲み'],
      'バル': [
        'バル'
            '肉バル'
      ],
      'ビアガーデン・ビアホール': [
        'ビアガーデン'
            'ビアホール'
      ],
    },
    'その他レストラン': {
      'レストラン・食堂': [
        'レストラン'
            'ファミレス'
            '食堂'
            '学生食堂'
            '社員食堂'
      ],
      '創作料理・イノベーティブ': [
        '創作料理'
            'イノベーティブ'
      ],
      'オーガニック・薬膳': [
        'オーガニック'
            '薬膳'
      ],
      '弁当・おにぎり・惣菜': [
        '弁当'
            'おにぎり'
            '惣菜・デリ'
      ],
      '肉料理': [
        '肉料理'
            '牛料理'
            '豚料理'
            '馬肉料理'
            'ジビエ料理'
      ],
      'シーフード': [
        'シーフード'
            'オイスターバー'
      ],
      'サラダ・野菜料理': [
        'サラダ'
            '野菜料理'
      ],
      'チーズ料理': ['チーズ料理'],
      'にんにく料理': ['にんにく料理'],
      'ビュッフェ': ['ビュッフェ'],
      'バーベキュー': ['バーベキュー'],
      '屋台船・クリージング': ['屋形船・クルージング'],
    },
  },
  'ラーメン': {
    'ラーメン・つけ麺': {
      'ラーメン': ['ラーメン'],
      'つけ麺': ['つけ麺'],
      '油そば・まぜそば': ['油そば・まぜそば'],
      '台湾まぜそば': ['台湾まぜそば'],
      '担々麺': ['台湾まぜそば'],
      '汁なし担々麺': ['台湾まぜそば'],
      '刀削麺': ['刀削麺'],
    },
  },
  'カフェ・パン・スイーツ': {
    'カフェ・喫茶店': {
      'カフェ・喫茶店': [
        'カフェ'
            '喫茶店'
            '甘味処'
            'フルーツパーラー'
            'パンケーキ'
            'コーヒースタンド'
            'ティースタンド'
            'ジューススタンド'
            'タピオカ'
      ],
      'スイーツ': [
        'スイーツ'
            '洋菓子'
            'ケーキ'
            'シュークリーム'
            'チョコレート'
            'ドーナツ'
            'マカロン'
            'バームクーヘン'
            'プリン'
            'クレープ・ガレット'
            '和菓子'
            '大福'
            'たい焼き・大判焼き'
            'どら焼き'
            'カステラ'
            '焼き芋・大学芋'
            'せんべい'
            '中華菓子'
            'ジェラート・アイスクリーム'
            'ソフトクリーム'
            'かき氷'
      ],
      'パン・サンドイッチ': [
        'パン'
            'サンドイッチ'
            'ベーグル'
      ],
    },
  },
  'バー・お酒': {
    'バー': {
      'バー': ['バー'],
      'パブ': ['パブ'],
      'ワインバー': ['ワインバー'],
      'ビアバー': ['ビアバー'],
      'スポーツバー': ['スポーツバー'],
      '日本酒バー': ['日本酒バー'],
      '焼酎バー': ['焼酎バー'],
    },
  },
  '料理旅館・オーベルジュ': {
    '料理旅館・オーベルジュ': {
      '料理旅館': ['料理旅館'],
      'オーベルジュ': ['料理旅館'],
    }
  },
  'その他': {
    'その他': {
      'その他': [
        'カラオケ'
            'ダーツ'
            'ホテル'
            '旅館・民宿'
            '結婚式場'
            '道の駅'
            'コンビニ・スーパー'
            '売店'
      ],
    },
  }
};

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
