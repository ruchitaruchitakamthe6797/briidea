
import 'package:app_briidea/constants/strings.dart';

class Permissions {
  /* String role='';

  Permissions(this.role);
*/
  bool createAnalytics = false;
  bool readAnalytics = false;
  bool updateAnalytics = false;
  bool deleteAnalytics = false;

  bool createOffer = false;
  bool readOffer = false;
  bool updateOffer = false;
  bool deleteOffer = false;

  bool createHistory = false;
  bool readHistory = false;
  bool updateHistory = false;
  bool deleteHistory = false;

  bool createUser = false;
  bool readUser = false;
  bool updateUser = false;
  bool deleteUser = false;

  bool createStore = false;
  bool readStore = false;
  bool updateStore = false;
  bool deleteStore = false;

  /// Honour offer/ record sale
  bool createSale = false;
  bool readSale = false;
  bool updateSale = false;
  bool deleteSale = false;

  /* String get getRole {
    return this.role;
  }

  set setRole(String role) {
    this.role = role;
  }*/

  ///Start analytics

  bool get getCreateAnalytics {
    return createAnalytics;
  }

  set setCreateAnalytics(bool createAnalytics) {
    this.createAnalytics = createAnalytics;
  }

  bool get getReadAnalytics {
    return readAnalytics;
  }

  set setReadAnalytics(bool readAnalytics) {
    this.readAnalytics = readAnalytics;
  }

  bool get getUpdateAnalytics {
    return updateAnalytics;
  }

  set setUpdateAnalytics(bool updateAnalytics) {
    this.updateAnalytics = updateAnalytics;
  }

  bool get getDeleteAnalytics {
    return deleteAnalytics;
  }

  set setDeleteAnalytics(bool deleteAnalytics) {
    this.deleteAnalytics = deleteAnalytics;
  }

  ///End analytics

  ///Start Offer

  bool get getCreateOffer {
    return createOffer;
  }

  set setCreateOffer(bool createOffer) {
    this.createOffer = createOffer;
  }

  bool get getReadOffer {
    return readOffer;
  }

  set setReadOffer(bool readOffer) {
    this.readOffer = readOffer;
  }

  bool get getUpdateOffer {
    return updateOffer;
  }

  set setUpdateOffer(bool updateOffer) {
    this.updateOffer = updateOffer;
  }

  bool get getDeleteOffer {
    return deleteOffer;
  }

  set setDeleteOffer(bool deleteOffer) {
    this.deleteOffer = deleteOffer;
  }

  ///End Offer

  ///Start History

  bool get getCreateHistory {
    return createHistory;
  }

  set setCreateHistory(bool createHistory) {
    this.createHistory = createHistory;
  }

  bool get getReadHistory {
    return readHistory;
  }

  set setReadHistory(bool readHistory) {
    this.readHistory = readHistory;
  }

  bool get getUpdateHistory {
    return updateHistory;
  }

  set setUpdateHistory(bool updateHistory) {
    this.updateHistory = updateHistory;
  }

  bool get getDeleteHistory {
    return deleteHistory;
  }

  set setDeleteHistory(bool deleteHistory) {
    this.deleteHistory = deleteHistory;
  }

  ///End History

  ///Start User

  bool get getCreateUser {
    return createUser;
  }

  set setCreateUser(bool createUser) {
    this.createUser = createUser;
  }

  bool get getReadUser {
    return readUser;
  }

  set setReadUser(bool readUser) {
    this.readUser = readUser;
  }

  bool get getUpdateUser {
    return updateUser;
  }

  set setUpdateUser(bool updateUser) {
    this.updateUser = updateUser;
  }

  bool get getDeleteUser {
    return deleteUser;
  }

  set setDeleteUser(bool deleteUser) {
    this.deleteUser = deleteUser;
  }

  ///End User

  ///Start Store

  bool get getCreateStore {
    return createStore;
  }

  set setCreateStore(bool createStore) {
    this.createStore = createStore;
  }

  bool get getReadStore {
    return readStore;
  }

  set setReadStore(bool readStore) {
    this.readStore = readStore;
  }

  bool get getUpdateStore {
    return updateStore;
  }

