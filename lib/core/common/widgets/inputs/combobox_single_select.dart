import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iworkout/core/configs/themes/dark_theme.dart';
import 'package:moon_design/moon_design.dart';

class ComboboxSingleSelect extends StatefulWidget {
  final List<String> options;
  final List<TextInputFormatter> formatters;
  final String hintText;
  final void Function(String)? onOptionSelected;

  const ComboboxSingleSelect({
    required this.options,
    this.formatters = const [],
    this.hintText = "Sélectionnez une option",
    this.onOptionSelected,
    super.key,
  });

  @override
  State<ComboboxSingleSelect> createState() => _ComboboxSingleSelectState();
}

class _ComboboxSingleSelectState extends State<ComboboxSingleSelect> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  late List<String> _filteredOptionsList;
  String? _selectedOption;
  bool _showDropdown = false;

  bool get _optionIsSelected => _selectedOption == _searchController.text;

  String get _inputValue => _searchController.text.trim().toLowerCase();

  @override
  void initState() {
    super.initState();
    _filteredOptionsList = widget.options;
  }

  void _performSearch() {
    setState(() {
      if (!_optionIsSelected) _selectedOption = null;

      _filteredOptionsList = widget.options
          .where((option) => option.toLowerCase().contains(_inputValue))
          .toList();
      _showDropdown = true;
    });
  }

  void _handleSelect(String option) {
    setState(() {
      _showDropdown = false;
      _searchController.text = option;
      _selectedOption = option;
      _focusNode.unfocus();
    });
    widget.onOptionSelected?.call(_selectedOption!);
  }

  void _showAllOptionsList() {
    setState(() {
      _filteredOptionsList = widget.options;
      _showDropdown = !_showDropdown;
    });
  }

  void _handleDropdownTapOutside() {
    setState(() {
      _showDropdown = false;
      if (!_optionIsSelected) _searchController.clear();
      _focusNode.unfocus();
    });
  }

  void _handleInputTapOutside() {
    if (_focusNode.hasFocus && !_showDropdown) {
      if (!_optionIsSelected) _searchController.clear();
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MoonDropdown(
        backgroundColor: MoonColors.dark.goku,
        borderColor: PurpleMoonColor,
        show: _showDropdown,
        constrainWidthToChild: true,
        onTapOutside: () => _handleDropdownTapOutside(),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: _filteredOptionsList.isEmpty
              ? const MoonMenuItem(
                  label: Text('No results found.'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: _filteredOptionsList.length,
                  itemBuilder: (BuildContext _, int index) {
                    final String option = _filteredOptionsList[index];

                    return MoonMenuItem(
                      onTap: () => _handleSelect(option),
                      label: Text(option, style: TextStyle(color: MoonColors.dark.bulma)),
                    );
                  },
                ),
        ),
        child: MoonTextInput(
          backgroundColor: MoonColors.dark.goku,
          textColor: MoonColors.dark.bulma,
          focusNode: _focusNode,
          hintText: widget.hintText,
          controller: _searchController,
          inputFormatters: widget.formatters,
          onTap: () => _performSearch(),
          onTapOutside: (PointerDownEvent _) => _handleInputTapOutside(),
          onChanged: (String _) => _performSearch(),
          trailing: MoonButton.icon(
            buttonSize: MoonButtonSize.xs,
            hoverEffectColor: Colors.transparent,
            onTap: () => _showAllOptionsList(),
            icon: AnimatedRotation(
              duration: const Duration(milliseconds: 200),
              turns: _showDropdown ? -0.5 : 0,
              child: Icon(MoonIcons.controls_chevron_down_16_light, color: MoonColors.dark.bulma),
            ),
          ),
        ),
      ),
    );
  }
}
