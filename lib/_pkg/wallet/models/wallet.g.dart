// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWalletCollection on Isar {
  IsarCollection<Wallet> get wallets => this.collection();
}

const WalletSchema = CollectionSchema(
  name: r'Wallet',
  id: 8666280453615945738,
  properties: {
    r'backupTested': PropertySchema(
      id: 0,
      name: r'backupTested',
      type: IsarType.bool,
    ),
    r'balance': PropertySchema(
      id: 1,
      name: r'balance',
      type: IsarType.long,
    ),
    r'bipPath': PropertySchema(
      id: 2,
      name: r'bipPath',
      type: IsarType.int,
      enumMap: _WalletbipPathEnumValueMap,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.string,
    ),
    r'importType': PropertySchema(
      id: 4,
      name: r'importType',
      type: IsarType.int,
      enumMap: _WalletimportTypeEnumValueMap,
    ),
    r'lastBackupTested': PropertySchema(
      id: 5,
      name: r'lastBackupTested',
      type: IsarType.dateTime,
    ),
    r'lastSync': PropertySchema(
      id: 6,
      name: r'lastSync',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'network': PropertySchema(
      id: 8,
      name: r'network',
      type: IsarType.byte,
      enumMap: _WalletnetworkEnumValueMap,
    ),
    r'seedFingerprint': PropertySchema(
      id: 9,
      name: r'seedFingerprint',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.byte,
      enumMap: _WallettypeEnumValueMap,
    )
  },
  estimateSize: _walletEstimateSize,
  serialize: _walletSerialize,
  deserialize: _walletDeserialize,
  deserializeProp: _walletDeserializeProp,
  idName: r'isarid',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'network': IndexSchema(
      id: -1588038472790472203,
      name: r'network',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'network',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _walletGetId,
  getLinks: _walletGetLinks,
  attach: _walletAttach,
  version: '3.1.0+1',
);

int _walletEstimateSize(
  Wallet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.seedFingerprint.length * 3;
  return bytesCount;
}

void _walletSerialize(
  Wallet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.backupTested);
  writer.writeLong(offsets[1], object.balance);
  writer.writeInt(offsets[2], object.bipPath?.index);
  writer.writeString(offsets[3], object.id);
  writer.writeInt(offsets[4], object.importType?.index);
  writer.writeDateTime(offsets[5], object.lastBackupTested);
  writer.writeDateTime(offsets[6], object.lastSync);
  writer.writeString(offsets[7], object.name);
  writer.writeByte(offsets[8], object.network.index);
  writer.writeString(offsets[9], object.seedFingerprint);
  writer.writeByte(offsets[10], object.type.index);
}

Wallet _walletDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Wallet();
  object.backupTested = reader.readBool(offsets[0]);
  object.balance = reader.readLong(offsets[1]);
  object.bipPath = _WalletbipPathValueEnumMap[reader.readIntOrNull(offsets[2])];
  object.id = reader.readString(offsets[3]);
  object.importType =
      _WalletimportTypeValueEnumMap[reader.readIntOrNull(offsets[4])];
  object.isarid = id;
  object.lastBackupTested = reader.readDateTimeOrNull(offsets[5]);
  object.lastSync = reader.readDateTimeOrNull(offsets[6]);
  object.name = reader.readString(offsets[7]);
  object.network =
      _WalletnetworkValueEnumMap[reader.readByteOrNull(offsets[8])] ??
          NetworkType.Mainnet;
  object.seedFingerprint = reader.readString(offsets[9]);
  object.type = _WallettypeValueEnumMap[reader.readByteOrNull(offsets[10])] ??
      WalletType.Bitcoin;
  return object;
}

