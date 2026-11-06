CLASS lhc_SalesHdr DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesHdr RESULT result.
    METHODS calcsalesorderid FOR DETERMINE ON SAVE
      IMPORTING keys FOR saleshdr~calcsalesorderid.

ENDCLASS.

CLASS lhc_SalesHdr IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD calcSalesOrderId.
    READ ENTITIES OF zi_saleshdr10
        ENTITY SalesHdr
        FIELDS ( SalesOrder ) WITH CORRESPONDING #( keys )
        RESULT DATA(Sales).

    DELETE Sales WHERE SalesOrder IS NOT INITIAL.

    IF Sales IS NOT INITIAL.
      SELECT SINGLE FROM zsaleshdr10
          FIELDS MAX( sales_order ) AS Salesorderid
          INTO @DATA(max_salesorderid).

      LOOP AT sales INTO DATA(sale).
        MODIFY ENTITIES OF zi_saleshdr10 IN LOCAL MODE
            ENTITY SalesHdr
            UPDATE
                FIELDS ( SalesOrder )
                WITH VALUE #( (
                    %tky = sale-%tky
                    salesorder = max_salesorderid + 1
                 ) ).
      ENDLOOP.


    ENDIF.

  ENDMETHOD.

ENDCLASS.