  set setUpdateStore(bool updateStore) {
    this.updateStore = updateStore;
  }

  bool get getDeleteStore {
    return deleteStore;
  }

  set setDeleteStore(bool deleteStore) {
    this.deleteStore = deleteStore;
  }

  ///End Store

  ///Start Sale

  bool get getCreateSale {
    return createSale;
  }

  set setCreateSale(bool createSale) {
    this.createSale = createSale;
  }

  bool get getReadSale {
    return readSale;
  }

  set setReadSale(bool readSale) {
    this.readSale = readSale;
  }

  bool get getUpdateSale {
    return updateSale;
  }

  set setUpdateSale(bool updateSale) {
    this.updateSale = updateSale;
  }

  bool get getDeleteSale {
    return deleteSale;
  }

  set setDeleteSale(bool deleteSale) {
    this.deleteSale = deleteSale;
  }

  ///End Sale

}

class AnalyticsPermissions {
  String role;
  Permissions permissions = new Permissions();

  AnalyticsPermissions(this.role);

  setAnalyticsPermissions() {
    switch (role) {
      case Strings.BusinessOwner:
        return [
          permissions.setCreateAnalytics = true,
          permissions.setReadAnalytics = true,
          permissions.updateAnalytics = true,
          permissions.deleteAnalytics = true
        ];
      case Strings.BusinessManager:
        return [
          permissions.setCreateAnalytics = true,
          permissions.setReadAnalytics = true,
          permissions.updateAnalytics = true,
          permissions.deleteAnalytics = true
        ];
      case Strings.LoyaltyManager:
        return [
          permissions.setCreateAnalytics = true,
          permissions.setReadAnalytics = true,
          permissions.updateAnalytics = true,
          permissions.deleteAnalytics = true
        ];
      case Strings.BusinessStoreManager:
        return [
          permissions.setCreateAnalytics = true,
          permissions.setReadAnalytics = true,
          permissions.updateAnalytics = true,
          permissions.deleteAnalytics = true
        ];
      case Strings.Accountant:
        return [
          permissions.setCreateAnalytics = true,
          permissions.setReadAnalytics = true,
          permissions.updateAnalytics = true,
          permissions.deleteAnalytics = true
        ];
      case Strings.POS:
        return [
          permissions.setCreateAnalytics = false,
          permissions.setReadAnalytics = false,
          permissions.updateAnalytics = false,
          permissions.deleteAnalytics = false
        ];
    }
    return [
      permissions.setCreateAnalytics = false,
      permissions.setReadAnalytics = false,
      permissions.updateAnalytics = false,
      permissions.deleteAnalytics = false
    ];
  }

  bool get getCreateAnalytics {
    return permissions.getCreateAnalytics;
  }

  bool get getReadAnalytics {
    return permissions.readAnalytics;
  }

  bool get getUpdateAnalytics {
    return permissions.updateAnalytics;
  }

  bool get getDeleteAnalytics {
    return permissions.deleteAnalytics;
  }
}

class OfferPermissions {
  String role;
  Permissions permissions = new Permissions();

  OfferPermissions(this.role);

  setOfferPermissions() {
    switch (role) {
      case Strings.BusinessOwner:
        return [
          permissions.setCreateOffer = true,
          permissions.setReadOffer = true,
          permissions.setUpdateOffer = true,
          permissions.setDeleteOffer = true
        ];
      case Strings.BusinessManager:
        return [
          permissions.setCreateOffer = false,
          permissions.setReadOffer = false,
          permissions.setUpdateOffer = false,
          permissions.setDeleteOffer = false
        ];
      case Strings.LoyaltyManager:
        return [
          permissions.setCreateOffer = true,
          permissions.setReadOffer = true,
          permissions.setUpdateOffer = true,
          permissions.setDeleteOffer = true
        ];
      case Strings.BusinessStoreManager:
        return [
          permissions.setCreateOffer = false,
          permissions.setReadOffer = false,
          permissions.setUpdateOffer = false,
          permissions.setDeleteOffer = false
        ];
      case Strings.Accountant:
        return [
          permissions.setCreateOffer = false,
          permissions.setReadOffer = false,
          permissions.setUpdateOffer = false,
          permissions.setDeleteOffer = false
        ];
      case Strings.POS:
        return [
          permissions.setCreateOffer = false,
          permissions.setReadOffer = false,
          permissions.setUpdateOffer = false,
          permissions.setDeleteOffer = false
        ];
    }
    return [
      permissions.setCreateOffer = false,
      permissions.setReadOffer = false,
      permissions.setUpdateOffer = false,
      permissions.setDeleteOffer = false
    ];
  }

