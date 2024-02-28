import 'package:bdk_flutter/bdk_flutter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Exchange rate API', () {
    setUpAll(() async {});

    test('Wallet: Setup', () async {
      // final mnemonic = await Mnemonic.create(WordCount.Words12);
      // print(mnemonic);
      final mnemonic = await Mnemonic.fromString(
        'frost original crouch fringe inch abstract camera melody change film lyrics dust',
      );
      final descriptorSecretKey = await DescriptorSecretKey.create(
        network: Network.Testnet,
        mnemonic: mnemonic,
      );
      final externalDescriptor = await Descriptor.newBip84(
        secretKey: descriptorSecretKey,
        network: Network.Testnet,
        keychain: KeychainKind.External,
      );
      final internalDescriptor = await Descriptor.newBip84(
        secretKey: descriptorSecretKey,
        network: Network.Testnet,
        keychain: KeychainKind.Internal,
      );
      final blockchain = await Blockchain.create(
        config: const BlockchainConfig.electrum(
          config: ElectrumConfig(
            stopGap: 10,
            timeout: 5,
            retry: 5,
            url: 'ssl://electrum.blockstream.info:60002',
            validateDomain: false,
          ),
        ),
      );
      final wallet = await Wallet.create(
        descriptor: externalDescriptor,
        changeDescriptor: internalDescriptor,
        network: Network.Testnet,
        databaseConfig: const DatabaseConfig.memory(),
      );
      final _ = await wallet.sync(blockchain);

      // for (int i = 0; i < 10; i++) {
      //   final AddressInfo addressInfo =
      //       await wallet.getAddress(addressIndex: AddressIndex.peek(index: i));
      //   print('addressInfo');
      //   print(addressInfo.address);
      //   print(addressInfo.index);
      // }
      /*
      final AddressInfo addressInfo =
          await wallet.getAddress(addressIndex: const AddressIndex.peek(index: 0));

      print('addressInfo');
      print(addressInfo.address);
      print(addressInfo.index);

      final AddressInfo addressInfo2 =
          await wallet.getAddress(addressIndex: const AddressIndex.peek(index: 1));

      print('addressInfo2');
      print(addressInfo2.address);
      print(addressInfo2.index);

      final AddressInfo addressInfo3 =
          await wallet.getAddress(addressIndex: const AddressIndex.peek(index: 2));

      print('addressInfo3');
      print(addressInfo3.address);
      print(addressInfo3.index);

      final AddressInfo addressInfo4 =
          await wallet.getAddress(addressIndex: const AddressIndex.peek(index: 3));

      print('addressInfo4');
      print(addressInfo4.address);
      print(addressInfo4.index);

      final AddressInfo addressInfo5 =
          await wallet.getAddress(addressIndex: const AddressIndex.peek(index: 4));

      print('addressInfo5');
      print(addressInfo5.address);
      print(addressInfo5.index);
      */

      final balance = await wallet.getBalance();
      print('balance: ${balance.total}');

      final txs = await wallet.listTransactions(false);
      for (final tx in txs) {
        print('tx: ${tx.txid} ${tx.received - tx.sent}');
      }

      final AddressInfo internalAddress1 =
          await wallet.getInternalAddress(addressIndex: const AddressIndex.peek(index: 0));
      print('internalAddress1: ${internalAddress1.address}');

      final AddressInfo internalAddress2 =
          await wallet.getInternalAddress(addressIndex: const AddressIndex.peek(index: 1));
      print('internalAddress2: ${internalAddress2.address}');

      final AddressInfo internalAddress3 =
          await wallet.getInternalAddress(addressIndex: const AddressIndex.peek(index: 2));
      print('internalAddress3: ${internalAddress3.address}');

      final AddressInfo internalAddress4 =
          await wallet.getInternalAddress(addressIndex: const AddressIndex.peek(index: 3));
      print('internalAddress4: ${internalAddress4.address}');

      final AddressInfo internalAddress5 =
          await wallet.getInternalAddress(addressIndex: const AddressIndex.peek(index: 4));
      print('internalAddress5: ${internalAddress5.address}');

      final txBuilder = TxBuilder();
      final address = await Address.create(address: 'tb1qx6rj6359rdm3hcmwv38spxvqpx87x0ufm77t8u');
      final script = await address.scriptPubKey();

      final txBuilderResult = await txBuilder.feeRate(2).addRecipient(script, 1000).finish(wallet);
      final psbtStruct = PartiallySignedTransaction(psbtBase64: txBuilderResult.psbt.psbtBase64);

      final finalized = await wallet.sign(
        psbt: psbtStruct,
        signOptions: const SignOptions(
          isMultiSig: false,
          trustWitnessUtxo: false,
          allowAllSighashes: false,
          removePartialSigs: true,
          tryFinalize: true,
          signWithTapInternalKey: false,
          allowGrinding: true,
        ),
      );
      final extracted = await finalized.extractTx();

      final tx = await finalized.extractTx();

      await blockchain.broadcast(tx);
      final txid = await finalized.txId();
      print('txid');
    });
  });
}
