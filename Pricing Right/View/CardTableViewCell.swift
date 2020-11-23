//
//  CardTableViewCell.swift
//  Pricing Right
//
//  Created by Kevin Campbell on 11/23/20.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var sectorLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var clientSizelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
