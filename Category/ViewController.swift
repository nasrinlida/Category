//
//  ViewController.swift
//  Category
//
//  Created by nasrinlida on 3/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBarParentView: UIView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let imageArray = ["image1", "image2", "image3", "image4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Registering custom cell to the parent view controller
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        let image = UIImage(named: "hungryLogoWhite")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 16, height: 12.8)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        
        
        //Placing SEARCH icon in the textfield
        let searchIcon = UIImageView()
        searchIcon.image = UIImage(named: "search")
        let contentView = UIView()
        contentView.addSubview(searchIcon)
        contentView.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
        searchIcon.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        searchTextField.leftView = contentView
        searchTextField.leftViewMode = .always
        searchTextField.clearButtonMode = .whileEditing
        
        
        //Placing FILTER icon in the textfield
        let filterIcon = UIImageView()
        filterIcon.image = UIImage(named: "filter")
        
        let filterContentView = UIView()
        filterContentView.addSubview(filterIcon)
        filterContentView.frame = CGRect(x: 89, y: -5, width: 70, height: 70)
        filterIcon.frame = CGRect(x: 89, y: -5, width: 70, height: 70)
        searchTextField.rightView = filterContentView
        searchTextField.rightViewMode = .always
        searchTextField.clearButtonMode = .whileEditing
        
        
        
        //MARK: kano hoilona ei view a, pore practice korbo notun x, y position er value diye
        
//        searchTextField.clearButtonMode = .whileEditing
        
//        searchBarParentView.addSubview(searchIcon)
//        searchIcon.frame = CGRect(x: 0, y: 0, width: UIImage(named: "search")!.size.width, height: UIImage(named: "search")!.size.height)
//
//        searchTextField.leftView = searchBarParentView
//        searchTextField.leftViewMode = .always
//        searchTextField.clearButtonMode = .whileEditing
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.myImageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    
    
}

