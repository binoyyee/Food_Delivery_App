import 'package:flutter/material.dart';

class ChoiceList extends StatefulWidget {
  const ChoiceList({super.key});

  @override
  State<ChoiceList> createState() => _ChoiceListState();
}

class _ChoiceListState extends State<ChoiceList> {
  @override
  Widget build(BuildContext context) {
    final filters = ['Salads', 'Pizza', 'Beverages', 'Snacks'];
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          //Filter Icon
          ChoiceChip(
            color: const MaterialStatePropertyAll(
              Color.fromARGB(255, 241, 241, 241),
            ),
            onSelected: (value) {},
            //backgroundColor: Color.fromARGB(255, 235, 235, 235),
            label: const Icon(
              Icons.filter_list_outlined,
              color: Color.fromARGB(255, 31, 31, 31),
              size: 20,
            ),
            selectedColor: Color.fromARGB(255, 0, 0, 0),
            showCheckmark: false,
            selected: true,
          ),
          //Horizontal List of filter choices
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(7, 0, 15, 1),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ChoiceChip(
                      color: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 241, 241, 241),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onSelected: (value) {},
                      label: Text(
                        filters[index],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 31, 31, 31),
                            fontWeight: FontWeight.bold),
                      ),
                      showCheckmark: false,
                      selected: true,
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 7,
                    ),
                itemCount: filters.length),
          ),
        ],
      ),
    );
  }
}
