import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetTableView extends StatefulWidget {
  final int scrollOffset;
  final RxBool? isLoadingMore;
  final RxBool? isRefreshing;
  final RxBool? isEmpty;
  final RxBool? isLoading;
  final VoidCallback? onLoadMore;
  final VoidCallback? onRefresh;
  final Widget child;
  final Widget? loadingIndicator;
  final Widget? reloadingIndicator;
  final Widget? loadingMoreIndicator;
  final Widget? emptyView;

  const GetTableView({
    Key? key,
    required this.child,
    this.scrollOffset = 0,
    this.onLoadMore,
    this.onRefresh,
    this.isLoadingMore,
    this.isRefreshing,
    this.isEmpty,
    this.emptyView,
    this.isLoading,
    this.loadingIndicator,
    this.loadingMoreIndicator,
    this.reloadingIndicator,
  }) : super(key: key);

  @override
  _GetTableViewState createState() => _GetTableViewState();
}

class _GetTableViewState extends State<GetTableView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(GetTableView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onLoadMore != null && widget.onRefresh != null) {
      return NotificationListener<ScrollNotification>(
        child: RefreshIndicator(
          child: Column(
            children: [
              _buildLoadingIndicator(),
              _buildReLoadingIndicator(),
              _buildEmptyView(),
              Expanded(child: widget.child),
              _buildLoadingMoreIndicator()
            ],
          ),
          onRefresh: () async => widget.onRefresh!(),
        ),
        onNotification: _handleLoadMoreScroll,
      );
    } else if (widget.onRefresh != null) {
      return RefreshIndicator(
        child: Column(
          children: [
            _buildLoadingIndicator(),
            _buildReLoadingIndicator(),
            _buildEmptyView(),
            Expanded(child: widget.child)
          ],
        ),
        onRefresh: () async => widget.onRefresh!(),
      );
    } else if (widget.onLoadMore != null) {
      return NotificationListener<ScrollNotification>(
        child: Obx(() {
          return Column(
            children: [
              _buildLoadingIndicator(),
              _buildEmptyView(),
              Expanded(child: widget.child),
              _buildLoadingMoreIndicator()
            ],
          );
        }),
        onNotification: _handleLoadMoreScroll,
      );
    }
    return widget.child;
  }

  Widget _buildLoadingIndicator() {
    if (widget.isLoading != null) {
      return Obx(() {
        if (widget.isLoading!.value) {
          if (widget.loadingIndicator == null) {
            return Container(
              width: 55,
              height: 55,
              padding: EdgeInsets.all(15),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else {
            return widget.loadingIndicator!;
          }
        }
        return Container();
      });
    }
    return Container();
  }

  Widget _buildReLoadingIndicator() {
    if (widget.isRefreshing != null) {
      return Obx(() {
        if (widget.isRefreshing!.value) {
          if (widget.reloadingIndicator == null) {
            return Container(
              width: 55,
              height: 55,
              padding: EdgeInsets.all(15),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else {
            return widget.reloadingIndicator!;
          }
        }
        return Container();
      });
    }
    return Container();
  }

  Widget _buildEmptyView() {
    if (widget.isEmpty != null) {
      return Obx(() {
        if (widget.isEmpty!.value) {
          return widget.emptyView ?? Container();
        }
        return Container();
      });
    }
    return Container();
  }

  Widget _buildLoadingMoreIndicator() {
    if (widget.isLoadingMore != null) {
      return Obx(() {
        if (widget.isLoadingMore!.value) {
          if (widget.loadingMoreIndicator == null) {
            return Container(
              width: 55,
              height: 55,
              padding: EdgeInsets.all(15),
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else {
            return widget.loadingMoreIndicator!;
          }
        }
        return Container();
      });
    }
    return Container();
  }

  bool _handleLoadMoreScroll(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      if (notification.metrics.pixels - notification.metrics.maxScrollExtent >
          widget.scrollOffset) {
        if (widget.isLoadingMore != null && widget.onLoadMore != null) {
          if (!widget.isLoadingMore!.value) {
            widget.onLoadMore!();
          }
        }
      }
    }
    return false;
  }
}
