@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Item Projection View'
define view entity ZC_SALESITEM10 as projection on ZI_SALESITEM10 as SalesItem
{
    key Uuid,
    key Salesorderuuid,
    Item,
    ItemCategory,
    ItemText,
    Material,
    Plant,
    OrderQuantity,
    OrderQuantityUnit,
    Netamount,
    TransactionCurrency,
    CreatedByUser,
    CreatedAt,
    ChangedAt,
    LastChangedByUser,
    LocalChangedAt,
    /* Associations */
    _SalesHdr : redirected to parent ZC_SALESHDR10
}
