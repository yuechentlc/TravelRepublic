//
//  TravelRepublicAppConstants.swift
//  TravelRepublicApp
//
//  Created by Yue Chen on 16/11/10.
//  Copyright © 2016年 Yue Chen. All rights reserved.
//

import Foundation
import UIKit

class TravelRepublicAppConstants {
    
    // cell size
    static var cellHeight : Float = 120.0
    static var cellWidth : Float = 160.0
    static var heightString : String = "120"
    static var widthString : String = "160"
    
    // cell title font
    static var titleFontName : String = "DINCondensed-Bold"
    static var titleFontSize : CGFloat = 25.0
    
    // url setting, string and json data for POST request
    static var connectionTimeout : Double = 10.0
    
    static var urlRequestString : String = "https://www.travelrepublic.co.uk/api/hotels/deals/search?fields=Aggregates.HotelsByChildDestination"
    
    static var requestJsonDictionary = ["CheckInDate":"2017-01-10T00:00:00.000Z",
                                        "Flexibility":3,
                                        "Duration":7,
                                        "Adults":2,
                                        "DomainId":1,
                                        "CultureCode":"en-gb",
                                        "CurrencyCode":"GBP",
                                        "OriginAirports":["LHR","LCY","LGW","LTN","STN","SEN"],
                                        "FieldFlags":8143571,
                                        "IncludeAggregates":true] as [String : Any]
    
    // url and data for background image
    static var imageBaseUrl : String = "https://d2f0rb8pddf3ug.cloudfront.net/api2/destination/images/getfromobject?id=\(TravelRepublicAppConstants.idString)&type=\(TravelRepublicAppConstants.typeString)&useDialsImages=true&width=\(TravelRepublicAppConstants.widthString)&height=\(TravelRepublicAppConstants.heightString)"
    
    static var idString : String = "YOUR_ID"
    static var typeString : String = "YOUR_TYPE"
    static var imageAlpha : CGFloat = 0.8
    
    // alert view text
    static var alertTitle : String = "Connection failed"
    static var alertContent : String = "Cannot download information from server, please retry."
    static var alertButtonTitle : String = "Retry"
    
}
