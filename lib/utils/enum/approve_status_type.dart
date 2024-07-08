// ignore: camel_case_types
enum APPROVE_STATUS {
  BY_THE_PROFESSION,
  APPROVED_ALL,
  NOT_APROVED,
  WAITING_APPROVE
}

// Describe in Vietnamese for anyone who needs it
// List<String> detailStatus = [
//   'Hồ sơ đã được duyệt bởi nghiệp vụ',
//   'Hồ sơ đã duyệt toàn bộ có thể giao dịch',
//   'Hồ sơ chưa được duyệt',
//   'Hồ sơ đang chờ xét duyệt'
// ];

extension ApproveStatusExt on APPROVE_STATUS {
  static const types = {
    APPROVE_STATUS.BY_THE_PROFESSION: 'Y',
    APPROVE_STATUS.APPROVED_ALL: 'A',
    APPROVE_STATUS.NOT_APROVED: 'N',
    APPROVE_STATUS.WAITING_APPROVE: 'W',
  };

  static APPROVE_STATUS getCustomerTypeFromString(String val) {
    switch (val) {
      case 'Y':
        return APPROVE_STATUS.BY_THE_PROFESSION;
      case 'A':
        return APPROVE_STATUS.APPROVED_ALL;
      case 'N':
        return APPROVE_STATUS.NOT_APROVED;
      case 'W':
        return APPROVE_STATUS.WAITING_APPROVE;
      default:
        return APPROVE_STATUS.BY_THE_PROFESSION;
    }
  }

  String? get idString => types[this];
}