P _walletDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (_WalletbipPathValueEnumMap[reader.readIntOrNull(offset)]) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (_WalletimportTypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_WalletnetworkValueEnumMap[reader.readByteOrNull(offset)] ??
          NetworkType.Mainnet) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (_WallettypeValueEnumMap[reader.readByteOrNull(offset)] ??
          WalletType.Bitcoin) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WalletbipPathEnumValueMap = {
  'bip86': 0,
  'bip84': 1,
  'bip49': 2,
  'bip44': 3,
};
const _WalletbipPathValueEnumMap = {
  0: BitcoinScriptType.bip86,
  1: BitcoinScriptType.bip84,
  2: BitcoinScriptType.bip49,
  3: BitcoinScriptType.bip44,
};
const _WalletimportTypeEnumValueMap = {
  'xpub': 0,
  'coldcard': 1,
  'descriptors': 2,
  'words12': 3,
  'words24': 4,
  'notSelected': 5,
};
const _WalletimportTypeValueEnumMap = {
  0: ImportTypes.xpub,
  1: ImportTypes.coldcard,
  2: ImportTypes.descriptors,
  3: ImportTypes.words12,
  4: ImportTypes.words24,
  5: ImportTypes.notSelected,
};
const _WalletnetworkEnumValueMap = {
  'Mainnet': 0,
  'Testnet': 1,
  'Signet': 2,
};
const _WalletnetworkValueEnumMap = {
  0: NetworkType.Mainnet,
  1: NetworkType.Testnet,
  2: NetworkType.Signet,
};
const _WallettypeEnumValueMap = {
  'Bitcoin': 0,
  'Liquid': 1,
  'Lightning': 2,
  'Usdt': 3,
};
const _WallettypeValueEnumMap = {
  0: WalletType.Bitcoin,
  1: WalletType.Liquid,
  2: WalletType.Lightning,
  3: WalletType.Usdt,
};

Id _walletGetId(Wallet object) {
  return object.isarid;
}

List<IsarLinkBase<dynamic>> _walletGetLinks(Wallet object) {
  return [];
}

void _walletAttach(IsarCollection<dynamic> col, Id id, Wallet object) {
  object.isarid = id;
}

extension WalletQueryWhereSort on QueryBuilder<Wallet, Wallet, QWhere> {
  QueryBuilder<Wallet, Wallet, QAfterWhere> anyIsarid() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhere> anyNetwork() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'network'),
      );
    });
  }
}

