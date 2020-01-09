@AbapCatalog.sqlViewName: 'ZVTEST_IW1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Test'
define view ztest_iw1
  as select from tadir
{
  key pgmid      as program_id,
  key object     as object_type,
  key obj_name   as object_name,
      srcsystem  as source_system,
      author     as author,
      devclass   as package_name,
      masterlang as master_language
}