  bool get getCreateOffer {
    return permissions.getCreateOffer;
  }

  bool get getReadOffer {
    return permissions.readOffer;
  }

  bool get getUpdateOffer {
    return permissions.updateOffer;
  }

  bool get getDeleteOffer {
    return permissions.deleteOffer;
  }
}

class TransactionHistoryPermissions {
  String role;
  Permissions permissions = new Permissions();

  TransactionHistoryPermissions(this.role);

  setTransactionHistoryPermissions() {
    switch (role) {
      case Strings.BusinessOwner:
        return [
          permissions.setCreateHistory = true,
          permissions.setReadHistory = true,
          permissions.setUpdateHistory = true,
          permissions.setDeleteHistory = true
        ];
      case Strings.BusinessManager:
        return [
          permissions.setCreateHistory = true,
          permissions.setReadHistory = true,
          permissions.setUpdateHistory = true,
          permissions.setDeleteHistory = true
        ];
      case Strings.LoyaltyManager:
        return [
          permissions.setCreateHistory = false,
          permissions.setReadHistory = false,
          permissions.setUpdateHistory = false,
          permissions.setDeleteHistory = false
        ];
      case Strings.BusinessStoreManager:
        return [
          permissions.setCreateHistory = true,
          permissions.setReadHistory = true,
          permissions.setUpdateHistory = true,
          permissions.setDeleteHistory = true
        ];
      case Strings.Accountant:
        return [
          permissions.setCreateHistory = true,
          permissions.setReadHistory = true,
          permissions.setUpdateHistory = true,
          permissions.setDeleteHistory = true
        ];
      case Strings.POS:
        return [
          permissions.setCreateHistory = true,
          permissions.setReadHistory = true,
          permissions.setUpdateHistory = true,
          permissions.setDeleteHistory = true
        ];
    }
    return [
      permissions.setCreateHistory = false,
      permissions.setReadHistory = false,
      permissions.setUpdateHistory = false,
      permissions.setDeleteHistory = false
    ];
  }

  bool get getCreateHistory {
    return permissions.getCreateHistory;
  }

  bool get getReadHistory {
    return permissions.readHistory;
  }

  bool get getUpdateHistory {
    return permissions.updateOffer;
  }

  bool get getDeleteHistory {
    return permissions.deleteHistory;
  }
}

class StorePermissions {
  String role;
  Permissions permissions = new Permissions();

  StorePermissions(this.role);

  setStorePermissions() {
    switch (role) {
      case Strings.BusinessOwner:
        return [
          permissions.setCreateStore = true,
          permissions.setReadStore = true,
          permissions.setUpdateStore = true,
          permissions.setDeleteStore = true
        ];
      case Strings.BusinessManager:
        return [
          permissions.setCreateStore = true,
          permissions.setReadStore = true,
          permissions.setUpdateStore = true,
          permissions.setDeleteStore = true
        ];
      case Strings.LoyaltyManager:
        return [
          permissions.setCreateStore = false,
          permissions.setReadStore = false,
          permissions.setUpdateStore = false,
          permissions.setDeleteStore = false
        ];
      case Strings.BusinessStoreManager:
        return [
          permissions.setCreateStore = false,
          permissions.setReadStore = false,
          permissions.setUpdateStore = false,
          permissions.setDeleteStore = false
        ];
      case Strings.Accountant:
        return [
          permissions.setCreateStore = false,
          permissions.setReadStore = false,
          permissions.setUpdateStore = false,
          permissions.setDeleteStore = false
        ];
      case Strings.POS:
        return [
          permissions.setCreateStore = false,
          permissions.setReadStore = false,
          permissions.setUpdateStore = false,
          permissions.setDeleteStore = false
        ];
    }
    return [
      permissions.setCreateStore = false,
      permissions.setReadStore = false,
      permissions.setUpdateStore = false,
      permissions.setDeleteStore = false
    ];
  }

