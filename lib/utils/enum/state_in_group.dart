enum StateInGroup { NONE, REQUESTED, INVITED, JOINED, BLOCKED }

extension StateInGroupExt on StateInGroup {
  static const values = {
    0: StateInGroup.NONE,
    1: StateInGroup.REQUESTED,
    2: StateInGroup.INVITED,
    3: StateInGroup.JOINED,
    4: StateInGroup.BLOCKED,
  };
}
