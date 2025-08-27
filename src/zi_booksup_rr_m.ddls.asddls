@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book Supplement Interface view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOKSUP_RR_M
  as select from zbooksup_rr_m
  association        to parent ZI_BOOK_RR_M as _Booking // a child of ZI_BOOKING
                                                               on  $projection.TravelId  = _Booking.TravelId
                                                               and $projection.BookingId = _Booking.BookingId
  association [1..1] to ZI_TRAVEL_RR_M     as _Travel      on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement      as _BookSuppl   on  $projection.BookingSupplementId = _BookSuppl.SupplementID
  association [1..*] to /DMO/I_SupplementText  as _BookSupText on  $projection.SupplementId = _BookSupText.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
        @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,
      _Booking,
      _Travel,
      _BookSuppl,
      _BookSupText
}