extension WalletQueryWhere on QueryBuilder<Wallet, Wallet, QWhereClause> {
  QueryBuilder<Wallet, Wallet, QAfterWhereClause> isaridEqualTo(Id isarid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarid,
        upper: isarid,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> isaridNotEqualTo(Id isarid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarid, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarid, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarid, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarid, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> isaridGreaterThan(Id isarid,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarid, includeLower: include),
      );
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> isaridLessThan(Id isarid,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarid, includeUpper: include),
      );
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> isaridBetween(
    Id lowerIsarid,
    Id upperIsarid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarid,
        includeLower: includeLower,
        upper: upperIsarid,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idNotEqualTo(String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> networkEqualTo(
      NetworkType network) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'network',
        value: [network],
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> networkNotEqualTo(
      NetworkType network) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'network',
              lower: [],
              upper: [network],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'network',
              lower: [network],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'network',
              lower: [network],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'network',
              lower: [],
              upper: [network],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> networkGreaterThan(
    NetworkType network, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'network',
        lower: [network],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> networkLessThan(
    NetworkType network, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'network',
        lower: [],
        upper: [network],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> networkBetween(
    NetworkType lowerNetwork,
    NetworkType upperNetwork, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'network',
        lower: [lowerNetwork],
        includeLower: includeLower,
        upper: [upperNetwork],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WalletQueryFilter on QueryBuilder<Wallet, Wallet, QFilterCondition> {
  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> backupTestedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backupTested',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> balanceEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balance',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> balanceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balance',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> balanceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balance',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> balanceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> bipPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bipPath',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> bipPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bipPath',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> bipPathEqualTo(
      BitcoinScriptType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bipPath',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> bipPathGreaterThan(
    BitcoinScriptType? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bipPath',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> bipPathLessThan(
    BitcoinScriptType? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bipPath',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> bipPathBetween(
    BitcoinScriptType? lower,
    BitcoinScriptType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bipPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> importTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'importType',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> importTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'importType',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> importTypeEqualTo(
      ImportTypes? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'importType',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> importTypeGreaterThan(
    ImportTypes? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'importType',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> importTypeLessThan(
    ImportTypes? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'importType',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> importTypeBetween(
    ImportTypes? lower,
    ImportTypes? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'importType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> isaridEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarid',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> isaridGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarid',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> isaridLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarid',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> isaridBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastBackupTestedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastBackupTested',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      lastBackupTestedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastBackupTested',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastBackupTestedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastBackupTested',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      lastBackupTestedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastBackupTested',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastBackupTestedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastBackupTested',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastBackupTestedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastBackupTested',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastSyncIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSync',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastSyncIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSync',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastSyncEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastSyncGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastSyncLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSync',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> lastSyncBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSync',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> networkEqualTo(
      NetworkType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'network',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> networkGreaterThan(
    NetworkType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'network',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> networkLessThan(
    NetworkType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'network',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> networkBetween(
    NetworkType lower,
    NetworkType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'network',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> seedFingerprintEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seedFingerprint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      seedFingerprintGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seedFingerprint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> seedFingerprintLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seedFingerprint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> seedFingerprintBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seedFingerprint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> seedFingerprintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'seedFingerprint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> seedFingerprintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'seedFingerprint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> seedFingerprintContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seedFingerprint',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> seedFingerprintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seedFingerprint',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> seedFingerprintIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seedFingerprint',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition>
      seedFingerprintIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seedFingerprint',
        value: '',
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> typeEqualTo(
      WalletType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> typeGreaterThan(
    WalletType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> typeLessThan(
    WalletType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> typeBetween(
    WalletType lower,
    WalletType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WalletQueryObject on QueryBuilder<Wallet, Wallet, QFilterCondition> {}

extension WalletQueryLinks on QueryBuilder<Wallet, Wallet, QFilterCondition> {}

extension WalletQuerySortBy on QueryBuilder<Wallet, Wallet, QSortBy> {
  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByBackupTested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupTested', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByBackupTestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupTested', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByBipPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bipPath', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByBipPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bipPath', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByImportType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importType', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByImportTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importType', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByLastBackupTested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastBackupTested', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByLastBackupTestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastBackupTested', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByLastSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByNetwork() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'network', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByNetworkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'network', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortBySeedFingerprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seedFingerprint', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortBySeedFingerprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seedFingerprint', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension WalletQuerySortThenBy on QueryBuilder<Wallet, Wallet, QSortThenBy> {
  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByBackupTested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupTested', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByBackupTestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'backupTested', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByBipPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bipPath', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByBipPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bipPath', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByImportType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importType', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByImportTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'importType', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByIsarid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarid', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByIsaridDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarid', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByLastBackupTested() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastBackupTested', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByLastBackupTestedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastBackupTested', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByLastSyncDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSync', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByNetwork() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'network', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByNetworkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'network', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenBySeedFingerprint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seedFingerprint', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenBySeedFingerprintDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seedFingerprint', Sort.desc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension WalletQueryWhereDistinct on QueryBuilder<Wallet, Wallet, QDistinct> {
  QueryBuilder<Wallet, Wallet, QDistinct> distinctByBackupTested() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backupTested');
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balance');
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByBipPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bipPath');
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByImportType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'importType');
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByLastBackupTested() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastBackupTested');
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByLastSync() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSync');
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByNetwork() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'network');
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctBySeedFingerprint(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seedFingerprint',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension WalletQueryProperty on QueryBuilder<Wallet, Wallet, QQueryProperty> {
  QueryBuilder<Wallet, int, QQueryOperations> isaridProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarid');
    });
  }

  QueryBuilder<Wallet, bool, QQueryOperations> backupTestedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backupTested');
    });
  }

  QueryBuilder<Wallet, int, QQueryOperations> balanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balance');
    });
  }

  QueryBuilder<Wallet, BitcoinScriptType?, QQueryOperations> bipPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bipPath');
    });
  }

  QueryBuilder<Wallet, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Wallet, ImportTypes?, QQueryOperations> importTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'importType');
    });
  }

  QueryBuilder<Wallet, DateTime?, QQueryOperations> lastBackupTestedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastBackupTested');
    });
  }

  QueryBuilder<Wallet, DateTime?, QQueryOperations> lastSyncProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSync');
    });
  }

  QueryBuilder<Wallet, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Wallet, NetworkType, QQueryOperations> networkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'network');
    });
  }

  QueryBuilder<Wallet, String, QQueryOperations> seedFingerprintProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seedFingerprint');
    });
  }

  QueryBuilder<Wallet, WalletType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
