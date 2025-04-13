abstract class ViewModel<S extends Object, A extends Object> {
  S state;
  Function emit;

  ViewModel(this.state, this.emit);

  void handle(A action);
}