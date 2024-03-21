//
//  donationPagesCellTableViewCell.swift
//  geeve
//
//  Created by Dev Navadiya on 14/03/24.
//

import UIKit

class donationPagesCellTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var age: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
