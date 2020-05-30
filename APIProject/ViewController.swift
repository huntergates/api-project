
import UIKit
import Alamofire
import SDWebImage
import SnapKit


class ViewController: UIViewController {
    
//    private let backgroundView = UIView().then {
//        $0.backgroundColor = .white
//        $0.cornerRadius = 5.0
//    }
    
    private let photoTitle = UILabel()
    
    private let photoDate = UILabel()
    
    private let photoImageView = UIImageView()
    
    private let photoDescription = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupViewsWithSnapKit()
        
        NetworkServices.getPhotos { data in
           
            self.photoTitle.text = data["title"] as? String
            self.photoDate.text = data["date"] as? String
            self.photoDescription.text = data["explanation"] as? String
            self.photoImageView.sd_setImage(with: URL(string: data["url"] as! String), placeholderImage: UIImage())
        }
    }
    
    func setupViews() {
        view.addSubview(photoTitle)
        photoTitle.translatesAutoresizingMaskIntoConstraints = false
        photoTitle.textAlignment = .center
        photoTitle.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 28.0)
        photoTitle.text = "Mango"
        let margins = view.layoutMarginsGuide
        photoTitle.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        photoTitle.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        photoTitle.topAnchor.constraint(equalTo: margins.topAnchor, constant: 50).isActive = true
    }
    func setupViewsWithSnapKit() {
        view.addSubview(photoDate)
        view.addSubview(photoDescription)
        view.addSubview(photoImageView)
        photoDate.textAlignment = .center
        photoDate.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 24.0)
        photoDate.text = "Mango"
        photoDate.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(photoTitle.snp.bottom).offset(20)
        }
        photoDescription.textAlignment = .center
        photoDescription.font = UIFont(name: "TimesNewRomanPS-BoldItalicMT", size: 17.0)
        photoDescription.text = "Mango"
        photoDescription.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(20)
        }
        photoImageView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(photoImageView.snp.width)
            make.top.equalTo(photoDate.snp.bottom).offset(20)
        }
    }
    
}

