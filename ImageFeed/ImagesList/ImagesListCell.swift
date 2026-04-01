import UIKit

final class ImagesListCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    
    // MARK: - Constants
    static let reuseIdentifier = "ImagesListCell"
}
