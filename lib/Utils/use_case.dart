abstract class UseCase<ReturnType, Params> {
  Future<ReturnType> execute(Params params);
}
