//
//  FruitTableViewCell.swift
//  Fruit List
//
//  Created by Hayden Do on 5/09/19.
//  Copyright © 2019 Unitec. All rights reserved.
//

import UIKit

class FruitTableViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var fruitNameLabel: UILabel!
    @IBOutlet weak var fruitDescriptionLabel: UILabel!
    @IBOutlet weak var fruitPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(fruit: Fruit) {
        emojiLabel.text = fruit.emoji
        fruitNameLabel.text = fruit.name
        fruitDescriptionLabel.text = fruit.description
        fruitPriceLabel.text = "\(fruit.price)"
    }

}
