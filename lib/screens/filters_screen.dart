import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
  }

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile('Gluten-Free',
                    'Only include Gluten free meals', _glutenFree, (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                _buildSwitchTile('Lactose-Free',
                    'Only include Lactose free meals', _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                _buildSwitchTile('Vegan', 'Only include Vegan meals', _vegan,
                    (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
                _buildSwitchTile(
                    'Vegetarian', "Only include Vegetarian meals", _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
