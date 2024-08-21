//
//  FoundRescueeTableViewCell.swift
//  BelocatedAlert
//
//  Created by RK on 21/08/24.
//

import UIKit

class FoundRescueeTableViewCell: UITableViewCell 
{
    @IBOutlet var rescueeCompletedStatusButton: UIButton!
    @IBOutlet var rescueeCompltedMessage: UILabel!
    @IBOutlet var rescueeCompletedMsgTwo: UILabel!
    @IBOutlet var rescueeCompletedDetailtext: UILabel!
    @IBOutlet var rescueeImage: UIImageView!
    @IBOutlet var rescueeName: UILabel!
    @IBOutlet var rescueeDetailsLabel: UILabel!
    @IBOutlet var rescueeDetailButton: UIButton!
    
    
    @IBOutlet var recueeDetailsView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        recueeDetailsView.applyGradient(hexColor1: "#FFFBE8", hexColor2: "#FFFFFF")
        recueeDetailsView.backgroundColor = .white
        recueeDetailsView.layer.cornerRadius = 16
        recueeDetailsView.layer.borderWidth = 1
        recueeDetailsView.layer.borderColor = UIColor().colorFromHexString("#FFCD00").cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
