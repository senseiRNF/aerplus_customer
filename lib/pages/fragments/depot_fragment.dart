import 'package:aerplus_customer/services/network/models/depot_model.dart';
import 'package:flutter/material.dart';

class DepotFragment extends StatelessWidget {
  final BuildContext context;
  final TextEditingController searchController;
  final List<DepotData> depotList;
  final Function onQuerySearch;
  final Function onSelectDepot;
  final Function onRefresh;

  const DepotFragment({
    super.key,
    required this.context,
    required this.searchController,
    required this.depotList,
    required this.onQuerySearch,
    required this.onSelectDepot,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Cari depot...',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: UnderlineInputBorder(),
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
            textInputAction: TextInputAction.done,
            onChanged: (String query) => onQuerySearch(query),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: depotList.isNotEmpty ?
          RefreshIndicator(
            onRefresh: () => onRefresh(),
            child: ListView.builder(
              itemCount: depotList.length,
              itemBuilder: (BuildContext listContext, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            depotList[index].name ?? 'Unknown Depot',
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            depotList[index].phone ?? 'Unknown Phone',
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            depotList[index].address ?? 'Unknown Address',
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ) :
          Stack(
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 50.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Data depot tidak ditemukan...',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              RefreshIndicator(
                onRefresh: () => onRefresh(),
                child: ListView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}