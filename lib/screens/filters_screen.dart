// import 'package:course_4th_project/screens/main_drawer.dart';
// import 'package:course_4th_project/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _gluttenFreeFiltersSet = false;
  var _lactoseFreeFiltersSet = false;
  var _vegetarianFiltersSet = false;
  var _veganFiltersSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final currentFilter = ref.read(filterProvider);
    _gluttenFreeFiltersSet = currentFilter[Filter.gluttenFree]!;
    _lactoseFreeFiltersSet = currentFilter[Filter.lactoseFree]!;
    _vegetarianFiltersSet = currentFilter[Filter.vegetarian]!;
    _veganFiltersSet = currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('your filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filterProvider.notifier).setFilters({
            Filter.gluttenFree: _gluttenFreeFiltersSet,
            Filter.lactoseFree: _lactoseFreeFiltersSet,
            Filter.vegetarian: _vegetarianFiltersSet,
            Filter.vegan: _veganFiltersSet,
          });
          // Navigator.of(context).pop({
          //   Filter.gluttenFree: _gluttenFreeFiltersSet,
          //   Filter.lactoseFree: _lactoseFreeFiltersSet,
          //   Filter.vegetarian: _vegetarianFiltersSet,
          //   Filter.vegan: _veganFiltersSet,
          // });
          return true;
        },
        child: Column(children: [
          SwitchListTile(
            value: _gluttenFreeFiltersSet,
            onChanged: (isChecked) {
              setState(() {
                _gluttenFreeFiltersSet = isChecked;
              });
            },
            title: Text(
              'Glutten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include glutten-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactoseFreeFiltersSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFiltersSet = isChecked;
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vegetarianFiltersSet,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFiltersSet = isChecked;
              });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganFiltersSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFiltersSet = isChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ]),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
