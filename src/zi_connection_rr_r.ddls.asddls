@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection Interface CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo: {
    typeName: 'Connection',
    typeNamePlural: 'Connections'
  }

@Search.searchable: true

define view entity ZI_CONNECTION_RR_R
  as select from /dmo/connection as Connection
  association [1..*] to ZI_FLIGHT_REIRAP_R  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                        and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to ZI_CARRIER_REIRAP_R as _Carrier on  $projection.CarrierId = _Carrier.CarrierId
{
      @UI.facet: [{ id: 'Connection',
                    purpose: #STANDARD,
                    type: #IDENTIFICATION_REFERENCE,
                    position: 10,
                    label: 'Connection Detail'  },
                  { id: 'Flight',
                    purpose: #STANDARD,
                    type: #LINEITEM_REFERENCE,
                    position: 20,
                    label: 'Flights',
                    targetElement:'_Flight'  }
                    ]
      @UI.identification: [{ position: 10, label: 'Airline'  }]
      @UI.lineItem: [{ position: 10 }]
      @ObjectModel.text.association: '_Carrier'
      @Search.defaultSearchElement: true
  key carrier_id      as CarrierId,
      @UI.identification: [{ position: 20  }]
      @UI.lineItem: [{ position: 20 }]
      @Search.defaultSearchElement: true
  key connection_id   as ConnectionId,
      @UI.identification: [{ position: 30  }]
      @UI.lineItem: [{ position: 30 }]
      @UI.selectionField: [{ position: 10 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity: {
              name: 'ZI_AIRPORT_REIRAP_VH',
              element: 'AirportId' 
              } }]
      airport_from_id as AirportFromId,
      @UI.identification: [{ position: 40  }]
      @UI.lineItem: [{ position: 40 }]
      @UI.selectionField: [{ position: 20 }]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: 'ZI_AIRPORT_REIRAP_VH',
              element: 'AirportId'
          }
      }]
      airport_to_id   as AirportToId,
      @UI.identification: [{ position: 50  }]
      @UI.lineItem: [{ position: 60, label: 'Departure Time' }]
      departure_time  as DepartureTime,
      @UI.identification: [{ position: 60  }]
      @UI.lineItem: [{ position: 50, label: 'Arrival Time' }]
      arrival_time    as ArrivalTime,
      @UI.identification: [{ position: 70  }]
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      distance_unit   as DistanceUnit,
      // Association--->
      @Search.defaultSearchElement: true
      _Flight,
      @Search.defaultSearchElement: true
      _Carrier
}
