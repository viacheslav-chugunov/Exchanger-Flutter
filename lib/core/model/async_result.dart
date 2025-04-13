class AsyncResult<E extends Object> {
  E? data;
  Exception? error;
  bool isLoading = false;

  AsyncResult.success(E this.data);
  AsyncResult.failure(Exception this.error);
  AsyncResult.loading(): isLoading = true;

  bool get isSuccess => data != null;
  bool get isFailure => error != null;

  E dataOrDefault(E def) => data ?? def;

}