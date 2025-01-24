import 'package:equatable/equatable.dart';

class HomeScreenState extends Equatable {
  final String animatedSearchText;

  const HomeScreenState(this.animatedSearchText);

  @override
  List<Object> get props => [animatedSearchText];

  get searchText => null;
}
