// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '/Widgets/widgets.dart';

class FindDevicesScreen extends StatelessWidget {
  const FindDevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Devices'),
        actions: const [
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Colors.black,
          //   ),
          //   onPressed: Platform.isAndroid
          //       ? () => FlutterBluePlus.instance.turnOff()
          //       : null,
          //   child: const Text('TURN OFF'),
          // ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            FlutterBluePlus.startScan(timeout: const Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<BluetoothDevice>>(
                  stream: Stream.periodic(
                    const Duration(seconds: 2),
                  ).asyncMap(
                    (_) => FlutterBluePlus.connectedSystemDevices,
                  ),
                  initialData: const [],
                  builder: (c, snapshot) {
                    var d = snapshot.data ?? [];
                    return d.isEmpty
                        ? const Center(
                            child: Text(""),
                          )
                        : Column(
                            children: d
                                .map((d) => ListTile(
                                      title: Text(d.localName),
                                      subtitle: Text(
                                        d.id.toString(),
                                      ),
                                      trailing: StreamBuilder<
                                          BluetoothConnectionState>(
                                        stream: d.connectionState,
                                        initialData: BluetoothConnectionState
                                            .disconnected,
                                        builder: (c, snapshot) {
                                          if (snapshot.data ==
                                              BluetoothConnectionState
                                                  .connected) {
                                            return ElevatedButton(
                                              child: const Text('OPEN'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop<BluetoothDevice>(d);
                                                // Navigator.of(context).push(
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           DefaultHomePage(
                                                //             device: d,
                                                //           )
                                                // DeviceScreen(device: d),
                                                //       ),
                                                // );
                                              },
                                            );
                                          }
                                          return Text(snapshot.data.toString());
                                        },
                                      ),
                                    ))
                                .toList(),
                          );
                  }),
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBluePlus.scanResults,
                initialData: const [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map(
                        (r) => ScanResultTile(
                          result: r,
                          onTap: () {
                            r.device.connect();
                            if (r.device.state ==
                                BluetoothConnectionState.connected) {
                              Navigator.of(context).pop(r.device);
                            } else {
                              // FlutterBluePlus.instance   connect(r.device);
                            }
                            Navigator.of(context).pop(r.device);
                          },
                          //  Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       r.device.connect();
                          //       return DefaultHomePage(
                          //         device: r.device,
                          //       ); //DeviceScreen(device: r.device);
                          //     },
                          //   ),
                          // ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBluePlus.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              onPressed: () => FlutterBluePlus.stopScan(),
              backgroundColor: Colors.red,
              child: const Icon(Icons.stop),
            );
          } else {
            return FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () => FlutterBluePlus.startScan(
                timeout: const Duration(seconds: 4),
              ),
            );
          }
        },
      ),
    );
  }
}
