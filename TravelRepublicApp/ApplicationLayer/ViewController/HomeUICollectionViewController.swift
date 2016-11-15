//
//  HomeUICollectionViewController.swift
//  TravelRepublic
//
//  Created by Yue Chen on 16/11/10.
//  Copyright © 2016年 Yue Chen. All rights reserved.
//

import Foundation
import UIKit

protocol HomeUICollectionViewControllerDelegate: class {
    func updateUI(successful: Bool)
}

class HomeUICollectionViewController: UICollectionViewController, HomeUICollectionViewControllerDelegate {

    let cellIdentifier = "HolidayDealCell"
    
    var viewModel : HomeUICollectionViewControllerViewModel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewModel = HomeUICollectionViewControllerViewModel(delegate: self)
    }
    
    // Collection view controller data source
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfHolidayDeals()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
            for: indexPath) as! HolidayDealUICollectionViewCell
        cell.holidayDeal = viewModel.holidayDealAtIndex(index: indexPath)
        cell.updateViews()
        
        return cell
    }
    
    // Delegates
    func updateUI(successful: Bool) {
        if (successful) {
            collectionView?.reloadData()
            activityIndicator.stopAnimating()
        } else {
            let alertHandler = { (action:UIAlertAction!) -> Void in
                self.viewModel.loadData()
            }
            let alert = UIAlertController(title: TravelRepublicAppConstants.alertTitle, message: TravelRepublicAppConstants.alertContent, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: TravelRepublicAppConstants.alertButtonTitle, style: .default, handler: alertHandler))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
