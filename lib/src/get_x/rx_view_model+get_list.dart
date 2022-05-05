//ignore_for_file: close_sinks
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class GetListResult<T> {
  Stream<List<T>> list;
  Stream<void> fetch;
  Stream<bool> isLoading;
  Stream<bool> isRefreshing;
  Stream<bool> isEmpty;

  GetListResult(
      {required this.list,
      required this.fetch,
      required this.isLoading,
      required this.isRefreshing,
      required this.isEmpty});
}

class GetListInput<Item> {
  Stream<void> loadTrigger;
  Stream<void> reloadTrigger;
  Stream<List<Item>> Function() getItems;

  GetListInput(
      {required this.loadTrigger,
      required this.reloadTrigger,
      required this.getItems});
}

extension GetListMethods on RxViewModel {
  GetListResult<Item> getList<Item>(GetListInput<Item> input) {
    var listSubject = BehaviorSubject<List<Item>>.seeded([]);

    var isLoading = BehaviorSubject<bool>.seeded(false);
    var isRefreshing = BehaviorSubject<bool>.seeded(false);
    var isEmpty = BehaviorSubject<bool>.seeded(false);

    var isLoadingOrLoadingMore = Rx.merge([isLoading, isRefreshing])
        .startWith(false)
        .asBroadcastStream();

    var loadItems = input.loadTrigger
        .doOnData((_) => isEmpty.add(false))
        .withLatestFromS(isLoadingOrLoadingMore)
        .where((isLoadingOrLoadingMore) => !isLoadingOrLoadingMore)
        .switchMap((_) => input.getItems().trackActivity(isLoading))
        .doOnData((items) {
          if (items.isEmpty) {
            isEmpty.add(true);
          }
          listSubject.add(items);
        })
        .mapToVoid()
        .asBroadcastStream();

    var reloadItems = input.reloadTrigger
        .doOnData((_) {
          isEmpty.add(false);
          listSubject.add([]);
        })
        .withLatestFromS(isLoadingOrLoadingMore)
        .where((isLoadingOrLoadingMore) => !isLoadingOrLoadingMore)
        .switchMap((_) => input.getItems().trackActivity(isRefreshing))
        .doOnData((items) {
          if (items.isEmpty) {
            isEmpty.add(true);
          }
          listSubject.add(items);
        })
        .mapToVoid()
        .asBroadcastStream();

    var fetchItems = Rx.merge([loadItems, reloadItems]);

    return GetListResult(
        list: listSubject,
        fetch: fetchItems,
        isLoading: isLoading,
        isRefreshing: isRefreshing,
        isEmpty: isEmpty);
  }
}
