import UIKit
import Kingfisher

class MovieCardView: UIView {
    var imageBackgroundURL: String? {
        didSet {
            setupView()
        }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .gray
        layer.cornerRadius = 20
        
        imageView.removeFromSuperview()
        
        addSubview(imageView)
        
        if let imgURL = imageBackgroundURL, let url = URL(string: imgURL) {
            imageView.kf.setImage(with: url)
        } else {
            backgroundColor = .yellow
        }
        imageView.layer.cornerRadius = 20 
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor ),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
