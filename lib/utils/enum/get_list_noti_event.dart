// ignore_for_file: camel_case_types

enum GET_LIST_NOTI_EVENT {
  BEFORELOGIN(1),
  AFTERLOGIN(2),
  FIRSTTIME(3);

  final int value;
  const GET_LIST_NOTI_EVENT(this.value);
}
