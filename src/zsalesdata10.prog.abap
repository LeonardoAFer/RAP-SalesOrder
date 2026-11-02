*&---------------------------------------------------------------------*
*& Report ZSALESDATA10
*&---------------------------------------------------------------------*
REPORT zsalesdata10.

*----------------------------------------------------------------------*
* Cabeçalho
*----------------------------------------------------------------------*
DATA itab TYPE TABLE OF zsaleshdr10.

itab = VALUE #(
  ( uuid                 = '02D5290E594C1EDA93815057FD946624'
    sales_order          = '1000000001'
    sales_oder_type      = 'OR'
    description          = 'iPhone'
    sold_to_party        = 'Demo_user1'
    sales_organization   = '0001'
    distribution_channel = '01'
    document_reason      = '1'
    total_net_amount     = '700.00'
    transaction_currency = 'USD'
    created_by_user      = 'USER1'
    created_at           = '20190613111129.2391370'
    last_changed_by_user = 'USER1'
    changed_at           = '20190711140753.1472620'
    local_changed_at     = '20190711140753.1472620' )
  ( uuid                 = '02D5290E594C1EDA93815057FD946625'
    sales_order          = '1000000002'
    sales_oder_type      = 'OR'
    description          = 'Lenovo Laptop'
    sold_to_party        = 'Demo_user2'
    sales_organization   = '0001'
    distribution_channel = '01'
    document_reason      = '1'
    total_net_amount     = '1000.00'
    transaction_currency = 'USD'
    created_by_user      = 'USER1'
    created_at           = '20190713111129.2391370'
    last_changed_by_user = 'USER1'
    changed_at           = '20190713111129.2391370'
    local_changed_at     = '20190713111129.2391370' ) ).

DELETE FROM zsaleshdr10.
INSERT zsaleshdr10 FROM TABLE @itab.
IF sy-subrc = 0.
  WRITE: / 'Cabeçalhos inseridos:', sy-dbcnt.
ENDIF.

*----------------------------------------------------------------------*
* Itens
*----------------------------------------------------------------------*
DATA itabitem TYPE TABLE OF zsalesitem10.

itabitem = VALUE #(
  ( uuid                 = '12D5290E594C1EDA93815057FD946624'
    salesorderuuid       = '02D5290E594C1EDA93815057FD946624'
    item                 = '000010'
    item_category        = 'TAQB'
    item_text            = 'iPhone'
    material             = '1110000980'
    plant                = '0010'
    order_quantity       = '1'
    order_quantity_unit  = 'EA'
    netamount            = '700.00'
    transaction_currency = 'USD'
    created_by_user      = 'USER1'
    creation_at          = '20190613111129'
    last_changed_by_user = 'USER1'
    changed_at           = '20190711140753'
    local_changed_at     = '20190711140753' )
  ( uuid                 = '12D5290E594C1EDA93815057FD946625'
    salesorderuuid       = '02D5290E594C1EDA93815057FD946625'
    item                 = '000010'
    item_category        = 'TAQB'
    item_text            = 'Lenovo Laptop'
    material             = '1110000980'
    plant                = '0010'
    order_quantity       = '1'
    order_quantity_unit  = 'EA'
    netamount            = '1000.00'
    transaction_currency = 'USD'
    created_by_user      = 'USER1'
    creation_at          = '20190713111129'
    last_changed_by_user = 'USER1'
    changed_at           = '20190713111129'
    local_changed_at     = '20190713111129' ) ).

DELETE FROM zsalesitem10.
INSERT zsalesitem10 FROM TABLE @itabitem.
IF sy-subrc = 0.
  WRITE: / 'Itens inseridos:', sy-dbcnt.
ENDIF.
