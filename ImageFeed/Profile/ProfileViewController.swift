import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let userImageName = "avatar"
        static let logoutIconName = "ipad.and.arrow.forward"
        static let colorWhite = "YP White"
        static let colorGray = "YP Gray"
        static let colorRed = "YP Red"
        
        static let headlineFontSize: CGFloat = 23
        static let standardFontSize: CGFloat = 13
    }
    
    private enum MockData {
        static let name = "Екатерина Новикова"
        static let login = "@ekaterina_nov"
        static let description = "Hello, world!"
    }
    
    // MARK: - UI Elements
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    private var loginLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var logoutButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
        setupConstraints()
    }
    
    // MARK: - Create Views
    private func createViews() {
        createImageView()
        createNameLabel()
        createLoginLabel()
        createGreetingLabel()
        createLogoutButton()
    }
    
    private func createImageView() {
        let profileImage = UIImage(named: Constants.userImageName)
        imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
    }
    
    private func createNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = MockData.name
        nameLabel.textColor = UIColor(named: Constants.colorWhite)
        nameLabel.font = UIFont.boldSystemFont(ofSize: Constants.headlineFontSize)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
    }
    
    private func createLoginLabel() {
        loginLabel = UILabel()
        loginLabel.text = MockData.login
        loginLabel.textColor = UIColor(named: Constants.colorGray)
        loginLabel.font = UIFont.systemFont(ofSize: Constants.standardFontSize)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)
    }
    
    private func createGreetingLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.text = MockData.description
        descriptionLabel.textColor = UIColor(named: Constants.colorWhite)
        descriptionLabel.font = UIFont.systemFont(ofSize: Constants.standardFontSize)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
    }
    
    private func createLogoutButton() {
        logoutButton = UIButton(type: .system)
        let icon = UIImage(systemName: Constants.logoutIconName)
        
        logoutButton.setImage(icon, for: .normal)
        logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
        
        logoutButton.tintColor = UIColor(named: Constants.colorRed)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
    }
    
    // MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            loginLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            logoutButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logoutButton.widthAnchor.constraint(equalToConstant: 44),
            logoutButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Actions
    @objc private func didTapLogoutButton() {
        //logout
    }
}
