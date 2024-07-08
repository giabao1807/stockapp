enum SortType { idle, up, down }

class SortUtils {
  static SortType getSortDirection(SortType type) {
    switch (type) {
      case SortType.idle:
        return SortType.up;
      case SortType.up:
        return SortType.down;
      case SortType.down:
        return SortType.idle;
    }
  }

  static List<T> sortColumn<T>({
    required String sortColumn,
    required SortType direction,
    required List<Map<dynamic, dynamic>> data,
    required bool isSortString,
    T Function(Map<dynamic, dynamic>)? returnObj,
    String? returnField,
  }) {
    if (direction == SortType.down) {
      if (isSortString) {
        data.sort((a, b) {
          if (b[sortColumn] == null) {
            return -1;
          } else if (a[sortColumn] == null) {
            return 1;
          } else {
            return (b[sortColumn] as String).compareTo(a[sortColumn]);
          }
        });
      } else {
        data.sort((a, b) {
          if (a[sortColumn] == null && b[sortColumn] == null) {
            return 0;
          } else if (a[sortColumn] == null) {
            return 1;
          } else if (b[sortColumn] == null) {
            return -1;
          } else {
            return (b[sortColumn] as num).compareTo(a[sortColumn] as num);
          }
        });
      }
    } else {
      if (isSortString) {
        data.sort((a, b) {
          if (b[sortColumn] == null) {
            return 1;
          } else if (a[sortColumn] == null) {
            return -1;
          } else {
            return (a[sortColumn] as String).compareTo(b[sortColumn]);
          }
        });
      } else {
        data.sort((a, b) {
          if (a[sortColumn] == null && b[sortColumn] == null) {
            return 0;
          } else if (a[sortColumn] == null) {
            return -1;
          } else if (b[sortColumn] == null) {
            return 1;
          } else {
            return (a[sortColumn] as num).compareTo(b[sortColumn] as num);
          }
        });
      }
    }

    if (returnObj != null) {
      return data.map((e) => returnObj(e)).toList();
    }
    return data.map((e) => e[returnField ?? 'stockCode'] as T).toList();
  }
}
