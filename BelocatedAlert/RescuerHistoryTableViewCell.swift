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
        messageLabel.numberOfLines = 0 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
