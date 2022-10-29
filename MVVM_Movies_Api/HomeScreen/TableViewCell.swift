//
//  TableViewCell.swift
//  tableView
//
//  Created by Anıl AVCI on 22.10.2022.
//

import UIKit
import Foundation

class TableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: PosterImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(movie: MovieResult) {
        posterImageView.downloadImage(movie: movie)
        titleLabel.text = movie.title
        dateLabel.text = movie.overview
        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelDownloading()
    }

}
