enum CUSTOMER_TYPE {
  INVENTOR,
  BROKER,
  FUNDS_ACCOUNT,
  BROKER_FIRM,
  REMISISER,
  MONITOR
}

extension CustomerTypeExt on CUSTOMER_TYPE {
static  CUSTOMER_TYPE getCustomerTypeFromString(String val) {
    switch (val) {
      case 'M':
        return CUSTOMER_TYPE.MONITOR;
      case '1':
        return CUSTOMER_TYPE.INVENTOR;
      case '2':
        return CUSTOMER_TYPE.BROKER;
      case '3':
        return CUSTOMER_TYPE.FUNDS_ACCOUNT;
      case '4':
        return CUSTOMER_TYPE.BROKER_FIRM;
      case '5':
        return CUSTOMER_TYPE.REMISISER;
      default:
        return CUSTOMER_TYPE.MONITOR;
    }
  }
}
