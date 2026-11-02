@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Projection View'
define root view entity ZC_SALESHDR10 as projection on ZI_SALESHDR10 as SalesHdr
{
    key Uuid,
    SalesOrder,
    SalesOderType,
    Description,
    SalesOrganization,
    SoldToParty,
    DistributionChannel,
    DocumentReason,
    TotalNetAmount,
    TransactionCurrency,
    CreatedByUser,
    CreatedAt,
    ChangedAt,
    LastChangedByUser,
    LocalChangedAt,
    /* Associations */
    _SalesItem : redirected to composition child ZC_SALESITEM10
}
