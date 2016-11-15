//
//  AsyncPostServiceHandler.swift
//  TravelRepublic
//
//  Created by Yue Chen on 16/11/10.
//  Copyright © 2016年 Yue Chen. All rights reserved.
//

import Foundation

class AsyncPostRequestHandler {
    
    static var requestUrl = URL(string: TravelRepublicAppConstants.urlRequestString)
    
    static var jsonDict:Dictionary = TravelRepublicAppConstants.requestJsonDictionary

    // load data from URL and convert it to HolidayDeal array
    static func loadDataFromPostRequest (onCompletion: @escaping  (Bool, [HolidayDeal]) -> ()) {
        var result : [HolidayDeal] = []
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: AsyncPostRequestHandler.jsonDict, options: .prettyPrinted)
            var postRequest = URLRequest(url: AsyncPostRequestHandler.requestUrl!)
            
            postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            postRequest.setValue("application/json", forHTTPHeaderField: "Accept")
            postRequest.httpMethod = "POST"
            postRequest.httpBody = jsonData
            postRequest.timeoutInterval = TravelRepublicAppConstants.connectionTimeout
            
            let task = URLSession.shared.dataTask(with: postRequest) { (data:Data?, response:URLResponse?, error:Error?) in
                
                guard let responseData = data, error == nil else {
                    print("There is a networking error = \(error?.localizedDescription)")
                    
                    DispatchQueue.main.async {
                        onCompletion(false, result)
                    }
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("Unexpected statusCode = \(httpStatus.statusCode)")
                    print("response = \(response)")
                    
                    DispatchQueue.main.async {
                        onCompletion(false, result)
                    }
                } else {
                    result = DataParser.parseHolidayDealsWithJsonData(data: responseData)
                    DispatchQueue.main.async {
                        onCompletion(true, result)
                    }
                }
            }
            task.resume()
        } catch {
            print("Convert to Json data error: \(error.localizedDescription)")
        }
    }
}
