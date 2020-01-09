*&---------------------------------------------------------------------*
*& Report ztest_copy
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ztest_copy.

PARAMETERS: p_amnt TYPE i DEFAULT '10',
            p_from TYPE numc3 DEFAULT '100'.
DO p_amnt TIMES.
  ADD 1 TO p_from.
  CALL FUNCTION 'RS_DD_COPY_OBJ'
    EXPORTING
      source_name        = 'ZTEST_ELEM_________________001'
      target_name        = CONV ddobjname( |ZTEST_ELEM_________________{ p_from }| )
      objtype            = 'E'
    EXCEPTIONS
      not_executed       = 1                " Action was terminated without saving
      permission_failure = 2                " Not possible to access the target
      OTHERS             = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
ENDDO.
