import UIKit
import GoogleSignIn

struct ImageData: Codable {
    let imgName: String
}

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var btnMenu: UIButton!
    
    // MARK: - Properties
    var arrImg = [ImageData]()
    
    // MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJsonData()
        collView.delegate = self
        collView.dataSource = self
    }
}

// MARK: Button Click Event
extension ViewController {
    @IBAction func didTapMenu(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let profileAction = UIAlertAction(title: "Profile", style: .default) { _ in
    
            self.redirectToNextView(vcIdentifier: "profileVC")
        }
        
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { _ in
            
            GIDSignIn.sharedInstance.signOut()
            self.redirectToNextView(vcIdentifier: "LoginVC")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(profileAction)
        alertController.addAction(logoutAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UICollectionView Methods
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCell", for: indexPath) as! DataCell
        let data = arrImg[indexPath.item]
        cell.imgData.image = UIImage(named: data.imgName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailVC.city = arrImg[indexPath.item]
            present(detailVC, animated: true, completion: nil)
        }
    }
}

// MARK: - Private Helper Methods
extension ViewController {
    func loadJsonData() {
        guard let path = Bundle.main.path(forResource: "imageData", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            arrImg = try JSONDecoder().decode([ImageData].self, from: data)
        } catch {
            print("Error loading JSON data: \(error)")
        }
    }
}
