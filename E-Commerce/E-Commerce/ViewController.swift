//
//  ViewController.swift
//  E-Commerce
//
//  Created by Anshika Pathak on 15/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var seachBar: UISearchBar!
    
    var filteredVegetableLabel = [String]()
       var filteredDescriptions = [String]()
    let vegetableImage = ["Image", "Image 8", "Image 7", "Image 6", "Image 5", "Image 4", "Image 3" ,"Image 2", "Image 1"]
    let vegetableLabel = ["Tomato", "carrot", "Masgroom", "onion" , "Pumpkin", "beetroot", "Cauliflower", "cabbage", "potato"]
    let descriptions = [
        "Tomato: Red, edible berry.",
        "Carrot: Orange root vegetable.",
        "Mushroom: Fleshy fungus fruiting body.",
        "Onion: Bulb vegetable of genus Allium.",
        "Pumpkin: Round squash cultivar.",
        "Beetroot: Red taproot of beet plant.",
        "Cauliflower: Leafy green vegetable.",
        "Cabbage: Dense-leaved vegetable.",
        "Potato: Starchy tuber of Solanum tuberosum."
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredVegetableLabel = vegetableLabel
               filteredDescriptions = descriptions
        // Do any additional setup after loading the view.
    }
    func handleAddToCart() {
        // Create UIAlertController instance
        let alert = UIAlertController(title: "Added Successfully Item", message: nil, preferredStyle: .alert)

        // Create UIAlertAction instance
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)

        // Add action to UIAlertController
        alert.addAction(action)

        // Present UIAlertController
        present(alert, animated: true, completion: nil)
    }

}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vegetableImage.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vegetableViewCellTableViewCell", for: indexPath) as! vegetableViewCellTableViewCell
       let image = UIImage(named: vegetableImage[indexPath.row])
        let title = vegetableLabel[indexPath.row]
        let decription = descriptions[indexPath.row]
        cell.configure(title: title, decription: decription, image: image)
        cell.buttonTapped = { [weak self] in
            self?.handleAddToCart()
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchTextLowercased = searchText.lowercased()
        if searchTextLowercased.isEmpty {
            filteredVegetableLabel = vegetableLabel
            filteredDescriptions = descriptions
        } else {
            filteredVegetableLabel = vegetableLabel.filter { $0.lowercased().contains(searchTextLowercased) }
            filteredDescriptions = descriptions.filter { $0.lowercased().contains(searchTextLowercased) }
        }
        tableView.reloadData()
    }
}
