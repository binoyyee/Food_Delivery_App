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
          ActionChip(
            onPressed: () {},
            //backgroundColor: Color.fromARGB(255, 235, 235, 235),
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 31, 31, 31),
            ),
            label: const Icon(
              Icons.filter_list_outlined,
              size: 20,
            ),
          ),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(7, 0, 15, 1),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ChoiceChip(
                    color: MaterialStatePropertyAll(
                      Color.fromARGB(255, 242, 242, 242),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      width: 0,
                    ),
                    onSelected: (value) {},
                    label: Text(
                      filters[index],
                      style: const TextStyle(
                        color: Color.fromARGB(255, 31, 31, 31),
                      ),
                    ),
                    selected: false),
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
