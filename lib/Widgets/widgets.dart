// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../Graphs/HRate.dart';
import '../Graphs/StepCount.dart';
import '../Graphs/Temperature.dart';

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result, this.onTap})
      : super(key: key);

  final ScanResult result;
  final VoidCallback? onTap;

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            result.device.name,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            result.device.id.toString(),
            style: Theme.of(context).textTheme.caption,
          )
        ],
      );
    } else {
      return Text(result.device.id.toString());
    }
  }

  Widget _buildAdvRow(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.caption),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.apply(color: Colors.black),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  String getNiceServiceData(Map<String, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: _buildTitle(context),
      leading: Text(result.rssi.toString()),
      trailing: ElevatedButton(
        child: const Text('CONNECT'),
        // color: Colors.black,
        // textColor: Colors.white,
        onPressed: (result.advertisementData.connectable) ? onTap : null,
      ),
      children: <Widget>[
        _buildAdvRow(
            context, 'Complete Local Name', result.advertisementData.localName),
        _buildAdvRow(context, 'Tx Power Level',
            '${result.advertisementData.txPowerLevel ?? 'N/A'}'),
        _buildAdvRow(context, 'Manufacturer Data',
            getNiceManufacturerData(result.advertisementData.manufacturerData)),
        _buildAdvRow(
            context,
            'Service UUIDs',
            (result.advertisementData.serviceUuids.isNotEmpty)
                ? result.advertisementData.serviceUuids.join(', ').toUpperCase()
                : 'N/A'),
        _buildAdvRow(context, 'Service Data',
            getNiceServiceData(result.advertisementData.serviceData)),
      ],
    );
  }
}

class ServiceTile extends StatefulWidget {
  final BluetoothService service;
  final List<CharacteristicTile> characteristicTiles;

  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTiles})
      : super(key: key);

  @override
  State<ServiceTile> createState() => _ServiceTileState();
}

class _ServiceTileState extends State<ServiceTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.characteristicTiles.isNotEmpty) {
      return ExpansionTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Service'),
            Text(
                '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).textTheme.caption?.color))
          ],
        ),
        children: widget.characteristicTiles,
      );
    } else {
      return ListTile(
        title: const Text('Service'),
        subtitle: Text(
            '0x${widget.service.uuid.toString().toUpperCase().substring(4, 8)}'),
      );
    }
  }
}

class CharacteristicTile extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  final VoidCallback? onReadPressed;
  final VoidCallback? onWritePressed;
  final VoidCallback? onNotificationPressed;
  final BluetoothDevice device;
  const CharacteristicTile(
      {Key? key,
      required this.characteristic,
      this.onReadPressed,
      this.onWritePressed,
      this.onNotificationPressed,
      required this.device})
      : super(key: key);

  @override
  State<CharacteristicTile> createState() => _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile> {
  static const String characteristicUuidStep =
      "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  static const String characteristicUuidHeart =
      "c4833904-2076-4b3f-8351-92c5c980e6a7";
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: widget.characteristic.value,
      initialData: widget.characteristic.lastValue,
      builder: (c, snapshot) {
        // final value = snapshot.data;
        // widget.characteristic.uuid.toString() == characteristicUuidStep ?
        return ExpansionTile(
          title: ListTile(
            onTap: () {
              if (widget.characteristic.uuid.toString() ==
                  characteristicUuidStep) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StepCount(
                      device: widget.device,
                    ),
                  ),
                );
              } else if (widget.characteristic.uuid.toString() ==
                  characteristicUuidHeart) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HRate(
                      device: widget.device,
                    ),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Temperature(
                      device: widget.device,
                    ),
                  ),
                );
              }
            },
            title: widget.characteristic.uuid.toString() ==
                    characteristicUuidStep
                ? Text(
                    'Step Count',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                  )
                : widget.characteristic.uuid.toString() ==
                        characteristicUuidHeart
                    ? Text(
                        "Heart Rate",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                      )
                    : Text(
                        "Temperature",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall?.color,
                            ),
                      ),
            // subtitle: StreamBuilder(
            //   stream: widget.characteristic.read().asStream(),
            //   builder: (context, snapshot) {
            //     // print("Custom: ${String.fromCharCodes(snapshot.data ?? [])}");
            //     if (!snapshot.hasData) {
            //       return const Text("0");
            //     } else {
            //       return Text(String.fromCharCodes(snapshot.data!));
            //     }
            //     // return Text(String.fromCharCodes(snapshot.data!));
            //   }
            // ),
            contentPadding: const EdgeInsets.all(0.0),
          ),
          // trailing: Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     IconButton(
          //       icon: Icon(
          //         Icons.file_download,
          //         color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
          //       ),
          //       onPressed: widget.onReadPressed,
          //     ),
          //     IconButton(
          //       icon: Icon(Icons.file_upload,
          //           color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
          //       onPressed: widget.onWritePressed,
          //     ),
          //     IconButton(
          //       icon: Icon(
          //           widget.characteristic.isNotifying
          //               ? Icons.sync_disabled
          //               : Icons.sync,
          //           color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
          //       onPressed: widget.onNotificationPressed,
          //     )
          //   ],
          // ),
        );
      },
    );
  }
}

class AdapterStateTile extends StatelessWidget {
  const AdapterStateTile({Key? key, required this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: ListTile(
        title: Text(
          'Bluetooth adapter is ${state.toString().substring(15)}',
          style: Theme.of(context).primaryTextTheme.headlineMedium,
        ),
        trailing: Icon(
          Icons.error,
          color: Theme.of(context).primaryTextTheme.headlineMedium?.color,
        ),
      ),
    );
  }
}
