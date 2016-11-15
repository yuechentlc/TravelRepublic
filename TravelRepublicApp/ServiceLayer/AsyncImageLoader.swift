//
//  AsyncImageLoader.swift
//  TravelRepublicApp
//
//  Created by Yue Chen on 16/11/10.
//  Copyright © 2016年 Yue Chen. All rights reserved.
//

import Foundation
import UIKit

class AsyncImageLoader {
    
    // Load image for HolidayDeal
    static func loadImageForHolidayDeal (holidayDeal:HolidayDeal, onCompletion: @escaping  (Bool, UIImage) -> ()) {
        
        // cache image so that it is only downloaded once
        if (holidayDeal.backgroundImage != nil) {
            onCompletion(true, holidayDeal.backgroundImage!)
            return
        }
        
        DispatchQueue.global().async {
            do {
                var urlString = TravelRepublicAppConstants.imageBaseUrl
                urlString = urlString.replacingOccurrences(of: TravelRepublicAppConstants.idString, with: holidayDeal.id)
                urlString = urlString.replacingOccurrences(of: TravelRepublicAppConstants.typeString, with: holidayDeal.type)
                
                let imageUrl = URL(string: urlString)
                let data = try Data.init(contentsOf: imageUrl!)
                
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        onCompletion(true, image)
                    }
                }
                
            } catch {
                print("Error loading image from URL = \(error.localizedDescription)")
            }
        }
        
    }
}
