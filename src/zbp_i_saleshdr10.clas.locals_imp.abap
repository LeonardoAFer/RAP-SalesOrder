CLASS lhc_salesitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS validatePlan FOR VALIDATE ON SAVE
      IMPORTING keys FOR SalesItem~validatePlan.

ENDCLASS.

CLASS lhc_salesitem IMPLEMENTATION.

  METHOD validatePlan.

    READ ENTITIES OF zi_saleshdr10 IN LOCAL MODE
    ENTITY SalesItem
    FIELDS ( Plant ) WITH CORRESPONDING #( keys )
    RESULT DATA(SalesItems).

    SELECT FROM t001w WITH PRIVILEGED ACCESS
        FIELDS werks
        FOR ALL ENTRIES IN @SalesItems
        WHERE werks = @SalesItems-plant
        INTO TABLE @DATA(plants).


    LOOP AT salesitems INTO DATA(SalesItem).
      READ TABLE plants WITH KEY werks = salesitem-plant
          TRANSPORTING NO FIELDS.
      IF sy-subrc <> 0.
        APPEND VALUE #( %tky = salesitem-%tky ) TO failed-salesitem.
        APPEND VALUE #( %tky = salesitem-%tky
                        %msg = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text = 'Plant does not exist'
                         ) )
                         TO reported-salesitem.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_SalesHdr DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesHdr RESULT result.
    METHODS calcsalesorderid FOR DETERMINE ON SAVE
      IMPORTING keys FOR saleshdr~calcsalesorderid.
    METHODS setcomplete FOR MODIFY
      IMPORTING keys FOR ACTION saleshdr~setcomplete RESULT result.

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

  METHOD setComplete.

    MODIFY ENTITIES OF zi_saleshdr10 IN LOCAL MODE
            ENTITY SalesHdr
            UPDATE
            FIELDS ( Status )
            WITH VALUE #(
                FOR key IN keys (
                    %tky = key-%tky
                    status = 'C'
                )
             ).

    READ ENTITIES OF zi_saleshdr10 IN LOCAL MODE
     ENTITY SalesHdr
     ALL FIELDS WITH CORRESPONDING #( keys )
     RESULT DATA(Sales).

    result = VALUE #(
      FOR sale IN Sales (
          %tky = Sale-%tky
          %param  = Sale
       )
     ).

  ENDMETHOD.

ENDCLASS.
