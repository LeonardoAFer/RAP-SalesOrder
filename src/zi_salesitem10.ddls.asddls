@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Item interface View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_SALESITEM10
  as select from zsalesitem10
  association to parent ZI_SALESHDR10 as _SalesHdr on $projection.Salesorderuuid = _SalesHdr.Uuid
{
  key uuid                 as Uuid,
  key salesorderuuid       as Salesorderuuid,
      item                 as Item,
      item_category        as ItemCategory,
      item_text            as ItemText,
      material             as Material,
      plant                as Plant,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      order_quantity       as OrderQuantity,
      order_quantity_unit  as OrderQuantityUnit,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      netamount            as Netamount,
      transaction_currency as TransactionCurrency,
      @Semantics.user.createdBy: true
      created_by_user      as CreatedByUser,
      @Semantics.systemDateTime.createdAt: true
      creation_at           as CreatedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at           as ChangedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by_user as LastChangedByUser,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_changed_at     as LocalChangedAt,
      _SalesHdr
}
