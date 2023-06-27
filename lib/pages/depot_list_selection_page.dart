import 'package:aerplus_customer/miscellaneous/route_functions.dart';
import 'package:aerplus_customer/services/network/depot_services/api_depot_service.dart';
import 'package:aerplus_customer/services/network/models/depot_model.dart';
import 'package:flutter/material.dart';

class DepotListSelectionPage extends StatefulWidget {
  const DepotListSelectionPage({super.key});

  @override
  State<DepotListSelectionPage> createState() => _DepotListSelectionPageState();
}

class _DepotListSelectionPageState extends State<DepotListSelectionPage> {
  final TextEditingController searchController = TextEditingController();
  
  DepotModel? depotModel;
  List<DepotData> sortedDepotList = [];

  @override
  void initState() {
    super.initState();
    
    loadDepot();
  }

  Future loadDepot() async {
    await APIDepotService(context: context).showDepot().then((result) {
      if(result != null) {
        List<DepotData> tempSortedDepotList = [];

        if(result.depotData != null) {
          for(int i = 0; i < result.depotData!.length; i++) {
            if(searchController.text == '') {
              tempSortedDepotList.add(result.depotData![i]);
            } else {
              if(result.depotData![i].name != null && result.depotData![i].name!.toUpperCase().contains(searchController.text.toUpperCase())) {
                tempSortedDepotList.add(result.depotData![i]);
              }
            }
          }
        }

        setState(() {
          depotModel = result;
          sortedDepotList = tempSortedDepotList;
        });
      }
    });
  }

  searchDepot(String query) {
    List<DepotData> tempSortedDepotList = [];

    if(depotModel != null && depotModel!.depotData != null) {
      for(int i = 0; i < depotModel!.depotData!.length; i++) {
        if(query == '') {
          tempSortedDepotList.add(depotModel!.depotData![i]);
        } else {
          if(depotModel!.depotData![i].name != null && depotModel!.depotData![i].name!.toUpperCase().contains(query.toUpperCase())) {
            tempSortedDepotList.add(depotModel!.depotData![i]);
          }
        }
      }
    }

    setState(() {
      sortedDepotList = tempSortedDepotList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Depot',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
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
              onChanged: (String query) => searchDepot(query),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: sortedDepotList.isNotEmpty ?
            RefreshIndicator(
              onRefresh: () => loadDepot(),
              child: ListView.builder(
                itemCount: sortedDepotList.length,
                itemBuilder: (BuildContext listContext, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: InkWell(
                      onTap: () => CloseBack(context: context, callbackData: sortedDepotList[index]).go(),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                sortedDepotList[index].name ?? 'Unknown Depot',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                sortedDepotList[index].phone ?? 'Unknown Phone',
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                sortedDepotList[index].address ?? 'Unknown Address',
                              ),
                            ],
                          ),
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
                  onRefresh: () => loadDepot(),
                  child: ListView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}