//
//  ViewController.swift
//  tableViewLearn
//
//  Created by Levan Loladze on 30.10.23.
//

import UIKit

class ViewController: UIViewController, SongNameDelegate {

    private var tableView: UITableView!
    var songs: [Song] = []
    
    private let addBtn: UIButton = {
        let button = UIButton()
        button.setTitle("add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        songs = fetchData()
        setupAddBtn()
        setupTableView()
        setupButtonActions()
    }
    
    func didEnterSongName(name: String) {
        let createdSong = Song(image: Images.quasimoto!, title: name)
        songs.append(createdSong)
        tableView.reloadData()
    }

    private func setupButtonActions() {
        addBtn.addAction(UIAction(
            title: "",
            handler: { [weak self] action in
                let addNewController = AddNewItemToListViewController()
                addNewController.delegate = self
                self?.navigationController?.pushViewController(addNewController, animated: true)
            }
        ),
        for: .touchUpInside)
    }
    
    private func setupTableView() {
        initTableView()
        setTableViewConstraints()
        registerTableViewCells()
    }
    
    
    
    func setupAddBtn() {
        view.addSubview(addBtn)
        
        NSLayoutConstraint.activate([
            addBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            addBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func initTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerTableViewCells() {
        tableView.register(songCell.self, forCellReuseIdentifier: "songCell")
    }
    
    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: addBtn.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as! songCell
        let song = songs[indexPath.row]
        cell.set(song: song)
        
        return cell
    }
}



extension ViewController: UITableViewDelegate {
    
}



extension ViewController {
    
    
    func fetchData() -> [Song] {
        let song1 = Song(image: Images.quasimoto!, title: "quasimoto")
        let song2 = Song(image: Images.quasimoto!, title: "lela")
        let song3 = Song(image: Images.quasimoto!, title: "help")
        let song4 = Song(image: Images.quasimoto!, title: "pugachova")
        let song5 = Song(image: Images.quasimoto!, title: "levanikoMC")
        let song6 = Song(image: Images.quasimoto!, title: "OGLOCE")
        
        return [song1,song2,song3,song4,song5,song6]
    }
}
