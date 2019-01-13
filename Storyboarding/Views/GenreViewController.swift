//
//  newViewController.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/10/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var isExpanded: Bool = true
    
    let genreArray = [
        "Placeholder",
        "Adventure",
        "Horror",
        "Romance",
        "Sci-Fi",
        "Mystery"
    ]
    
    let genreDescription = [
        "Placeholder",
        "Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure DescriptionAdeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description",
        "Horror Description",
        "Romance Description",
        "Sci-Fi Description",
        "Mystery Description"
    ]
    
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    var genreTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // navigation bar attributes
        navigationItem.title = "Storyboarding"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem?.tintColor = .white
        view.backgroundColor = .white

        // Initialize frame components of the tableview
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        // create and add tableview to the view
        genreTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight))
        genreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "normalCell")
        genreTableView.separatorColor = .black
        genreTableView.delegate = self
        genreTableView.dataSource = self
//        genreTableView.rowHeight = UITableView.automaticDimension
        self.view.addSubview(genreTableView)

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
//        return genreArray.count
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        cell.textLabel?.text = genreDescription[indexPath.section]
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.sizeToFit()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // in order to have the resize work i need access to the cell's textlabel
        // can't access the cell bc its not even created yet
        return 250
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // section header view for tableView
        let headerView = UIView()
        let headerFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 70)
        headerView.frame = headerFrame

        // section header label for tableView
        let headerLabelFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width / 2, height: 70)
        let headerLabel = UILabel()
        headerLabel.frame = headerLabelFrame
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 25)
        headerView.addSubview(headerLabel)
        
        // button in header for tableView
        let expandButton = UIButton(type: .system)
        expandButton.setTitle(isExpanded ? "Close" : "Expand", for: .normal)
        expandButton.titleLabel?.font = UIFont(name: "GillSans-Light", size: 20)
        expandButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        expandButton.sizeToFit()
        expandButton.tintColor = .black
        expandButton.frame.origin = CGPoint(x: tableView.frame.size.width - 70, y: 20)
        headerView.addSubview(expandButton)

        // Separates Header from regular sections
        if section == 0 {
            headerLabel.text = "Genres"
            headerLabel.frame.origin = CGPoint(x: tableView.frame.size.width / 4, y: 0)
            expandButton.isHidden = true
            expandButton.isEnabled = false
        } else {
            headerLabel.text = genreArray[section]
            headerView.backgroundColor = UIColor.lightGray
        }
        return headerView
    }
    
    @objc func buttonTapped(button: UIButton) {
        isExpanded = !isExpanded
        button.setTitle(isExpanded ? "Close" : "Expand", for: .normal)
        button.sizeToFit()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     let headerHeight: CGFloat = 70
        return headerHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return genreArray.count
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
