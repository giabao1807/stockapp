class GlobalAppConfig {
  List<ServerNode> server_node_list;
  String avatar_restful_domain;
  String sub_path_stream;
  String sub_path_trading;
  String comp_full;
  String comp_full_e;
  String comp_full_cn;
  String copyright;
  String copyright_e;
  String copyright_cn;
  String branch_location;
  List<String> list_index;
  List<String> language_list;
  String shortName;
  String logo_text;
  String term_service;
  String privacy_policy;
  String appIdOnesignal;
  String link_playStore;
  String link_appStore;
  String application_style;

  GlobalAppConfig({
    required this.server_node_list,
    required this.avatar_restful_domain,
    required this.sub_path_stream,
    required this.sub_path_trading,
    required this.comp_full,
    required this.comp_full_e,
    required this.comp_full_cn,
    required this.copyright,
    required this.copyright_e,
    required this.copyright_cn,
    required this.branch_location,
    required this.list_index,
    required this.language_list,
    required this.shortName,
    required this.logo_text,
    required this.term_service,
    required this.privacy_policy,
    required this.appIdOnesignal,
    required this.link_playStore,
    required this.link_appStore,
    required this.application_style,
  });

  factory GlobalAppConfig.fromJson(Map<String, dynamic> json) {
    return GlobalAppConfig(
      server_node_list: List<ServerNode>.from(
          json['server_node_list'].map((x) => ServerNode.fromJson(x))),
      avatar_restful_domain: json['avatar_restful_domain'],
      sub_path_stream: json['sub_path_stream'],
      sub_path_trading: json['sub_path_trading'],
      comp_full: json['comp_full'],
      comp_full_e: json['comp_full_e'],
      comp_full_cn: json['comp_full_cn'],
      copyright: json['copyright'],
      copyright_e: json['copyright_e'],
      copyright_cn: json['copyright_cn'],
      branch_location: json['branch_location'],
      list_index: List<String>.from(json['list_index']),
      language_list: List<String>.from(json['language_list']),
      shortName: json['shortName'],
      logo_text: json['logo_text'],
      term_service: json['term_service'],
      privacy_policy: json['privacy_policy'],
      appIdOnesignal: json['appIdOnesignal'],
      link_playStore: json['link_playStore'],
      link_appStore: json['link_appStore'],
      application_style: json['application_style'],
    );
  }
}

class ServerNode {
  int index;
  String location;
  String key_name;
  String key_name_note;
  String icon;
  StreamServer stream_server;
  TradingServer trading_server;

  ServerNode({
    required this.index,
    required this.location,
    required this.key_name,
    required this.key_name_note,
    required this.icon,
    required this.stream_server,
    required this.trading_server,
  });

  factory ServerNode.fromJson(Map<String, dynamic> json) {
    return ServerNode(
      index: json['index'],
      location: json['location'],
      key_name: json['key_name'],
      key_name_note: json['key_name_note'],
      icon: json['icon'],
      stream_server: StreamServer.fromJson(json['stream_server']),
      trading_server: TradingServer.fromJson(json['trading_server']),
    );
  }
}

class StreamServer {
  List<String> ip_address;

  StreamServer({required this.ip_address});

  factory StreamServer.fromJson(Map<String, dynamic> json) {
    return StreamServer(
      ip_address: List<String>.from(json['ip_address']),
    );
  }
}

class TradingServer {
  List<String> ip_address;

  TradingServer({required this.ip_address});

  factory TradingServer.fromJson(Map<String, dynamic> json) {
    return TradingServer(
      ip_address: List<String>.from(json['ip_address']),
    );
  }
}

class ApplicationStyle {
  String default_style;
  bool auto_start_login_screen;
  bool default_hide_assets;
  bool show_get_iotp;
  bool is_iotp_off;
  bool is_history_login_screen_on;
  bool is_change_otp_type_screen_on;
  bool is_oddlot_info_order;
  bool is_update_user_info_screen_on;
  String zalo_support_link;
  bool is_show_pass_forget_warning;
  String zalo_support_content_key;

  ApplicationStyle({
    required this.default_style,
    required this.auto_start_login_screen,
    required this.default_hide_assets,
    required this.show_get_iotp,
    required this.is_iotp_off,
    required this.is_history_login_screen_on,
    required this.is_change_otp_type_screen_on,
    required this.is_oddlot_info_order,
    required this.is_update_user_info_screen_on,
    required this.zalo_support_link,
    required this.is_show_pass_forget_warning,
    required this.zalo_support_content_key,
  });

  factory ApplicationStyle.fromJson(Map<String, dynamic> json) {
    return ApplicationStyle(
      default_style: json['default_style'],
      auto_start_login_screen: json['auto_start_login_screen'],
      default_hide_assets: json['default_hide_assets'],
      show_get_iotp: json['show_get_iotp'],
      is_iotp_off: json['is_iotp_off'],
      is_history_login_screen_on: json['is_history_login_screen_on'],
      is_change_otp_type_screen_on: json['is_change_otp_type_screen_on'],
      is_oddlot_info_order: json['is_oddlot_info_order'],
      is_update_user_info_screen_on: json['is_update_user_info_screen_on'],
      zalo_support_link: json['zalo_support_link'],
      is_show_pass_forget_warning: json['is_show_pass_forget_warning'],
      zalo_support_content_key: json['zalo_support_content_key'],
    );
  }
}

const Map<IActiveCode,String> Company = {
      IActiveCode.altisss: '888',
    IActiveCode.shinhan: '081',
    IActiveCode.nsi: '028',
    IActiveCode.gtjai: '061',
    IActiveCode.apsc: '036',
    IActiveCode.vise: '020',
    IActiveCode.ysvn: '004',
    IActiveCode.vncsi: '102',
    IActiveCode.vietsc: '023',
    IActiveCode.beta: '075',
    IActiveCode.hbse: '082',
    IActiveCode.asam: '099',
};

enum IActiveCode {
      altisss,
    shinhan,
    nsi,
    gtjai,
    apsc,
    vise,
    ysvn,
    vncsi,
    vietsc,
    beta,
    hbse,
    asam,
}

// const String activeCode = Company[IActiveCode.altisss];