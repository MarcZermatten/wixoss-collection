// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CardsTable extends Cards with TableInfo<$CardsTable, Card> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _setCodeMeta =
      const VerificationMeta('setCode');
  @override
  late final GeneratedColumn<String> setCode = GeneratedColumn<String>(
      'set_code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cardTypeMeta =
      const VerificationMeta('cardType');
  @override
  late final GeneratedColumn<String> cardType = GeneratedColumn<String>(
      'card_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _powerMeta = const VerificationMeta('power');
  @override
  late final GeneratedColumn<int> power = GeneratedColumn<int>(
      'power', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<String> cost = GeneratedColumn<String>(
      'cost', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _costTotalMeta =
      const VerificationMeta('costTotal');
  @override
  late final GeneratedColumn<int> costTotal = GeneratedColumn<int>(
      'cost_total', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _cardLimitMeta =
      const VerificationMeta('cardLimit');
  @override
  late final GeneratedColumn<int> cardLimit = GeneratedColumn<int>(
      'card_limit', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lrigTypeMeta =
      const VerificationMeta('lrigType');
  @override
  late final GeneratedColumn<String> lrigType = GeneratedColumn<String>(
      'lrig_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _classTypeMeta =
      const VerificationMeta('classType');
  @override
  late final GeneratedColumn<String> classType = GeneratedColumn<String>(
      'class_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hasLifeBurstMeta =
      const VerificationMeta('hasLifeBurst');
  @override
  late final GeneratedColumn<bool> hasLifeBurst = GeneratedColumn<bool>(
      'has_life_burst', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_life_burst" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _effectTextMeta =
      const VerificationMeta('effectText');
  @override
  late final GeneratedColumn<String> effectText = GeneratedColumn<String>(
      'effect_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lifeBurstTextMeta =
      const VerificationMeta('lifeBurstText');
  @override
  late final GeneratedColumn<String> lifeBurstText = GeneratedColumn<String>(
      'life_burst_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rarityMeta = const VerificationMeta('rarity');
  @override
  late final GeneratedColumn<String> rarity = GeneratedColumn<String>(
      'rarity', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _formatAllstarMeta =
      const VerificationMeta('formatAllstar');
  @override
  late final GeneratedColumn<bool> formatAllstar = GeneratedColumn<bool>(
      'format_allstar', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("format_allstar" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _formatKeyMeta =
      const VerificationMeta('formatKey');
  @override
  late final GeneratedColumn<bool> formatKey = GeneratedColumn<bool>(
      'format_key', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("format_key" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        setCode,
        cardType,
        color,
        level,
        power,
        cost,
        costTotal,
        cardLimit,
        lrigType,
        classType,
        hasLifeBurst,
        effectText,
        lifeBurstText,
        imageUrl,
        rarity,
        formatAllstar,
        formatKey
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<Card> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('set_code')) {
      context.handle(_setCodeMeta,
          setCode.isAcceptableOrUnknown(data['set_code']!, _setCodeMeta));
    } else if (isInserting) {
      context.missing(_setCodeMeta);
    }
    if (data.containsKey('card_type')) {
      context.handle(_cardTypeMeta,
          cardType.isAcceptableOrUnknown(data['card_type']!, _cardTypeMeta));
    } else if (isInserting) {
      context.missing(_cardTypeMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    }
    if (data.containsKey('power')) {
      context.handle(
          _powerMeta, power.isAcceptableOrUnknown(data['power']!, _powerMeta));
    }
    if (data.containsKey('cost')) {
      context.handle(
          _costMeta, cost.isAcceptableOrUnknown(data['cost']!, _costMeta));
    }
    if (data.containsKey('cost_total')) {
      context.handle(_costTotalMeta,
          costTotal.isAcceptableOrUnknown(data['cost_total']!, _costTotalMeta));
    }
    if (data.containsKey('card_limit')) {
      context.handle(_cardLimitMeta,
          cardLimit.isAcceptableOrUnknown(data['card_limit']!, _cardLimitMeta));
    }
    if (data.containsKey('lrig_type')) {
      context.handle(_lrigTypeMeta,
          lrigType.isAcceptableOrUnknown(data['lrig_type']!, _lrigTypeMeta));
    }
    if (data.containsKey('class_type')) {
      context.handle(_classTypeMeta,
          classType.isAcceptableOrUnknown(data['class_type']!, _classTypeMeta));
    }
    if (data.containsKey('has_life_burst')) {
      context.handle(
          _hasLifeBurstMeta,
          hasLifeBurst.isAcceptableOrUnknown(
              data['has_life_burst']!, _hasLifeBurstMeta));
    }
    if (data.containsKey('effect_text')) {
      context.handle(
          _effectTextMeta,
          effectText.isAcceptableOrUnknown(
              data['effect_text']!, _effectTextMeta));
    }
    if (data.containsKey('life_burst_text')) {
      context.handle(
          _lifeBurstTextMeta,
          lifeBurstText.isAcceptableOrUnknown(
              data['life_burst_text']!, _lifeBurstTextMeta));
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('rarity')) {
      context.handle(_rarityMeta,
          rarity.isAcceptableOrUnknown(data['rarity']!, _rarityMeta));
    }
    if (data.containsKey('format_allstar')) {
      context.handle(
          _formatAllstarMeta,
          formatAllstar.isAcceptableOrUnknown(
              data['format_allstar']!, _formatAllstarMeta));
    }
    if (data.containsKey('format_key')) {
      context.handle(_formatKeyMeta,
          formatKey.isAcceptableOrUnknown(data['format_key']!, _formatKeyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Card map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Card(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      setCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}set_code'])!,
      cardType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_type'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level']),
      power: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}power']),
      cost: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cost']),
      costTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost_total']),
      cardLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_limit']),
      lrigType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lrig_type']),
      classType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}class_type']),
      hasLifeBurst: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_life_burst'])!,
      effectText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}effect_text']),
      lifeBurstText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}life_burst_text']),
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      rarity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}rarity']),
      formatAllstar: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}format_allstar'])!,
      formatKey: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}format_key'])!,
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class Card extends DataClass implements Insertable<Card> {
  final String id;
  final String name;
  final String setCode;
  final String cardType;
  final String color;
  final int? level;
  final int? power;
  final String? cost;
  final int? costTotal;
  final int? cardLimit;
  final String? lrigType;
  final String? classType;
  final bool hasLifeBurst;
  final String? effectText;
  final String? lifeBurstText;
  final String? imageUrl;
  final String? rarity;
  final bool formatAllstar;
  final bool formatKey;
  const Card(
      {required this.id,
      required this.name,
      required this.setCode,
      required this.cardType,
      required this.color,
      this.level,
      this.power,
      this.cost,
      this.costTotal,
      this.cardLimit,
      this.lrigType,
      this.classType,
      required this.hasLifeBurst,
      this.effectText,
      this.lifeBurstText,
      this.imageUrl,
      this.rarity,
      required this.formatAllstar,
      required this.formatKey});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['set_code'] = Variable<String>(setCode);
    map['card_type'] = Variable<String>(cardType);
    map['color'] = Variable<String>(color);
    if (!nullToAbsent || level != null) {
      map['level'] = Variable<int>(level);
    }
    if (!nullToAbsent || power != null) {
      map['power'] = Variable<int>(power);
    }
    if (!nullToAbsent || cost != null) {
      map['cost'] = Variable<String>(cost);
    }
    if (!nullToAbsent || costTotal != null) {
      map['cost_total'] = Variable<int>(costTotal);
    }
    if (!nullToAbsent || cardLimit != null) {
      map['card_limit'] = Variable<int>(cardLimit);
    }
    if (!nullToAbsent || lrigType != null) {
      map['lrig_type'] = Variable<String>(lrigType);
    }
    if (!nullToAbsent || classType != null) {
      map['class_type'] = Variable<String>(classType);
    }
    map['has_life_burst'] = Variable<bool>(hasLifeBurst);
    if (!nullToAbsent || effectText != null) {
      map['effect_text'] = Variable<String>(effectText);
    }
    if (!nullToAbsent || lifeBurstText != null) {
      map['life_burst_text'] = Variable<String>(lifeBurstText);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || rarity != null) {
      map['rarity'] = Variable<String>(rarity);
    }
    map['format_allstar'] = Variable<bool>(formatAllstar);
    map['format_key'] = Variable<bool>(formatKey);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      name: Value(name),
      setCode: Value(setCode),
      cardType: Value(cardType),
      color: Value(color),
      level:
          level == null && nullToAbsent ? const Value.absent() : Value(level),
      power:
          power == null && nullToAbsent ? const Value.absent() : Value(power),
      cost: cost == null && nullToAbsent ? const Value.absent() : Value(cost),
      costTotal: costTotal == null && nullToAbsent
          ? const Value.absent()
          : Value(costTotal),
      cardLimit: cardLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(cardLimit),
      lrigType: lrigType == null && nullToAbsent
          ? const Value.absent()
          : Value(lrigType),
      classType: classType == null && nullToAbsent
          ? const Value.absent()
          : Value(classType),
      hasLifeBurst: Value(hasLifeBurst),
      effectText: effectText == null && nullToAbsent
          ? const Value.absent()
          : Value(effectText),
      lifeBurstText: lifeBurstText == null && nullToAbsent
          ? const Value.absent()
          : Value(lifeBurstText),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      rarity:
          rarity == null && nullToAbsent ? const Value.absent() : Value(rarity),
      formatAllstar: Value(formatAllstar),
      formatKey: Value(formatKey),
    );
  }

  factory Card.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Card(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      setCode: serializer.fromJson<String>(json['setCode']),
      cardType: serializer.fromJson<String>(json['cardType']),
      color: serializer.fromJson<String>(json['color']),
      level: serializer.fromJson<int?>(json['level']),
      power: serializer.fromJson<int?>(json['power']),
      cost: serializer.fromJson<String?>(json['cost']),
      costTotal: serializer.fromJson<int?>(json['costTotal']),
      cardLimit: serializer.fromJson<int?>(json['cardLimit']),
      lrigType: serializer.fromJson<String?>(json['lrigType']),
      classType: serializer.fromJson<String?>(json['classType']),
      hasLifeBurst: serializer.fromJson<bool>(json['hasLifeBurst']),
      effectText: serializer.fromJson<String?>(json['effectText']),
      lifeBurstText: serializer.fromJson<String?>(json['lifeBurstText']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      rarity: serializer.fromJson<String?>(json['rarity']),
      formatAllstar: serializer.fromJson<bool>(json['formatAllstar']),
      formatKey: serializer.fromJson<bool>(json['formatKey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'setCode': serializer.toJson<String>(setCode),
      'cardType': serializer.toJson<String>(cardType),
      'color': serializer.toJson<String>(color),
      'level': serializer.toJson<int?>(level),
      'power': serializer.toJson<int?>(power),
      'cost': serializer.toJson<String?>(cost),
      'costTotal': serializer.toJson<int?>(costTotal),
      'cardLimit': serializer.toJson<int?>(cardLimit),
      'lrigType': serializer.toJson<String?>(lrigType),
      'classType': serializer.toJson<String?>(classType),
      'hasLifeBurst': serializer.toJson<bool>(hasLifeBurst),
      'effectText': serializer.toJson<String?>(effectText),
      'lifeBurstText': serializer.toJson<String?>(lifeBurstText),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'rarity': serializer.toJson<String?>(rarity),
      'formatAllstar': serializer.toJson<bool>(formatAllstar),
      'formatKey': serializer.toJson<bool>(formatKey),
    };
  }

  Card copyWith(
          {String? id,
          String? name,
          String? setCode,
          String? cardType,
          String? color,
          Value<int?> level = const Value.absent(),
          Value<int?> power = const Value.absent(),
          Value<String?> cost = const Value.absent(),
          Value<int?> costTotal = const Value.absent(),
          Value<int?> cardLimit = const Value.absent(),
          Value<String?> lrigType = const Value.absent(),
          Value<String?> classType = const Value.absent(),
          bool? hasLifeBurst,
          Value<String?> effectText = const Value.absent(),
          Value<String?> lifeBurstText = const Value.absent(),
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> rarity = const Value.absent(),
          bool? formatAllstar,
          bool? formatKey}) =>
      Card(
        id: id ?? this.id,
        name: name ?? this.name,
        setCode: setCode ?? this.setCode,
        cardType: cardType ?? this.cardType,
        color: color ?? this.color,
        level: level.present ? level.value : this.level,
        power: power.present ? power.value : this.power,
        cost: cost.present ? cost.value : this.cost,
        costTotal: costTotal.present ? costTotal.value : this.costTotal,
        cardLimit: cardLimit.present ? cardLimit.value : this.cardLimit,
        lrigType: lrigType.present ? lrigType.value : this.lrigType,
        classType: classType.present ? classType.value : this.classType,
        hasLifeBurst: hasLifeBurst ?? this.hasLifeBurst,
        effectText: effectText.present ? effectText.value : this.effectText,
        lifeBurstText:
            lifeBurstText.present ? lifeBurstText.value : this.lifeBurstText,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        rarity: rarity.present ? rarity.value : this.rarity,
        formatAllstar: formatAllstar ?? this.formatAllstar,
        formatKey: formatKey ?? this.formatKey,
      );
  Card copyWithCompanion(CardsCompanion data) {
    return Card(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      setCode: data.setCode.present ? data.setCode.value : this.setCode,
      cardType: data.cardType.present ? data.cardType.value : this.cardType,
      color: data.color.present ? data.color.value : this.color,
      level: data.level.present ? data.level.value : this.level,
      power: data.power.present ? data.power.value : this.power,
      cost: data.cost.present ? data.cost.value : this.cost,
      costTotal: data.costTotal.present ? data.costTotal.value : this.costTotal,
      cardLimit: data.cardLimit.present ? data.cardLimit.value : this.cardLimit,
      lrigType: data.lrigType.present ? data.lrigType.value : this.lrigType,
      classType: data.classType.present ? data.classType.value : this.classType,
      hasLifeBurst: data.hasLifeBurst.present
          ? data.hasLifeBurst.value
          : this.hasLifeBurst,
      effectText:
          data.effectText.present ? data.effectText.value : this.effectText,
      lifeBurstText: data.lifeBurstText.present
          ? data.lifeBurstText.value
          : this.lifeBurstText,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      rarity: data.rarity.present ? data.rarity.value : this.rarity,
      formatAllstar: data.formatAllstar.present
          ? data.formatAllstar.value
          : this.formatAllstar,
      formatKey: data.formatKey.present ? data.formatKey.value : this.formatKey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('setCode: $setCode, ')
          ..write('cardType: $cardType, ')
          ..write('color: $color, ')
          ..write('level: $level, ')
          ..write('power: $power, ')
          ..write('cost: $cost, ')
          ..write('costTotal: $costTotal, ')
          ..write('cardLimit: $cardLimit, ')
          ..write('lrigType: $lrigType, ')
          ..write('classType: $classType, ')
          ..write('hasLifeBurst: $hasLifeBurst, ')
          ..write('effectText: $effectText, ')
          ..write('lifeBurstText: $lifeBurstText, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rarity: $rarity, ')
          ..write('formatAllstar: $formatAllstar, ')
          ..write('formatKey: $formatKey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      setCode,
      cardType,
      color,
      level,
      power,
      cost,
      costTotal,
      cardLimit,
      lrigType,
      classType,
      hasLifeBurst,
      effectText,
      lifeBurstText,
      imageUrl,
      rarity,
      formatAllstar,
      formatKey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.id == this.id &&
          other.name == this.name &&
          other.setCode == this.setCode &&
          other.cardType == this.cardType &&
          other.color == this.color &&
          other.level == this.level &&
          other.power == this.power &&
          other.cost == this.cost &&
          other.costTotal == this.costTotal &&
          other.cardLimit == this.cardLimit &&
          other.lrigType == this.lrigType &&
          other.classType == this.classType &&
          other.hasLifeBurst == this.hasLifeBurst &&
          other.effectText == this.effectText &&
          other.lifeBurstText == this.lifeBurstText &&
          other.imageUrl == this.imageUrl &&
          other.rarity == this.rarity &&
          other.formatAllstar == this.formatAllstar &&
          other.formatKey == this.formatKey);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> setCode;
  final Value<String> cardType;
  final Value<String> color;
  final Value<int?> level;
  final Value<int?> power;
  final Value<String?> cost;
  final Value<int?> costTotal;
  final Value<int?> cardLimit;
  final Value<String?> lrigType;
  final Value<String?> classType;
  final Value<bool> hasLifeBurst;
  final Value<String?> effectText;
  final Value<String?> lifeBurstText;
  final Value<String?> imageUrl;
  final Value<String?> rarity;
  final Value<bool> formatAllstar;
  final Value<bool> formatKey;
  final Value<int> rowid;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.setCode = const Value.absent(),
    this.cardType = const Value.absent(),
    this.color = const Value.absent(),
    this.level = const Value.absent(),
    this.power = const Value.absent(),
    this.cost = const Value.absent(),
    this.costTotal = const Value.absent(),
    this.cardLimit = const Value.absent(),
    this.lrigType = const Value.absent(),
    this.classType = const Value.absent(),
    this.hasLifeBurst = const Value.absent(),
    this.effectText = const Value.absent(),
    this.lifeBurstText = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rarity = const Value.absent(),
    this.formatAllstar = const Value.absent(),
    this.formatKey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardsCompanion.insert({
    required String id,
    required String name,
    required String setCode,
    required String cardType,
    required String color,
    this.level = const Value.absent(),
    this.power = const Value.absent(),
    this.cost = const Value.absent(),
    this.costTotal = const Value.absent(),
    this.cardLimit = const Value.absent(),
    this.lrigType = const Value.absent(),
    this.classType = const Value.absent(),
    this.hasLifeBurst = const Value.absent(),
    this.effectText = const Value.absent(),
    this.lifeBurstText = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rarity = const Value.absent(),
    this.formatAllstar = const Value.absent(),
    this.formatKey = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        setCode = Value(setCode),
        cardType = Value(cardType),
        color = Value(color);
  static Insertable<Card> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? setCode,
    Expression<String>? cardType,
    Expression<String>? color,
    Expression<int>? level,
    Expression<int>? power,
    Expression<String>? cost,
    Expression<int>? costTotal,
    Expression<int>? cardLimit,
    Expression<String>? lrigType,
    Expression<String>? classType,
    Expression<bool>? hasLifeBurst,
    Expression<String>? effectText,
    Expression<String>? lifeBurstText,
    Expression<String>? imageUrl,
    Expression<String>? rarity,
    Expression<bool>? formatAllstar,
    Expression<bool>? formatKey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (setCode != null) 'set_code': setCode,
      if (cardType != null) 'card_type': cardType,
      if (color != null) 'color': color,
      if (level != null) 'level': level,
      if (power != null) 'power': power,
      if (cost != null) 'cost': cost,
      if (costTotal != null) 'cost_total': costTotal,
      if (cardLimit != null) 'card_limit': cardLimit,
      if (lrigType != null) 'lrig_type': lrigType,
      if (classType != null) 'class_type': classType,
      if (hasLifeBurst != null) 'has_life_burst': hasLifeBurst,
      if (effectText != null) 'effect_text': effectText,
      if (lifeBurstText != null) 'life_burst_text': lifeBurstText,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rarity != null) 'rarity': rarity,
      if (formatAllstar != null) 'format_allstar': formatAllstar,
      if (formatKey != null) 'format_key': formatKey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? setCode,
      Value<String>? cardType,
      Value<String>? color,
      Value<int?>? level,
      Value<int?>? power,
      Value<String?>? cost,
      Value<int?>? costTotal,
      Value<int?>? cardLimit,
      Value<String?>? lrigType,
      Value<String?>? classType,
      Value<bool>? hasLifeBurst,
      Value<String?>? effectText,
      Value<String?>? lifeBurstText,
      Value<String?>? imageUrl,
      Value<String?>? rarity,
      Value<bool>? formatAllstar,
      Value<bool>? formatKey,
      Value<int>? rowid}) {
    return CardsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      setCode: setCode ?? this.setCode,
      cardType: cardType ?? this.cardType,
      color: color ?? this.color,
      level: level ?? this.level,
      power: power ?? this.power,
      cost: cost ?? this.cost,
      costTotal: costTotal ?? this.costTotal,
      cardLimit: cardLimit ?? this.cardLimit,
      lrigType: lrigType ?? this.lrigType,
      classType: classType ?? this.classType,
      hasLifeBurst: hasLifeBurst ?? this.hasLifeBurst,
      effectText: effectText ?? this.effectText,
      lifeBurstText: lifeBurstText ?? this.lifeBurstText,
      imageUrl: imageUrl ?? this.imageUrl,
      rarity: rarity ?? this.rarity,
      formatAllstar: formatAllstar ?? this.formatAllstar,
      formatKey: formatKey ?? this.formatKey,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (setCode.present) {
      map['set_code'] = Variable<String>(setCode.value);
    }
    if (cardType.present) {
      map['card_type'] = Variable<String>(cardType.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (power.present) {
      map['power'] = Variable<int>(power.value);
    }
    if (cost.present) {
      map['cost'] = Variable<String>(cost.value);
    }
    if (costTotal.present) {
      map['cost_total'] = Variable<int>(costTotal.value);
    }
    if (cardLimit.present) {
      map['card_limit'] = Variable<int>(cardLimit.value);
    }
    if (lrigType.present) {
      map['lrig_type'] = Variable<String>(lrigType.value);
    }
    if (classType.present) {
      map['class_type'] = Variable<String>(classType.value);
    }
    if (hasLifeBurst.present) {
      map['has_life_burst'] = Variable<bool>(hasLifeBurst.value);
    }
    if (effectText.present) {
      map['effect_text'] = Variable<String>(effectText.value);
    }
    if (lifeBurstText.present) {
      map['life_burst_text'] = Variable<String>(lifeBurstText.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rarity.present) {
      map['rarity'] = Variable<String>(rarity.value);
    }
    if (formatAllstar.present) {
      map['format_allstar'] = Variable<bool>(formatAllstar.value);
    }
    if (formatKey.present) {
      map['format_key'] = Variable<bool>(formatKey.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('setCode: $setCode, ')
          ..write('cardType: $cardType, ')
          ..write('color: $color, ')
          ..write('level: $level, ')
          ..write('power: $power, ')
          ..write('cost: $cost, ')
          ..write('costTotal: $costTotal, ')
          ..write('cardLimit: $cardLimit, ')
          ..write('lrigType: $lrigType, ')
          ..write('classType: $classType, ')
          ..write('hasLifeBurst: $hasLifeBurst, ')
          ..write('effectText: $effectText, ')
          ..write('lifeBurstText: $lifeBurstText, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rarity: $rarity, ')
          ..write('formatAllstar: $formatAllstar, ')
          ..write('formatKey: $formatKey, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CardSetsTable extends CardSets with TableInfo<$CardSetsTable, CardSet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardSetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _setTypeMeta =
      const VerificationMeta('setType');
  @override
  late final GeneratedColumn<String> setType = GeneratedColumn<String>(
      'set_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalCardsMeta =
      const VerificationMeta('totalCards');
  @override
  late final GeneratedColumn<int> totalCards = GeneratedColumn<int>(
      'total_cards', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [code, name, setType, releaseDate, totalCards];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'card_sets';
  @override
  VerificationContext validateIntegrity(Insertable<CardSet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('set_type')) {
      context.handle(_setTypeMeta,
          setType.isAcceptableOrUnknown(data['set_type']!, _setTypeMeta));
    } else if (isInserting) {
      context.missing(_setTypeMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    }
    if (data.containsKey('total_cards')) {
      context.handle(
          _totalCardsMeta,
          totalCards.isAcceptableOrUnknown(
              data['total_cards']!, _totalCardsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  CardSet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardSet(
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      setType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}set_type'])!,
      releaseDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}release_date']),
      totalCards: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_cards'])!,
    );
  }

  @override
  $CardSetsTable createAlias(String alias) {
    return $CardSetsTable(attachedDatabase, alias);
  }
}

class CardSet extends DataClass implements Insertable<CardSet> {
  final String code;
  final String name;
  final String setType;
  final String? releaseDate;
  final int totalCards;
  const CardSet(
      {required this.code,
      required this.name,
      required this.setType,
      this.releaseDate,
      required this.totalCards});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['set_type'] = Variable<String>(setType);
    if (!nullToAbsent || releaseDate != null) {
      map['release_date'] = Variable<String>(releaseDate);
    }
    map['total_cards'] = Variable<int>(totalCards);
    return map;
  }

  CardSetsCompanion toCompanion(bool nullToAbsent) {
    return CardSetsCompanion(
      code: Value(code),
      name: Value(name),
      setType: Value(setType),
      releaseDate: releaseDate == null && nullToAbsent
          ? const Value.absent()
          : Value(releaseDate),
      totalCards: Value(totalCards),
    );
  }

  factory CardSet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardSet(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      setType: serializer.fromJson<String>(json['setType']),
      releaseDate: serializer.fromJson<String?>(json['releaseDate']),
      totalCards: serializer.fromJson<int>(json['totalCards']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'setType': serializer.toJson<String>(setType),
      'releaseDate': serializer.toJson<String?>(releaseDate),
      'totalCards': serializer.toJson<int>(totalCards),
    };
  }

  CardSet copyWith(
          {String? code,
          String? name,
          String? setType,
          Value<String?> releaseDate = const Value.absent(),
          int? totalCards}) =>
      CardSet(
        code: code ?? this.code,
        name: name ?? this.name,
        setType: setType ?? this.setType,
        releaseDate: releaseDate.present ? releaseDate.value : this.releaseDate,
        totalCards: totalCards ?? this.totalCards,
      );
  CardSet copyWithCompanion(CardSetsCompanion data) {
    return CardSet(
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      setType: data.setType.present ? data.setType.value : this.setType,
      releaseDate:
          data.releaseDate.present ? data.releaseDate.value : this.releaseDate,
      totalCards:
          data.totalCards.present ? data.totalCards.value : this.totalCards,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CardSet(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('setType: $setType, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('totalCards: $totalCards')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, name, setType, releaseDate, totalCards);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardSet &&
          other.code == this.code &&
          other.name == this.name &&
          other.setType == this.setType &&
          other.releaseDate == this.releaseDate &&
          other.totalCards == this.totalCards);
}

class CardSetsCompanion extends UpdateCompanion<CardSet> {
  final Value<String> code;
  final Value<String> name;
  final Value<String> setType;
  final Value<String?> releaseDate;
  final Value<int> totalCards;
  final Value<int> rowid;
  const CardSetsCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.setType = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.totalCards = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardSetsCompanion.insert({
    required String code,
    required String name,
    required String setType,
    this.releaseDate = const Value.absent(),
    this.totalCards = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : code = Value(code),
        name = Value(name),
        setType = Value(setType);
  static Insertable<CardSet> custom({
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? setType,
    Expression<String>? releaseDate,
    Expression<int>? totalCards,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (setType != null) 'set_type': setType,
      if (releaseDate != null) 'release_date': releaseDate,
      if (totalCards != null) 'total_cards': totalCards,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardSetsCompanion copyWith(
      {Value<String>? code,
      Value<String>? name,
      Value<String>? setType,
      Value<String?>? releaseDate,
      Value<int>? totalCards,
      Value<int>? rowid}) {
    return CardSetsCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
      setType: setType ?? this.setType,
      releaseDate: releaseDate ?? this.releaseDate,
      totalCards: totalCards ?? this.totalCards,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (setType.present) {
      map['set_type'] = Variable<String>(setType.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (totalCards.present) {
      map['total_cards'] = Variable<int>(totalCards.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardSetsCompanion(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('setType: $setType, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('totalCards: $totalCards, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CollectionEntriesTable extends CollectionEntries
    with TableInfo<$CollectionEntriesTable, CollectionEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
      'card_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES cards (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [cardId, quantity, addedAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_entries';
  @override
  VerificationContext validateIntegrity(Insertable<CollectionEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cardId};
  @override
  CollectionEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionEntry(
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CollectionEntriesTable createAlias(String alias) {
    return $CollectionEntriesTable(attachedDatabase, alias);
  }
}

class CollectionEntry extends DataClass implements Insertable<CollectionEntry> {
  final String cardId;
  final int quantity;
  final DateTime addedAt;
  final DateTime updatedAt;
  const CollectionEntry(
      {required this.cardId,
      required this.quantity,
      required this.addedAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<String>(cardId);
    map['quantity'] = Variable<int>(quantity);
    map['added_at'] = Variable<DateTime>(addedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CollectionEntriesCompanion toCompanion(bool nullToAbsent) {
    return CollectionEntriesCompanion(
      cardId: Value(cardId),
      quantity: Value(quantity),
      addedAt: Value(addedAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory CollectionEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionEntry(
      cardId: serializer.fromJson<String>(json['cardId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<String>(cardId),
      'quantity': serializer.toJson<int>(quantity),
      'addedAt': serializer.toJson<DateTime>(addedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  CollectionEntry copyWith(
          {String? cardId,
          int? quantity,
          DateTime? addedAt,
          DateTime? updatedAt}) =>
      CollectionEntry(
        cardId: cardId ?? this.cardId,
        quantity: quantity ?? this.quantity,
        addedAt: addedAt ?? this.addedAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  CollectionEntry copyWithCompanion(CollectionEntriesCompanion data) {
    return CollectionEntry(
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionEntry(')
          ..write('cardId: $cardId, ')
          ..write('quantity: $quantity, ')
          ..write('addedAt: $addedAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cardId, quantity, addedAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionEntry &&
          other.cardId == this.cardId &&
          other.quantity == this.quantity &&
          other.addedAt == this.addedAt &&
          other.updatedAt == this.updatedAt);
}

class CollectionEntriesCompanion extends UpdateCompanion<CollectionEntry> {
  final Value<String> cardId;
  final Value<int> quantity;
  final Value<DateTime> addedAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const CollectionEntriesCompanion({
    this.cardId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CollectionEntriesCompanion.insert({
    required String cardId,
    this.quantity = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cardId = Value(cardId);
  static Insertable<CollectionEntry> custom({
    Expression<String>? cardId,
    Expression<int>? quantity,
    Expression<DateTime>? addedAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (quantity != null) 'quantity': quantity,
      if (addedAt != null) 'added_at': addedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CollectionEntriesCompanion copyWith(
      {Value<String>? cardId,
      Value<int>? quantity,
      Value<DateTime>? addedAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return CollectionEntriesCompanion(
      cardId: cardId ?? this.cardId,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionEntriesCompanion(')
          ..write('cardId: $cardId, ')
          ..write('quantity: $quantity, ')
          ..write('addedAt: $addedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WishlistEntriesTable extends WishlistEntries
    with TableInfo<$WishlistEntriesTable, WishlistEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WishlistEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<String> cardId = GeneratedColumn<String>(
      'card_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES cards (id)'));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addedAtMeta =
      const VerificationMeta('addedAt');
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
      'added_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [cardId, priority, notes, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wishlist_entries';
  @override
  VerificationContext validateIntegrity(Insertable<WishlistEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('added_at')) {
      context.handle(_addedAtMeta,
          addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {cardId};
  @override
  WishlistEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WishlistEntry(
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_id'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      addedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}added_at'])!,
    );
  }

  @override
  $WishlistEntriesTable createAlias(String alias) {
    return $WishlistEntriesTable(attachedDatabase, alias);
  }
}

class WishlistEntry extends DataClass implements Insertable<WishlistEntry> {
  final String cardId;
  final int priority;
  final String? notes;
  final DateTime addedAt;
  const WishlistEntry(
      {required this.cardId,
      required this.priority,
      this.notes,
      required this.addedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['card_id'] = Variable<String>(cardId);
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  WishlistEntriesCompanion toCompanion(bool nullToAbsent) {
    return WishlistEntriesCompanion(
      cardId: Value(cardId),
      priority: Value(priority),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      addedAt: Value(addedAt),
    );
  }

  factory WishlistEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WishlistEntry(
      cardId: serializer.fromJson<String>(json['cardId']),
      priority: serializer.fromJson<int>(json['priority']),
      notes: serializer.fromJson<String?>(json['notes']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cardId': serializer.toJson<String>(cardId),
      'priority': serializer.toJson<int>(priority),
      'notes': serializer.toJson<String?>(notes),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  WishlistEntry copyWith(
          {String? cardId,
          int? priority,
          Value<String?> notes = const Value.absent(),
          DateTime? addedAt}) =>
      WishlistEntry(
        cardId: cardId ?? this.cardId,
        priority: priority ?? this.priority,
        notes: notes.present ? notes.value : this.notes,
        addedAt: addedAt ?? this.addedAt,
      );
  WishlistEntry copyWithCompanion(WishlistEntriesCompanion data) {
    return WishlistEntry(
      cardId: data.cardId.present ? data.cardId.value : this.cardId,
      priority: data.priority.present ? data.priority.value : this.priority,
      notes: data.notes.present ? data.notes.value : this.notes,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WishlistEntry(')
          ..write('cardId: $cardId, ')
          ..write('priority: $priority, ')
          ..write('notes: $notes, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cardId, priority, notes, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WishlistEntry &&
          other.cardId == this.cardId &&
          other.priority == this.priority &&
          other.notes == this.notes &&
          other.addedAt == this.addedAt);
}

class WishlistEntriesCompanion extends UpdateCompanion<WishlistEntry> {
  final Value<String> cardId;
  final Value<int> priority;
  final Value<String?> notes;
  final Value<DateTime> addedAt;
  final Value<int> rowid;
  const WishlistEntriesCompanion({
    this.cardId = const Value.absent(),
    this.priority = const Value.absent(),
    this.notes = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WishlistEntriesCompanion.insert({
    required String cardId,
    this.priority = const Value.absent(),
    this.notes = const Value.absent(),
    this.addedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : cardId = Value(cardId);
  static Insertable<WishlistEntry> custom({
    Expression<String>? cardId,
    Expression<int>? priority,
    Expression<String>? notes,
    Expression<DateTime>? addedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cardId != null) 'card_id': cardId,
      if (priority != null) 'priority': priority,
      if (notes != null) 'notes': notes,
      if (addedAt != null) 'added_at': addedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WishlistEntriesCompanion copyWith(
      {Value<String>? cardId,
      Value<int>? priority,
      Value<String?>? notes,
      Value<DateTime>? addedAt,
      Value<int>? rowid}) {
    return WishlistEntriesCompanion(
      cardId: cardId ?? this.cardId,
      priority: priority ?? this.priority,
      notes: notes ?? this.notes,
      addedAt: addedAt ?? this.addedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cardId.present) {
      map['card_id'] = Variable<String>(cardId.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WishlistEntriesCompanion(')
          ..write('cardId: $cardId, ')
          ..write('priority: $priority, ')
          ..write('notes: $notes, ')
          ..write('addedAt: $addedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $CardSetsTable cardSets = $CardSetsTable(this);
  late final $CollectionEntriesTable collectionEntries =
      $CollectionEntriesTable(this);
  late final $WishlistEntriesTable wishlistEntries =
      $WishlistEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cards, cardSets, collectionEntries, wishlistEntries];
}

typedef $$CardsTableCreateCompanionBuilder = CardsCompanion Function({
  required String id,
  required String name,
  required String setCode,
  required String cardType,
  required String color,
  Value<int?> level,
  Value<int?> power,
  Value<String?> cost,
  Value<int?> costTotal,
  Value<int?> cardLimit,
  Value<String?> lrigType,
  Value<String?> classType,
  Value<bool> hasLifeBurst,
  Value<String?> effectText,
  Value<String?> lifeBurstText,
  Value<String?> imageUrl,
  Value<String?> rarity,
  Value<bool> formatAllstar,
  Value<bool> formatKey,
  Value<int> rowid,
});
typedef $$CardsTableUpdateCompanionBuilder = CardsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> setCode,
  Value<String> cardType,
  Value<String> color,
  Value<int?> level,
  Value<int?> power,
  Value<String?> cost,
  Value<int?> costTotal,
  Value<int?> cardLimit,
  Value<String?> lrigType,
  Value<String?> classType,
  Value<bool> hasLifeBurst,
  Value<String?> effectText,
  Value<String?> lifeBurstText,
  Value<String?> imageUrl,
  Value<String?> rarity,
  Value<bool> formatAllstar,
  Value<bool> formatKey,
  Value<int> rowid,
});

final class $$CardsTableReferences
    extends BaseReferences<_$AppDatabase, $CardsTable, Card> {
  $$CardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionEntriesTable, List<CollectionEntry>>
      _collectionEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.collectionEntries,
              aliasName: $_aliasNameGenerator(
                  db.cards.id, db.collectionEntries.cardId));

  $$CollectionEntriesTableProcessedTableManager get collectionEntriesRefs {
    final manager =
        $$CollectionEntriesTableTableManager($_db, $_db.collectionEntries)
            .filter((f) => f.cardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_collectionEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$WishlistEntriesTable, List<WishlistEntry>>
      _wishlistEntriesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.wishlistEntries,
              aliasName:
                  $_aliasNameGenerator(db.cards.id, db.wishlistEntries.cardId));

  $$WishlistEntriesTableProcessedTableManager get wishlistEntriesRefs {
    final manager =
        $$WishlistEntriesTableTableManager($_db, $_db.wishlistEntries)
            .filter((f) => f.cardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_wishlistEntriesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CardsTableFilterComposer extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get setCode => $composableBuilder(
      column: $table.setCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cardType => $composableBuilder(
      column: $table.cardType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get power => $composableBuilder(
      column: $table.power, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get costTotal => $composableBuilder(
      column: $table.costTotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cardLimit => $composableBuilder(
      column: $table.cardLimit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lrigType => $composableBuilder(
      column: $table.lrigType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get classType => $composableBuilder(
      column: $table.classType, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasLifeBurst => $composableBuilder(
      column: $table.hasLifeBurst, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get effectText => $composableBuilder(
      column: $table.effectText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lifeBurstText => $composableBuilder(
      column: $table.lifeBurstText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rarity => $composableBuilder(
      column: $table.rarity, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get formatAllstar => $composableBuilder(
      column: $table.formatAllstar, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get formatKey => $composableBuilder(
      column: $table.formatKey, builder: (column) => ColumnFilters(column));

  Expression<bool> collectionEntriesRefs(
      Expression<bool> Function($$CollectionEntriesTableFilterComposer f) f) {
    final $$CollectionEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.collectionEntries,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CollectionEntriesTableFilterComposer(
              $db: $db,
              $table: $db.collectionEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> wishlistEntriesRefs(
      Expression<bool> Function($$WishlistEntriesTableFilterComposer f) f) {
    final $$WishlistEntriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.wishlistEntries,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WishlistEntriesTableFilterComposer(
              $db: $db,
              $table: $db.wishlistEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get setCode => $composableBuilder(
      column: $table.setCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cardType => $composableBuilder(
      column: $table.cardType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get power => $composableBuilder(
      column: $table.power, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cost => $composableBuilder(
      column: $table.cost, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get costTotal => $composableBuilder(
      column: $table.costTotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cardLimit => $composableBuilder(
      column: $table.cardLimit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lrigType => $composableBuilder(
      column: $table.lrigType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get classType => $composableBuilder(
      column: $table.classType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasLifeBurst => $composableBuilder(
      column: $table.hasLifeBurst,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get effectText => $composableBuilder(
      column: $table.effectText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lifeBurstText => $composableBuilder(
      column: $table.lifeBurstText,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rarity => $composableBuilder(
      column: $table.rarity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get formatAllstar => $composableBuilder(
      column: $table.formatAllstar,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get formatKey => $composableBuilder(
      column: $table.formatKey, builder: (column) => ColumnOrderings(column));
}

class $$CardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get setCode =>
      $composableBuilder(column: $table.setCode, builder: (column) => column);

  GeneratedColumn<String> get cardType =>
      $composableBuilder(column: $table.cardType, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get power =>
      $composableBuilder(column: $table.power, builder: (column) => column);

  GeneratedColumn<String> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<int> get costTotal =>
      $composableBuilder(column: $table.costTotal, builder: (column) => column);

  GeneratedColumn<int> get cardLimit =>
      $composableBuilder(column: $table.cardLimit, builder: (column) => column);

  GeneratedColumn<String> get lrigType =>
      $composableBuilder(column: $table.lrigType, builder: (column) => column);

  GeneratedColumn<String> get classType =>
      $composableBuilder(column: $table.classType, builder: (column) => column);

  GeneratedColumn<bool> get hasLifeBurst => $composableBuilder(
      column: $table.hasLifeBurst, builder: (column) => column);

  GeneratedColumn<String> get effectText => $composableBuilder(
      column: $table.effectText, builder: (column) => column);

  GeneratedColumn<String> get lifeBurstText => $composableBuilder(
      column: $table.lifeBurstText, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get rarity =>
      $composableBuilder(column: $table.rarity, builder: (column) => column);

  GeneratedColumn<bool> get formatAllstar => $composableBuilder(
      column: $table.formatAllstar, builder: (column) => column);

  GeneratedColumn<bool> get formatKey =>
      $composableBuilder(column: $table.formatKey, builder: (column) => column);

  Expression<T> collectionEntriesRefs<T extends Object>(
      Expression<T> Function($$CollectionEntriesTableAnnotationComposer a) f) {
    final $$CollectionEntriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.collectionEntries,
            getReferencedColumn: (t) => t.cardId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$CollectionEntriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.collectionEntries,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> wishlistEntriesRefs<T extends Object>(
      Expression<T> Function($$WishlistEntriesTableAnnotationComposer a) f) {
    final $$WishlistEntriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.wishlistEntries,
        getReferencedColumn: (t) => t.cardId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$WishlistEntriesTableAnnotationComposer(
              $db: $db,
              $table: $db.wishlistEntries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardsTable,
    Card,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (Card, $$CardsTableReferences),
    Card,
    PrefetchHooks Function(
        {bool collectionEntriesRefs, bool wishlistEntriesRefs})> {
  $$CardsTableTableManager(_$AppDatabase db, $CardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> setCode = const Value.absent(),
            Value<String> cardType = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<int?> level = const Value.absent(),
            Value<int?> power = const Value.absent(),
            Value<String?> cost = const Value.absent(),
            Value<int?> costTotal = const Value.absent(),
            Value<int?> cardLimit = const Value.absent(),
            Value<String?> lrigType = const Value.absent(),
            Value<String?> classType = const Value.absent(),
            Value<bool> hasLifeBurst = const Value.absent(),
            Value<String?> effectText = const Value.absent(),
            Value<String?> lifeBurstText = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> rarity = const Value.absent(),
            Value<bool> formatAllstar = const Value.absent(),
            Value<bool> formatKey = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardsCompanion(
            id: id,
            name: name,
            setCode: setCode,
            cardType: cardType,
            color: color,
            level: level,
            power: power,
            cost: cost,
            costTotal: costTotal,
            cardLimit: cardLimit,
            lrigType: lrigType,
            classType: classType,
            hasLifeBurst: hasLifeBurst,
            effectText: effectText,
            lifeBurstText: lifeBurstText,
            imageUrl: imageUrl,
            rarity: rarity,
            formatAllstar: formatAllstar,
            formatKey: formatKey,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String setCode,
            required String cardType,
            required String color,
            Value<int?> level = const Value.absent(),
            Value<int?> power = const Value.absent(),
            Value<String?> cost = const Value.absent(),
            Value<int?> costTotal = const Value.absent(),
            Value<int?> cardLimit = const Value.absent(),
            Value<String?> lrigType = const Value.absent(),
            Value<String?> classType = const Value.absent(),
            Value<bool> hasLifeBurst = const Value.absent(),
            Value<String?> effectText = const Value.absent(),
            Value<String?> lifeBurstText = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> rarity = const Value.absent(),
            Value<bool> formatAllstar = const Value.absent(),
            Value<bool> formatKey = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardsCompanion.insert(
            id: id,
            name: name,
            setCode: setCode,
            cardType: cardType,
            color: color,
            level: level,
            power: power,
            cost: cost,
            costTotal: costTotal,
            cardLimit: cardLimit,
            lrigType: lrigType,
            classType: classType,
            hasLifeBurst: hasLifeBurst,
            effectText: effectText,
            lifeBurstText: lifeBurstText,
            imageUrl: imageUrl,
            rarity: rarity,
            formatAllstar: formatAllstar,
            formatKey: formatKey,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CardsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {collectionEntriesRefs = false, wishlistEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionEntriesRefs) db.collectionEntries,
                if (wishlistEntriesRefs) db.wishlistEntries
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionEntriesRefs)
                    await $_getPrefetchedData<Card, $CardsTable,
                            CollectionEntry>(
                        currentTable: table,
                        referencedTable: $$CardsTableReferences
                            ._collectionEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardsTableReferences(db, table, p0)
                                .collectionEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items),
                  if (wishlistEntriesRefs)
                    await $_getPrefetchedData<Card, $CardsTable, WishlistEntry>(
                        currentTable: table,
                        referencedTable: $$CardsTableReferences
                            ._wishlistEntriesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CardsTableReferences(db, table, p0)
                                .wishlistEntriesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.cardId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardsTable,
    Card,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (Card, $$CardsTableReferences),
    Card,
    PrefetchHooks Function(
        {bool collectionEntriesRefs, bool wishlistEntriesRefs})>;
typedef $$CardSetsTableCreateCompanionBuilder = CardSetsCompanion Function({
  required String code,
  required String name,
  required String setType,
  Value<String?> releaseDate,
  Value<int> totalCards,
  Value<int> rowid,
});
typedef $$CardSetsTableUpdateCompanionBuilder = CardSetsCompanion Function({
  Value<String> code,
  Value<String> name,
  Value<String> setType,
  Value<String?> releaseDate,
  Value<int> totalCards,
  Value<int> rowid,
});

class $$CardSetsTableFilterComposer
    extends Composer<_$AppDatabase, $CardSetsTable> {
  $$CardSetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get setType => $composableBuilder(
      column: $table.setType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => ColumnFilters(column));
}

class $$CardSetsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardSetsTable> {
  $$CardSetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get setType => $composableBuilder(
      column: $table.setType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => ColumnOrderings(column));
}

class $$CardSetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardSetsTable> {
  $$CardSetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get setType =>
      $composableBuilder(column: $table.setType, builder: (column) => column);

  GeneratedColumn<String> get releaseDate => $composableBuilder(
      column: $table.releaseDate, builder: (column) => column);

  GeneratedColumn<int> get totalCards => $composableBuilder(
      column: $table.totalCards, builder: (column) => column);
}

class $$CardSetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardSetsTable,
    CardSet,
    $$CardSetsTableFilterComposer,
    $$CardSetsTableOrderingComposer,
    $$CardSetsTableAnnotationComposer,
    $$CardSetsTableCreateCompanionBuilder,
    $$CardSetsTableUpdateCompanionBuilder,
    (CardSet, BaseReferences<_$AppDatabase, $CardSetsTable, CardSet>),
    CardSet,
    PrefetchHooks Function()> {
  $$CardSetsTableTableManager(_$AppDatabase db, $CardSetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardSetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardSetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardSetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> code = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> setType = const Value.absent(),
            Value<String?> releaseDate = const Value.absent(),
            Value<int> totalCards = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardSetsCompanion(
            code: code,
            name: name,
            setType: setType,
            releaseDate: releaseDate,
            totalCards: totalCards,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String code,
            required String name,
            required String setType,
            Value<String?> releaseDate = const Value.absent(),
            Value<int> totalCards = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardSetsCompanion.insert(
            code: code,
            name: name,
            setType: setType,
            releaseDate: releaseDate,
            totalCards: totalCards,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CardSetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardSetsTable,
    CardSet,
    $$CardSetsTableFilterComposer,
    $$CardSetsTableOrderingComposer,
    $$CardSetsTableAnnotationComposer,
    $$CardSetsTableCreateCompanionBuilder,
    $$CardSetsTableUpdateCompanionBuilder,
    (CardSet, BaseReferences<_$AppDatabase, $CardSetsTable, CardSet>),
    CardSet,
    PrefetchHooks Function()>;
typedef $$CollectionEntriesTableCreateCompanionBuilder
    = CollectionEntriesCompanion Function({
  required String cardId,
  Value<int> quantity,
  Value<DateTime> addedAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});
typedef $$CollectionEntriesTableUpdateCompanionBuilder
    = CollectionEntriesCompanion Function({
  Value<String> cardId,
  Value<int> quantity,
  Value<DateTime> addedAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$CollectionEntriesTableReferences extends BaseReferences<
    _$AppDatabase, $CollectionEntriesTable, CollectionEntry> {
  $$CollectionEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CardsTable _cardIdTable(_$AppDatabase db) => db.cards.createAlias(
      $_aliasNameGenerator(db.collectionEntries.cardId, db.cards.id));

  $$CardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<String>('card_id')!;

    final manager = $$CardsTableTableManager($_db, $_db.cards)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CollectionEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionEntriesTable> {
  $$CollectionEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$CardsTableFilterComposer get cardId {
    final $$CardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableFilterComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionEntriesTable> {
  $$CollectionEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$CardsTableOrderingComposer get cardId {
    final $$CardsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableOrderingComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionEntriesTable> {
  $$CollectionEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CardsTableAnnotationComposer get cardId {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableAnnotationComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CollectionEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CollectionEntriesTable,
    CollectionEntry,
    $$CollectionEntriesTableFilterComposer,
    $$CollectionEntriesTableOrderingComposer,
    $$CollectionEntriesTableAnnotationComposer,
    $$CollectionEntriesTableCreateCompanionBuilder,
    $$CollectionEntriesTableUpdateCompanionBuilder,
    (CollectionEntry, $$CollectionEntriesTableReferences),
    CollectionEntry,
    PrefetchHooks Function({bool cardId})> {
  $$CollectionEntriesTableTableManager(
      _$AppDatabase db, $CollectionEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CollectionEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CollectionEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CollectionEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> cardId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionEntriesCompanion(
            cardId: cardId,
            quantity: quantity,
            addedAt: addedAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String cardId,
            Value<int> quantity = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CollectionEntriesCompanion.insert(
            cardId: cardId,
            quantity: quantity,
            addedAt: addedAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CollectionEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$CollectionEntriesTableReferences._cardIdTable(db),
                    referencedColumn:
                        $$CollectionEntriesTableReferences._cardIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CollectionEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CollectionEntriesTable,
    CollectionEntry,
    $$CollectionEntriesTableFilterComposer,
    $$CollectionEntriesTableOrderingComposer,
    $$CollectionEntriesTableAnnotationComposer,
    $$CollectionEntriesTableCreateCompanionBuilder,
    $$CollectionEntriesTableUpdateCompanionBuilder,
    (CollectionEntry, $$CollectionEntriesTableReferences),
    CollectionEntry,
    PrefetchHooks Function({bool cardId})>;
typedef $$WishlistEntriesTableCreateCompanionBuilder = WishlistEntriesCompanion
    Function({
  required String cardId,
  Value<int> priority,
  Value<String?> notes,
  Value<DateTime> addedAt,
  Value<int> rowid,
});
typedef $$WishlistEntriesTableUpdateCompanionBuilder = WishlistEntriesCompanion
    Function({
  Value<String> cardId,
  Value<int> priority,
  Value<String?> notes,
  Value<DateTime> addedAt,
  Value<int> rowid,
});

final class $$WishlistEntriesTableReferences extends BaseReferences<
    _$AppDatabase, $WishlistEntriesTable, WishlistEntry> {
  $$WishlistEntriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CardsTable _cardIdTable(_$AppDatabase db) => db.cards.createAlias(
      $_aliasNameGenerator(db.wishlistEntries.cardId, db.cards.id));

  $$CardsTableProcessedTableManager get cardId {
    final $_column = $_itemColumn<String>('card_id')!;

    final manager = $$CardsTableTableManager($_db, $_db.cards)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$WishlistEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $WishlistEntriesTable> {
  $$WishlistEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnFilters(column));

  $$CardsTableFilterComposer get cardId {
    final $$CardsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableFilterComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WishlistEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $WishlistEntriesTable> {
  $$WishlistEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
      column: $table.addedAt, builder: (column) => ColumnOrderings(column));

  $$CardsTableOrderingComposer get cardId {
    final $$CardsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableOrderingComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WishlistEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WishlistEntriesTable> {
  $$WishlistEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$CardsTableAnnotationComposer get cardId {
    final $$CardsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.cardId,
        referencedTable: $db.cards,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CardsTableAnnotationComposer(
              $db: $db,
              $table: $db.cards,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$WishlistEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WishlistEntriesTable,
    WishlistEntry,
    $$WishlistEntriesTableFilterComposer,
    $$WishlistEntriesTableOrderingComposer,
    $$WishlistEntriesTableAnnotationComposer,
    $$WishlistEntriesTableCreateCompanionBuilder,
    $$WishlistEntriesTableUpdateCompanionBuilder,
    (WishlistEntry, $$WishlistEntriesTableReferences),
    WishlistEntry,
    PrefetchHooks Function({bool cardId})> {
  $$WishlistEntriesTableTableManager(
      _$AppDatabase db, $WishlistEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WishlistEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WishlistEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WishlistEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> cardId = const Value.absent(),
            Value<int> priority = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WishlistEntriesCompanion(
            cardId: cardId,
            priority: priority,
            notes: notes,
            addedAt: addedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String cardId,
            Value<int> priority = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> addedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WishlistEntriesCompanion.insert(
            cardId: cardId,
            priority: priority,
            notes: notes,
            addedAt: addedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$WishlistEntriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({cardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (cardId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.cardId,
                    referencedTable:
                        $$WishlistEntriesTableReferences._cardIdTable(db),
                    referencedColumn:
                        $$WishlistEntriesTableReferences._cardIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$WishlistEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $WishlistEntriesTable,
    WishlistEntry,
    $$WishlistEntriesTableFilterComposer,
    $$WishlistEntriesTableOrderingComposer,
    $$WishlistEntriesTableAnnotationComposer,
    $$WishlistEntriesTableCreateCompanionBuilder,
    $$WishlistEntriesTableUpdateCompanionBuilder,
    (WishlistEntry, $$WishlistEntriesTableReferences),
    WishlistEntry,
    PrefetchHooks Function({bool cardId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
  $$CardSetsTableTableManager get cardSets =>
      $$CardSetsTableTableManager(_db, _db.cardSets);
  $$CollectionEntriesTableTableManager get collectionEntries =>
      $$CollectionEntriesTableTableManager(_db, _db.collectionEntries);
  $$WishlistEntriesTableTableManager get wishlistEntries =>
      $$WishlistEntriesTableTableManager(_db, _db.wishlistEntries);
}
