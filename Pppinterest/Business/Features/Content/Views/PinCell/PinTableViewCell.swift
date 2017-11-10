//
//  PinTableViewCell.swift
//  Pppinterest
//
//  Created by Alya Filon on 10.11.17.
//  Copyright © 2017 Alya Filon. All rights reserved.
//

import UIKit
import SDWebImage

class PinTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var noteLabel: UILabel!
    @IBOutlet var placeholderView: UIView!

    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        placeholderView.decorator.apply(Style.roundCorners(5))
        photoImageView.decorator.apply(Style.roundCorners(5))
    }
}

// MARK: - Public Methods

extension PinTableViewCell {
    
    func fill(withPin pin: Pin) {
        
        noteLabel.text = pin.note
        photoImageView.sd_setImage(with: URL(string: pin.image?.url ?? ""), placeholderImage: R.image.photoPlaceholder())
    }
}
