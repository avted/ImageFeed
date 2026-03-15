import UIKit

final class ImagesListViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let mockImagesCount = 20
        static let tableViewContentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        static let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        
        static let likeOnImageName = "like_on"
        static let likeOffImageName = "like_off"
    }
    
    // MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Properties
    private let photoNames: [String] = Array(0..<Constants.mockImagesCount).map { "\($0)" }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = Constants.tableViewContentInset
    }
}

// MARK: - UITableViewDataSource
extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imageListCell, with: indexPath)
        
        return imageListCell
    }
}

// MARK: - UITableViewDelegate
extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photoNames[indexPath.row]) else {
            return 0
        }
        
        let imageViewWidth = tableView.bounds.width - Constants.imageInsets.left - Constants.imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + Constants.imageInsets.top + Constants.imageInsets.bottom
        return cellHeight
    }
}

// MARK: - Private Methods
private extension ImagesListViewController {
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let image = UIImage(named: photoNames[indexPath.row]) else {
            return
        }
        
        cell.cellImage.image = image
        cell.dateLabel.text = dateFormatter.string(from: Date())
        
        let isLiked = indexPath.row % 2 == 0
        let likeImage = isLiked ? UIImage(named: Constants.likeOnImageName) : UIImage(named: Constants.likeOffImageName)
        cell.likeButton.setImage(likeImage, for: .normal)
    }
}
