class StateItem {
  final String status;
  final List<States> data;

  StateItem({
    required this.status,
    required this.data,
  });
}

class States {
  final String state;

  States({
    required this.state,
  });
}
