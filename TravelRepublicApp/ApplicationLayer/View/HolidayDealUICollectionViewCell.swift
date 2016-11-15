//
//  HolidayDealUICollectionViewCell.swift
//  TravelRepublicApp
//
//  Created by Yue Chen on 16/11/10.
//  Copyright © 2016年 Yue Chen. All rights reserved.
//

import Foundation
import UIKit

class HolidayDealUICollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    @IBOutlet weak var countLabel : UILabel!
    
    var holidayDeal : HolidayDeal = HolidayDeal()
    
    // called when cell needs update UI
    func updateViews () {
        titleLabel.font = UIFont(name: TravelRepublicAppConstants.titleFontName, size: TravelRepublicAppConstants.titleFontSize)
        titleLabel.text = holidayDeal.title.uppercased()
        priceLabel.text = holidayDeal.currencySymbol + String(format: "%.2f", holidayDeal.minPrice)
        countLabel.text = "(\(holidayDeal.count))"
        
        AsyncImageLoader.loadImageForHolidayDeal(holidayDeal: holidayDeal, onCompletion: self.imageLoadingCompletionHandler)
    }
    
    // after loading image, set it to background
    func imageLoadingCompletionHandler (successful:Bool, image:UIImage) {
        if (successful) {
            holidayDeal.backgroundImage = image
            (backgroundView as! UIImageView).image = image
            (backgroundView as! UIImageView).alpha = TravelRepublicAppConstants.imageAlpha
        }
    }
}
