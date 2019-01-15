//
//  newViewController.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/10/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let genreTopics = [
        "Adventure",
        "Horror",
        "Romance",
        "Sci-Fi",
        "Mystery"
    ]
    
    var genreDescription = [
        Expandables(expanded: false, descriptions: ["Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure Description Adeventure DescriptionAdeventure Description Adeventure Description Adeventure Description"]),
        Expandables(expanded: false, descriptions: ["Horror Description, Horror Description"]),
        Expandables(expanded: false, descriptions: ["Romance Description"]),
        Expandables(expanded: false, descriptions: ["Sci-Fi Description"]),
        Expandables(expanded: false, descriptions: ["Mystery Description"])
    ]
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    var genreTableView: UITableView!
    var sectionView: UIView!
    var sectionLabel: UILabel!
    var expandButton: UIButton!
    var headerView: UIView!
    var headerViewFrame: CGRect!
    var headerLabel: UILabel!
    var headerLabelFrame: CGRect!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation bar attributes
        navigationItem.title = "Storyboarding"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        // Creates header view
        headerViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 75)
        headerView = UIView(frame: headerViewFrame)
        headerView.backgroundColor = .lightGray
        view.addSubview(headerView)
        
        headerLabelFrame = CGRect(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height)
        headerLabel = UILabel(frame: headerLabelFrame)
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        headerLabel.text = "Genres"
        headerView.addSubview(headerLabel)

        // Initialize frame components of the tableview
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        // create and add tableview to the view
        genreTableView = UITableView(frame: CGRect(x: 0, y: headerViewFrame.height, width: displayWidth, height: displayHeight))
        genreTableView.estimatedRowHeight = 200
        genreTableView.rowHeight = UITableView.automaticDimension
        genreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "normalCell")
        genreTableView.separatorColor = .clear
        genreTableView.delegate = self
        genreTableView.dataSource = self
        self.view.addSubview(genreTableView)

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if genreDescription[section].expanded {
            return 1
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        let pathName = genreDescription[indexPath.section].descriptions
        cell.textLabel?.text = pathName[0]
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.sizeToFit()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let elementVC = ElementsViewController()
        elementVC.genreString = genreTopics[indexPath.section]
        self.navigationController?.pushViewController(elementVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // section header view for tableView
        
        // TODO: Make Custom class for UIView, don't know how to access my tableview through the new class though
                
        sectionView = UIView()
        let sectionFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 70)
        sectionView.frame = sectionFrame

        // section header label for tableView
        let sectionLabelFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width / 2, height: 70)
        sectionLabel = UILabel()
        sectionLabel.frame = sectionLabelFrame
        sectionLabel.textAlignment = .center
        sectionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        sectionLabel.text = genreTopics[section]
        sectionView.addSubview(sectionLabel)
        
        // button in header for tableView
        let expanded = genreDescription[section].expanded
        expandButton = UIButton(type: .system)
        expandButton.setTitle(expanded ? "Close" : "Expand", for: .normal)
        expandButton.titleLabel?.font = UIFont(name: "GillSans-Light", size: 20)
        expandButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        expandButton.sizeToFit()
        expandButton.tintColor = .black
        expandButton.frame.origin = CGPoint(x: tableView.frame.size.width - 70, y: 20)
        expandButton.tag = section
        sectionView.addSubview(expandButton)
        
        // make header clickable
//        let tapGesture = CustomGestureRecognizer(target: self, action: #selector(headerTapped(gesture:)), myView: sectionView)
//        sectionView.addGestureRecognizer(tapGesture)
//        sectionView.isUserInteractionEnabled = true
        
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     let headerHeight: CGFloat = 70
        return headerHeight
    }
    
    // add separators for sections
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        tableView.separatorInset.left = 5
        tableView.separatorInset.right = 15
        let footerView = UIView()
        let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y: footerView.frame.height, width: tableView.frame.width - tableView.separatorInset.right, height: 0.5))
        separatorView.backgroundColor = .black
        footerView.addSubview(separatorView)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return genreTopics.count
    }
    
    /* Plan was to make sectionView(UIView) section clickable, but don't know how to do that.
     Tried: UITapGestureRecognizor(both normal and custom)
     touchesBegan
     Should just use cells themselves for clicking
     */
    @objc func headerTapped(gesture: CustomGestureRecognizer) {
        print("tapped")
        gesture.myView?.backgroundColor = .yellow
        
        //        if let header = gesture.view {
        //            if gesture.state == .began {
        //                header.backgroundColor = .black
        //            }
        //            if gesture.state == .ended {
        //                header.backgroundColor = .white
        //            }
        //        }
    }
    
    // action to expand or collapse sections
    @objc func buttonTapped(button: UIButton) {
        
        var indexPaths = [IndexPath]()
        let section = button.tag
        let expanded = !genreDescription[section].expanded
        genreDescription[section].expanded = expanded
        button.setTitle(expanded ? "Close" : "Expand", for: .normal)
        button.sizeToFit()
        for row in genreDescription[section].descriptions.indices {
            let path = IndexPath(row: row, section: section)
            indexPaths.append(path)
        }
        if !expanded {
            genreTableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            genreTableView.insertRows(at: indexPaths, with: .fade)
        }
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
