import UIKit

final class GradientView: UIView {
    
    // MARK: - Public Properties
    var gradientColor: UIColor = UIColor(red: 26/255.0, green: 27/255.0, blue: 34/255.0, alpha: 1.0) {
        didSet {
            updateColors()
        }
    }
    
    // MARK: - Private Properties
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    // MARK: - Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - Private Methods
    private func setupGradient() {
        updateColors()
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        layer.addSublayer(gradientLayer)
    }
    
    private func updateColors() {
        gradientLayer.colors = [
            gradientColor.withAlphaComponent(0.3).cgColor,
            gradientColor.withAlphaComponent(0.0).cgColor
        ]
    }
}
