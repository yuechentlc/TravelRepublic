//
//  DataParser.swift
//  TravelRepublic
//
//  Created by Yue Chen on 16/11/10.
//  Copyright © 2016年 Yue Chen. All rights reserved.
//

import Foundation

class DataParser {
    
    // parse url data to HolidayDeal array
    static func parseHolidayDealsWithJsonData(data:Data) -> [HolidayDeal] {
        var resultArray : [HolidayDeal] = []
        
        do {
            let dict = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
            
            if let aggregates = dict["Aggregates"] as? Dictionary<String, Dictionary<String, Any>> {
               if let holidayDeals = aggregates["HotelsByChildDestination"] as? Dictionary<String, Dictionary<String, Any>> {
                    // Holiday deals in the array returned from POST call
                    for (id, content) in holidayDeals {
                        let holidayDeal = HolidayDeal()
                        
                        let idsArray = id.characters.split(separator: "|").map(String.init)
                        holidayDeal.type = idsArray[0]
                        holidayDeal.id = idsArray[1]
                        
                        for (title, details) in content {
                            switch title {
                            case "Title":
                                holidayDeal.title = details as! String
                            case "Count":
                                holidayDeal.count = details as! Int
                            case "MinPrice":
                                holidayDeal.minPrice = details as! Float
                            case "Position":
                                holidayDeal.position = details as! Int
                            default:
                                print("Unexpected content key = \(title)")
                            }
                        }
                        resultArray.append(holidayDeal)
                    }
                } else {
                    print("Parsing JSON data error at HotelsByChildDestination")
                }
            } else {
                print("Parsing JSON data error at Aggregates")
            }
        } catch {
            print("Parse JSON data error = \(error.localizedDescription)")
        }
        
        return resultArray.sorted(by: {$0.position < $1.position})
    }
}
