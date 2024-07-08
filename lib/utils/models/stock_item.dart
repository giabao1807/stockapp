class StockInfo {
  String stockCode; // -- name of stock node
  double t31; // -- MatchPrice
  double t31Incr; // -- Giá trị tăng giảm
  double t31IncrPer; // -- tỷ lệ tăng giảm
  String t31Color; // -- MatchPrice
  double t32; // -- MatchQty

  String t55; // -- stock code
  double t137; // -- OpenPrice Giá mở cửa
  String t137Color; // -- OpenPrice
  double t139; // -- ClosePrice
  String t139Color; // -- ClosePrice

  double ref;
  double t260; // -- BasicPrice
  double t266; // -- HighestPrice Giá cao nhất
  String t266Color; // -- HighestPrice
  String t327; //-- ListingStatus
  double t332; // -- CeilingPrice
  double t333; // -- FloorPrice
  double t387; // -- TotalVolumeTraded
  double t391; //-- TotalTradedQtty
  double t392; //-- TotalTradedValue
  double t397; // -- BuyForeignQtty
  double t398; // -- SellForeignQtty
  double t631; // -- MidPx Giá trung bình
  String t631Color; // -- MidPx

  double t2661; // -- LowestPrice Giá thấp nhất
  String t2661Color; // -- LowestPrice
  double t3301; // -- RemainForeignQtty
  double t3871; // -- TotalValueTraded

  double t3971; // -- BuyForeignValue
  double t3981; // -- SellForeignValue
  double seq; // -- seq
  String U6; // -- U6
  String U7; // -- U7
  String U8; // -- U8
  String U9; // -- U9
  String U10; // -- San giao dich
  double t555; // -- Top price
  double t5561; // -- NumTopPrice
  double t1321; // -- BestBidPrice Giá dư mua 1
  String t1321Color; // -- BestBidPrice
  double t13211; // -- BestBidQtty
  double t1331; // -- BestOfferPrice Giá dư bán 1
  String t1331Color; // -- BestOfferPrice
  double t13311; // -- BestOfferQtty
  double t5562; // -- NumTopPrice
  double t1322; // -- BestBidPrice Dư mua giá 2
  String t1322Color; // -- BestBidPrice
  double t13212; // -- BestBidQtty
  double t1332; // -- BestOfferPrice Giá dư bán 2
  String t1332Color; // -- BestOfferPrice
  double t13312; // -- BestOfferQtty
  double t5563; // -- NumTopPrice
  double t1323; // -- BestBidPrice Dư mua giá 3
  String t1323Color; // -- Cột màu tương ứng
  double t13213; // -- BestBidQtty
  double t1333; // -- BestOfferPrice Giá dư bán 3
  String t1333Color; // -- BestOfferPrice
  double t13313; // -- BestOfferQtty

  double t5564; // -- NumTopPrice
  double t1324; // -- BestBidPrice
  String t1324Color; // -- Cột màu tương ứng
  double t13214; // -- BestBidQtty
  double t1334; // -- BestOfferPrice
  String t1334Color; // -- BestOfferPrice
  double t13314; // -- BestOfferQtty

  double t5565; // -- NumTopPrice
  double t1325; // -- BestBidPrice
  String t1325Color; // -- Cột màu tương ứng
  double t13215; // -- BestBidQtty
  double t1335; // -- BestOfferPrice
  String t1335Color; // -- BestOfferPrice
  double t13315; // -- BestOfferQtty

  double t5566; // -- NumTopPrice
  double t1326; // -- BestBidPrice
  String t1326Color; // -- Cột màu tương ứng
  double t13216; // -- BestBidQtty
  double t1336; // -- BestOfferPrice
  String t1336Color; // -- BestOfferPrice
  double t13316; // -- BestOfferQtty

  double t5567; // -- NumTopPrice
  double t1327; // -- BestBidPrice
  String t1327Color; // -- Cột màu tương ứng
  double t13217; // -- BestBidQtty
  double t1337; // -- BestOfferPrice
  String t1337Color; // -- BestOfferPrice
  double t13317; // -- BestOfferQtty

  double t5568; // -- NumTopPrice
  double t1328; // -- BestBidPrice
  String t1328Color; // -- Cột màu tương ứng
  double t13218; // -- BestBidQtty
  double t1338; // -- BestOfferPrice
  String t1338Color; // -- BestOfferPrice
  double t13318; // -- BestOfferQtty

  double t5569; // -- NumTopPrice
  double t1329; // -- BestBidPrice
  String t1329Color; // -- Cột màu tương ứng
  double t13219; // -- BestBidQtty
  double t1339; // -- BestOfferPrice
  String t1339Color; // -- BestOfferPrice
  double t13319; // -- BestOfferQtty

  double t55610; // -- NumTopPrice
  double t13210; // -- BestBidPrice
  String t13210Color; // -- Cột màu tương ứng
  double t132110; // -- BestBidQtty
  double t13310; // -- BestOfferPrice
  String t13310Color; // -- BestOfferPrice
  double t133110; // -- BestOfferQtty

  List<dynamic> TP;
  List<dynamic> EP;
  double U17; // -- BestOfferQtty
  double U18; // -- BestOfferQtty
  String U24; // CK cơ sở (cho Chứng quyền)
  double U22; // Giá thực hiện (cho Chứng quyền)
  String U23; // Tỷ lệ chuyển đổi (cho Chứng quyền)
  double t109; // Khối lượng niêm yết (cho Chứng quyền)
  String U20; // Ngày Đáo hạn
  String U21; // Ngày GD gần nhất
  String U19; // Loại chứng quyền
  double U29; // Giá trần dự kiến
  double U30; // Giá sàn dự kiến
  double U31; // Giá tham chiếu dự kiến
  String timeServer;
  double lastSeq;
  String timeStock; // follow SI

  StockInfo({
    this.stockCode = '',
    this.t31 = 0,
    this.t31Incr = 0,
    this.t31IncrPer = 0,
    this.t31Color = 'orange',
    this.t32 = 0,
    this.t55 = '',
    this.t137 = 0,
    this.t137Color = 'orange',
    this.t139 = 0,
    this.t139Color = 'orange',
    this.ref = 0,
    this.t260 = 0,
    this.t266 = 0,
    this.t266Color = 'orange',
    this.t327 = '',
    this.t332 = 0,
    this.t333 = 0,
    this.t387 = 0,
    this.t391 = 0,
    this.t392 = 0,
    this.t397 = 0,
    this.t398 = 0,
    this.t631 = 0,
    this.t631Color = 'orange',
    this.t2661 = 0,
    this.t2661Color = 'orange',
    this.t3301 = 0,
    this.t3871 = 0,
    this.t3971 = 0,
    this.t3981 = 0,
    this.seq = 0,
    this.U6 = '',
    this.U7 = '',
    this.U8 = '',
    this.U9 = '',
    this.U10 = '',
    this.t555 = 0,
    this.t5561 = 0,
    this.t1321 = 0,
    this.t1321Color = 'orange',
    this.t13211 = 0,
    this.t1331 = 0,
    this.t1331Color = 'orange',
    this.t13311 = 0,
    this.t5562 = 0,
    this.t1322 = 0,
    this.t1322Color = 'orange',
    this.t13212 = 0,
    this.t1332 = 0,
    this.t1332Color = 'orange',
    this.t13312 = 0,
    this.t5563 = 0,
    this.t1323 = 0,
    this.t1323Color = 'orange',
    this.t13213 = 0,
    this.t1333 = 0,
    this.t1333Color = 'orange',
    this.t13313 = 0,
    this.t5564 = 0,
    this.t1324 = 0,
    this.t1324Color = 'orange',
    this.t13214 = 0,
    this.t1334 = 0,
    this.t1334Color = 'orange',
    this.t13314 = 0,
    this.t5565 = 0,
    this.t1325 = 0,
    this.t1325Color = 'orange',
    this.t13215 = 0,
    this.t1335 = 0,
    this.t1335Color = 'orange',
    this.t13315 = 0,
    this.t5566 = 0,
    this.t1326 = 0,
    this.t1326Color = 'orange',
    this.t13216 = 0,
    this.t1336 = 0,
    this.t1336Color = 'orange',
    this.t13316 = 0,
    this.t5567 = 0,
    this.t1327 = 0,
    this.t1327Color = 'orange',
    this.t13217 = 0,
    this.t1337 = 0,
    this.t1337Color = 'orange',
    this.t13317 = 0,
    this.t5568 = 0,
    this.t1328 = 0,
    this.t1328Color = 'orange',
    this.t13218 = 0,
    this.t1338 = 0,
    this.t1338Color = 'orange',
    this.t13318 = 0,
    this.t5569 = 0,
    this.t1329 = 0,
    this.t1329Color = 'orange',
    this.t13219 = 0,
    this.t1339 = 0,
    this.t1339Color = 'orange',
    this.t13319 = 0,
    this.t55610 = 0,
    this.t13210 = 0,
    this.t13210Color = 'orange',
    this.t132110 = 0,
    this.t13310 = 0,
    this.t13310Color = 'orange',
    this.t133110 = 0,
    this.TP = const [],
    this.EP = const [],
    this.U17 = 0,
    this.U18 = 0,
    this.U24 = '',
    this.U22 = 0,
    this.U23 = '',
    this.t109 = 0,
    this.U20 = '',
    this.U21 = '',
    this.U19 = '',
    this.U29 = 0,
    this.U30 = 0,
    this.U31 = 0,
    this.timeServer = '',
    this.lastSeq = 0,
    this.timeStock = '',
  });
}
