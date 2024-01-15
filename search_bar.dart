class SearchScreen extends GetView<CamSearchController>{
  const SearchScreen({super.key});



  ///Clear Button to hide the search bar
  Widget clearButton() {
    return opacity(

      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
        ),
        child: IconButton(
          tooltip: 'Clear',
          icon: Icon(
            Icons.close,
            size: 16.0,
          ),
          onPressed: () {
            controller.showChange(false);
            ///This will clear up the query
            // widget.onChanged('');

            ///If keyboard is open, this will close it automaitcally
            // FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }

  ///A widget which shows the given child in a specific time period with optional duration
  Widget opacity({required Widget child, Duration? duration}) {
    return AnimatedOpacity(
      opacity: controller.showSearchField ? 1 : 0,
      duration: duration ?? const Duration(seconds: 2),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget searchField() {
      return Expanded(
        child: opacity(
          child: TextField(
            ///Helps to focus immediately
            autofocus: true,

            onTapOutside: (_){

            },
            onChanged:controller.onChanged,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
        ),
      );
    }
    // final Color clearButtonColor = Theme.of(context).primaryColor;
    Widget searchButton({bool enabled = true}) {
      return IconButton(
        tooltip: enabled ? 'Search' : null,
        icon: Icon(
          Icons.search,
         ),
        onPressed: enabled == false
            ? null
            : () {
          controller.showChange(true);
          // if (mounted) setState(() => showSearchField = true);
        },
      );
    }

    ///The [TextField & ClearButton] widgets will be placed in this row
    Widget searchBar() {

      return Row(
        children: [
          if (controller.showSearchField)
            opacity(
              duration:controller.searchAnimDuration,
              child: searchButton(enabled: false),
            ),

          ///For beauty purpose only, this is non functional
          searchField(),

          if (controller.showSearchField)
            clearButton(),
        ],
      );
    }
    ///Color of the clear button

    return GetRouterOutlet.builder(
        builder: (context, delegate, current) {
        return Obx(() {
            return AnimatedContainer(
              height: 60,
              width: 250.0,
              alignment:controller. showSearchField ? Alignment.center : Alignment.centerRight,
              duration:controller.searchAnimDuration,
              // padding: EdgeInsets.only(
              //   top: controller.showSearchField ? 60 : 50,
              //   bottom: controller.showSearchField ? 30 : 20,
              //   left: controller.showSearchField ? 12 : 8,
              //   right: controller.showSearchField ? 12 : 12,
              // ),
              child: AnimatedContainer(
                  duration:controller.searchAnimDuration,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: tileShadow,
                     borderRadius: BorderRadius.circular(360),
                  ),

                  ///If [true], show [searchField()] otherwise simply show the [icon]
                  child: AnimatedCrossFade(
                    firstChild: searchButton(),
                    secondChild: Center(child: searchBar()),
                    duration: controller.searchAnimDuration,
                    crossFadeState: controller.showSearchField ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  )
              ),
            );
          }
        );
      }
    );
  }

}