  bool get getCreateStore {
    return permissions.getCreateStore;
  }

  bool get getReadStore {
    return permissions.readStore;
  }

  bool get getUpdateStore {
    return permissions.updateStore;
  }

  bool get getDeleteStore {
    return permissions.deleteStore;
  }
}

class SalePermissions {
  String role;
  Permissions permissions = new Permissions();

  SalePermissions(this.role);

  setSalePermissions() {
    switch (role) {
      case Strings.BusinessOwner:
        return [
          permissions.setCreateSale = false,
          permissions.setReadSale = true,
          permissions.setUpdateSale = false,
          permissions.setDeleteSale = false
        ];
      case Strings.BusinessManager:
        return [
          permissions.setCreateSale = false,
          permissions.setReadSale = false,
          permissions.setUpdateSale = false,
          permissions.setDeleteSale = false
        ];
      case Strings.LoyaltyManager:
        return [
          permissions.setCreateSale = false,
          permissions.setReadSale = false,
          permissions.setUpdateSale = false,
          permissions.setDeleteSale = false
        ];
      case Strings.BusinessStoreManager:
        return [
          permissions.setCreateSale = false,
          permissions.setReadSale = false,
          permissions.setUpdateSale = false,
          permissions.setDeleteSale = false
        ];
      case Strings.Accountant:
        return [
          permissions.setCreateSale = false,
          permissions.setReadSale = false,
          permissions.setUpdateSale = false,
          permissions.setDeleteSale = false
        ];
      case Strings.POS:
        return [
          permissions.setCreateSale = true,
          permissions.setReadSale = true,
          permissions.setUpdateSale = true,
          permissions.setDeleteSale = true
        ];
    }
    return [
      permissions.setCreateSale = false,
      permissions.setReadSale = false,
      permissions.setUpdateSale = false,
      permissions.setDeleteSale = false
    ];
  }

  bool get getCreateSale {
    return permissions.getCreateSale;
  }

  bool get getReadSale {
    return permissions.readSale;
  }

  bool get getUpdateSale {
    return permissions.updateSale;
  }

  bool get getDeleteSale {
    return permissions.deleteSale;
  }
}

class UserPermissions {
  String role;
  Permissions permissions = new Permissions();

  UserPermissions(this.role);

  setUserPermissions() {
    switch (role) {
      case Strings.BusinessOwner:
        return [
          permissions.setCreateUser = true,
          permissions.setReadUser = true,
          permissions.setUpdateUser = true,
          permissions.setDeleteUser = true
        ];
      case Strings.BusinessManager:
        return [
          permissions.setCreateUser = true,
          permissions.setReadUser = true,
          permissions.setUpdateUser = true,
          permissions.setDeleteUser = true
        ];
      case Strings.LoyaltyManager:
        return [
          permissions.setCreateUser = false,
          permissions.setReadUser = false,
          permissions.setUpdateUser = false,
          permissions.setDeleteUser = false
        ];
      case Strings.BusinessStoreManager:
        return [
          permissions.setCreateUser = false,
          permissions.setReadUser = false,
          permissions.setUpdateUser = false,
          permissions.setDeleteUser = false
        ];
      case Strings.Accountant:
        return [
          permissions.setCreateUser = false,
          permissions.setReadUser = false,
          permissions.setUpdateUser = false,
          permissions.setDeleteUser = false
        ];
      case Strings.POS:
        return [
          permissions.setCreateUser = false,
          permissions.setReadUser = false,
          permissions.setUpdateUser = false,
          permissions.setDeleteUser = false
        ];
    }
    return [
      permissions.setCreateUser = false,
      permissions.setReadUser = false,
      permissions.setUpdateUser = false,
      permissions.setDeleteUser = false
    ];
  }

  bool get getCreateUser {
    return permissions.getCreateUser;
  }

  bool get getReadUser {
    return permissions.readUser;
  }

  bool get getUpdateUser {
    return permissions.updateUser;
  }

  bool get getDeleteUser {
    return permissions.deleteUser;
  }
}
