@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Projection view'
@Metadata.allowExtensions: true
define view entity ZC_BOOKSUP_RR_M 
as projection on ZI_BOOKSUP_RR_M
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    @ObjectModel.text.element: [ 'SuppDesc' ]
    SupplementId,
    _BookSupText.Description as SuppDesc: localized,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent  ZC_BOOK_RR_M ,
    _BookSuppl,
    _BookSupText,
    _Travel : redirected to ZC_TRAVEL_RR_M 
}
