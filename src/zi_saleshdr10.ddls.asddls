@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_SALESHDR10
  as select from zsaleshdr10
  composition [0..*] of ZI_SALESITEM10 as _SalesItem
{
  key uuid                 as Uuid,
      sales_order          as SalesOrder,
      sales_oder_type      as SalesOderType,
      description          as Description,
      sales_organization   as SalesOrganization,
      sold_to_party        as SoldToParty,
      distribution_channel as DistributionChannel,
      document_reason      as DocumentReason,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      total_net_amount     as TotalNetAmount,
      transaction_currency as TransactionCurrency,
      @Semantics.user.createdBy: true
      created_by_user      as CreatedByUser,
      @Semantics.systemDateTime.createdAt: true
      created_at           as CreatedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at           as ChangedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by_user as LastChangedByUser,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_changed_at     as LocalChangedAt ,
      _SalesItem // Make association public
}
