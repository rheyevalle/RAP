@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Projection view'
@Metadata.allowExtensions: true

define view entity ZC_BOOK_RR_M 
as projection on ZI_BOOK_RR_M
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _Booking_Status,
    _BookSuppl : redirected to composition child ZC_BOOKSUP_RR_M ,
    _Carrier,
    _Connection,
    _Customer,
    _Travel :redirected to parent ZC_TRAVEL_RR_M 
}
