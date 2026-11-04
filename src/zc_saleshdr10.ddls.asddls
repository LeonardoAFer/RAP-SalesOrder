@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Projection View'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_SALESHDR10 as projection on ZI_SALESHDR10 as SalesHdr
{
    key Uuid,
    @Search.defaultSearchElement: true
    SalesOrder,
    SalesOderType,
    Description,
    @Search.defaultSearchElement: true
    SalesOrganization,
    @Search.defaultSearchElement: true
    SoldToParty,
    DistributionChannel,
    DocumentReason,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
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
