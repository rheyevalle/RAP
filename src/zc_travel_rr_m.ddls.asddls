@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection view'
@Metadata.allowExtensions: true

define root view entity ZC_TRAVEL_RR_M 
provider contract transactional_query
as projection on ZI_TRAVEL_RR_M
{
    key TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    AgencyId,
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    CustomerId,
    _Customer.LastName as CustomerName,
    BeginDate,
    EndDate,
    BookingFee,
    TotalPrice,
    CurrencyCode,
    Description,
    @ObjectModel.text.element: [ 'OverAllStatusText' ]
    OverallStatus,
    _Status._Text.Text as OverAllStatusText : localized,
   // CreatedBy,
    //CreatedAt,
    //LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking :redirected to composition child ZC_BOOK_RR_M ,
    _Currency,
    _Customer,
    _Status
}
