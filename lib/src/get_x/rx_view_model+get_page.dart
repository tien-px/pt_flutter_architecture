//ignore_for_file: close_sinks
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

class GetPageResult<T> {
  Stream<PagingInfo<T>> item;
  Stream<void> fetch;
  Stream<bool> isLoading;
  Stream<bool> isRefreshing;
  Stream<bool> isLoadingMore;
  Stream<bool> isEmpty;

  GetPageResult(
      {required this.item,
      required this.fetch,
      required this.isLoading,
      required this.isRefreshing,
      required this.isLoadingMore,
      required this.isEmpty});
}

class GetPageInputWithParams<Item, Input> {
  Stream<Input> loadTrigger;
  Stream<Input> reloadTrigger;
  Stream<Input> loadMoreTrigger;
  Stream<PagingInfo<Item>> Function(Input) getItems;
  Stream<PagingInfo<Item>> Function(Input, int) loadMoreItems;

  GetPageInputWithParams(
      {required this.loadTrigger,
      required this.reloadTrigger,
      required this.loadMoreTrigger,
      required this.getItems,
      required this.loadMoreItems});
}

class GetPageInput<Item> {
  Stream<void> loadTrigger;
  Stream<void> reloadTrigger;
  Stream<void> loadMoreTrigger;
  Stream<PagingInfo<Item>> Function() getItems;
  Stream<PagingInfo<Item>> Function(int) loadMoreItems;

  GetPageInput(
      {required this.loadTrigger,
      required this.reloadTrigger,
      required this.loadMoreTrigger,
      required this.getItems,
      required this.loadMoreItems});
}

extension GetPageMethods on RxViewModel {
  GetPageResult<Item> getPageWithParams<Item, Input>(
      GetPageInputWithParams<Item, Input> input) {
    var pageSubject =
        BehaviorSubject<PagingInfo<Item>>.seeded(PagingInfo(1, [], true));

    var isLoading = BehaviorSubject<bool>.seeded(false);
    var isRefreshing = BehaviorSubject<bool>.seeded(false);
    var isLoadingMore = BehaviorSubject<bool>.seeded(false);

    var isEmpty = BehaviorSubject<bool>.seeded(false);

    var isLoadingOrLoadingMore =
        Rx.merge([isLoading, isRefreshing, isLoadingMore])
            .startWith(false)
            .asBroadcastStream();

    var loadItems = input.loadTrigger
        .doOnData((_) => isEmpty.add(false))
        .withLatestFromWithOrigin(isLoadingOrLoadingMore)
        .where((t) => !t.i)
        .switchMap((t) => input.getItems(t.o).trackActivity(isLoading))
        .doOnData((page) {
          if (page.items.isEmpty) {
            isEmpty.add(true);
          }
          pageSubject.add(page);
        })
        .mapToVoid()
        .asBroadcastStream();

    var reloadItems = input.reloadTrigger
        .doOnData((_) {
          isEmpty.add(false);
          pageSubject.add(PagingInfo(1, [], true));
        })
        .withLatestFromWithOrigin(isLoadingOrLoadingMore)
        .where((t) => !t.i)
        .switchMap((t) => input.getItems(t.o).trackActivity(isRefreshing))
        .doOnData((page) {
          if (page.items.isEmpty) {
            isEmpty.add(true);
          }
          pageSubject.add(page);
        })
        .mapToVoid()
        .asBroadcastStream();

    var loadMoreItems = input.loadMoreTrigger
        .doOnData((_) => isEmpty.add(false))
        .throttleS(1000)
        .withLatestFromWithOrigin(isLoadingOrLoadingMore)
        .where((t) => !t.i)
        .withLatestFromWithOrigin(pageSubject)
        .where((t) => t.i.hasMorePages)
        .switchMap((t) {
          var param = t.o.o;
          var subject = t.i;
          var page = subject.items.isNotEmpty ? subject.page + 1 : subject.page;
          return input.loadMoreItems(param, page).trackActivity(isLoadingMore);
        })
        .withLatestFromWithOrigin(pageSubject)
        .doOnData((t) {
          var newPage = t.o;
          var currentPage = t.i;
          var newItems = currentPage.items + newPage.items;
          var page =
              PagingInfo<Item>(newPage.page, newItems, newPage.hasMorePages);
          pageSubject.add(page);
        })
        .mapToVoid()
        .asBroadcastStream();

    var fetchItems = Rx.merge([loadItems, reloadItems, loadMoreItems]);

    return GetPageResult(
        item: pageSubject,
        fetch: fetchItems,
        isLoading: isLoading,
        isRefreshing: isRefreshing,
        isLoadingMore: isLoadingMore,
        isEmpty: isEmpty);
  }

  GetPageResult<Item> getPage<Item>(GetPageInput<Item> input) {
    return getPageWithParams(GetPageInputWithParams(
        loadTrigger: input.loadTrigger,
        reloadTrigger: input.reloadTrigger,
        loadMoreTrigger: input.loadMoreTrigger,
        getItems: (_) => input.getItems(),
        loadMoreItems: (_, page) => input.loadMoreItems(page)));
  }
}
