//
//  HomeUICollectionViewControllerViewModel.swift
//  TravelRepublic
//
//  Created by Yue Chen on 16/11/10.
//  Copyright © 2016年 Yue Chen. All rights reserved.
//

import Foundation

class HomeUICollectionViewControllerViewModel {
    
    var holidayDeals : [HolidayDeal] = []
    weak var updateDelegate : HomeUICollectionViewControllerDelegate!
    
    init (delegate:HomeUICollectionViewControllerDelegate) {
        updateDelegate = delegate
        loadData()
    }
    
    func loadData() {
        AsyncPostRequestHandler.loadDataFromPostRequest(onCompletion: self.completionHandler)
    }
    
    func numberOfHolidayDeals () -> Int {
        return holidayDeals.count
    }
    
    func holidayDealAtIndex(index:IndexPath) -> HolidayDeal {
        return numberOfHolidayDeals() > index.row ? holidayDeals[index.row] : HolidayDeal()
    }
    
    func completionHandler (successful:Bool, data:[HolidayDeal]) {
        holidayDeals = data
        updateDelegate.updateUI(successful: successful)
    }
}
