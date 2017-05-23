//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    let planetCellIdentifier = "PlanetCell"
    var planets: [Planet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generatePlanetInfo()
    }
    
    func generatePlanetInfo() {
        planets.append(Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a god.", "Earth has a powerful magnetic field.", "Earth was once believed to be the center of the universe."]))
        planets.append(Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.", "Mars is home to the tallest mountain in the solar system.", "Pieces of Mars have fallen to Earth."]))
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as! PlanetTableViewCell
        let planet = planets[indexPath.row]
        cell.nameLabel.text = planet.name
        cell.moonLabel.text = planet.numberOfMoons != 1 ? "\(planet.numberOfMoons) Moons" : "\(planet.numberOfMoons) Moon"
        cell.orbitLabel.text = "\(planet.fullOrbit) days (full orbit)"
        cell.numFactsLabel.text = planet.facts.count != 1 ? "\(planet.facts.count) facts" : "\(planet.facts.count) fact"
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? FactTableViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
        destVC.planet = planets[indexPath.row]
    }
}
