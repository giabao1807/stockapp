enum TypeCodeDateChart {
  IndexCode(id: 0),
  StockCode(id: 1);

  const TypeCodeDateChart({required this.id});

  final int id;
}