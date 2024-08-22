//
//  RescuerHistoryTableViewCell.swift
//  BelocatedAlert
//
//  Created by RK on 19/08/24.
//

import UIKit

class RescuerHistoryTableViewCell: UITableViewCell {

    @IBOutlet var rescuerProfileImage: UIImageView!
    @IBOutlet var resucerName: UILabel!
    @IBOutlet var resucerStatus: UILabel!
    @IBOutlet var callButton: UIButton!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var viewLoactionButton: UIButton!
    @IBOutlet var locationDistance: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var scannedDateAndTimeLabel: UILabel!
    
    //Constant Headeing Label Outlets
    @IBOutlet var message: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var scannedOn: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UpdateUi()
        messageLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension RescuerHistoryTableViewCell
{
    func RescuerHistoryCollapsed()
    {
        messageLabel.isHidden = true
        viewLoactionButton.isHidden = true
        locationDistance.isHidden = true
        addressLabel.isHidden = true
        scannedDateAndTimeLabel.isHidden = true
        message.isHidden = true
        location.isHidden = true
        scannedOn.isHidden = true
        
        // Trigger layout updates to adjust the cell's height
          self.setNeedsLayout()
          self.layoutIfNeeded()
          
          // If this cell is inside a table view, ensure the table view updates its layout
          if let tableView = self.superview as? UITableView {
              tableView.beginUpdates()
              tableView.endUpdates()
          }
    }
     func UpdateUi()
    {
        messageLabel.isHidden = false
        viewLoactionButton.isHidden = false
        locationDistance.isHidden = false
        addressLabel.isHidden = false
        scannedDateAndTimeLabel.isHidden = false
        message.isHidden = false
        location.isHidden = false
        scannedOn.isHidden = false
    }
}
