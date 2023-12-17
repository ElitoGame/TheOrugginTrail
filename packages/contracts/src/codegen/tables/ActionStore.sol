// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

// Import user types
import { ActionType } from "./../common.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("ActionStore")))
);
ResourceId constant ActionStoreTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0007040001040101000000000000000000000000000000000000000000000000
);

struct ActionStoreData {
  ActionType actionType;
  uint32 texDefId;
  bool nESSy;
  uint8 direction;
}

library ActionStore {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.UINT32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](4);
    _valueSchema[0] = SchemaType.UINT8;
    _valueSchema[1] = SchemaType.UINT32;
    _valueSchema[2] = SchemaType.BOOL;
    _valueSchema[3] = SchemaType.UINT8;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "actionId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](4);
    fieldNames[0] = "actionType";
    fieldNames[1] = "texDefId";
    fieldNames[2] = "nESSy";
    fieldNames[3] = "direction";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get actionType.
   */
  function getActionType(uint32 actionId) internal view returns (ActionType actionType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return ActionType(uint8(bytes1(_blob)));
  }

  /**
   * @notice Get actionType.
   */
  function _getActionType(uint32 actionId) internal view returns (ActionType actionType) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return ActionType(uint8(bytes1(_blob)));
  }

  /**
   * @notice Set actionType.
   */
  function setActionType(uint32 actionId, ActionType actionType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(actionType)), _fieldLayout);
  }

  /**
   * @notice Set actionType.
   */
  function _setActionType(uint32 actionId, ActionType actionType) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked(uint8(actionType)), _fieldLayout);
  }

  /**
   * @notice Get texDefId.
   */
  function getTexDefId(uint32 actionId) internal view returns (uint32 texDefId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Get texDefId.
   */
  function _getTexDefId(uint32 actionId) internal view returns (uint32 texDefId) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint32(bytes4(_blob)));
  }

  /**
   * @notice Set texDefId.
   */
  function setTexDefId(uint32 actionId, uint32 texDefId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((texDefId)), _fieldLayout);
  }

  /**
   * @notice Set texDefId.
   */
  function _setTexDefId(uint32 actionId, uint32 texDefId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((texDefId)), _fieldLayout);
  }

  /**
   * @notice Get nESSy.
   */
  function getNESSy(uint32 actionId) internal view returns (bool nESSy) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Get nESSy.
   */
  function _getNESSy(uint32 actionId) internal view returns (bool nESSy) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (_toBool(uint8(bytes1(_blob))));
  }

  /**
   * @notice Set nESSy.
   */
  function setNESSy(uint32 actionId, bool nESSy) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((nESSy)), _fieldLayout);
  }

  /**
   * @notice Set nESSy.
   */
  function _setNESSy(uint32 actionId, bool nESSy) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((nESSy)), _fieldLayout);
  }

  /**
   * @notice Get direction.
   */
  function getDirection(uint32 actionId) internal view returns (uint8 direction) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get direction.
   */
  function _getDirection(uint32 actionId) internal view returns (uint8 direction) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set direction.
   */
  function setDirection(uint32 actionId, uint8 direction) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((direction)), _fieldLayout);
  }

  /**
   * @notice Set direction.
   */
  function _setDirection(uint32 actionId, uint8 direction) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((direction)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(uint32 actionId) internal view returns (ActionStoreData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(uint32 actionId) internal view returns (ActionStoreData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(uint32 actionId, ActionType actionType, uint32 texDefId, bool nESSy, uint8 direction) internal {
    bytes memory _staticData = encodeStatic(actionType, texDefId, nESSy, direction);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(uint32 actionId, ActionType actionType, uint32 texDefId, bool nESSy, uint8 direction) internal {
    bytes memory _staticData = encodeStatic(actionType, texDefId, nESSy, direction);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint32 actionId, ActionStoreData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.actionType, _table.texDefId, _table.nESSy, _table.direction);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint32 actionId, ActionStoreData memory _table) internal {
    bytes memory _staticData = encodeStatic(_table.actionType, _table.texDefId, _table.nESSy, _table.direction);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (ActionType actionType, uint32 texDefId, bool nESSy, uint8 direction) {
    actionType = ActionType(uint8(Bytes.slice1(_blob, 0)));

    texDefId = (uint32(Bytes.slice4(_blob, 1)));

    nESSy = (_toBool(uint8(Bytes.slice1(_blob, 5))));

    direction = (uint8(Bytes.slice1(_blob, 6)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (ActionStoreData memory _table) {
    (_table.actionType, _table.texDefId, _table.nESSy, _table.direction) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint32 actionId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint32 actionId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    ActionType actionType,
    uint32 texDefId,
    bool nESSy,
    uint8 direction
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(actionType, texDefId, nESSy, direction);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    ActionType actionType,
    uint32 texDefId,
    bool nESSy,
    uint8 direction
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(actionType, texDefId, nESSy, direction);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint32 actionId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(actionId));

    return _keyTuple;
  }
}

/**
 * @notice Cast a value to a bool.
 * @dev Boolean values are encoded as uint8 (1 = true, 0 = false), but Solidity doesn't allow casting between uint8 and bool.
 * @param value The uint8 value to convert.
 * @return result The boolean value.
 */
function _toBool(uint8 value) pure returns (bool result) {
  assembly {
    result := value
  }
}
