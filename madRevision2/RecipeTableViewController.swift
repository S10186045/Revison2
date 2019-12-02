//
//  RecipeTableViewController.swift
//  madRevision2
//
//  Created by MAD2_P01 on 2/12/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

class RecipeTableViewController : UITableViewController {
    
    var recipe:[Recipe] = []
    var ingredient:[Ingredient] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //Retrieve recipes and Ingredients from Core Data
        let recipeController:RecipeController = RecipeController()
        recipe = recipeController.RetrieveRecipe()
        ingredient = recipeController.RetrieveIngredientFromRecipe(recipe: recipe)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let recipeController:RecipeController = RecipeController()
        recipe = recipeController.RetrieveRecipe()
        
        //Retrieve recipes and Ingredients from Core Data
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView : UITableView, numberOfRowsInSection numberOfSection :Int) -> Int{
        //depending on recipe count
        return recipe.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipeController:RecipeController = RecipeController()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        ingredient = recipeController.RetrieveIngredientFromRecipe(recipe: recipe[indexPath.row])
    
       
        //need to add in textlabel
        cell.textLabel?.text = recipe[indexPath.row].name
        cell.detailTextLabel?.text = "???"
        
        var s = ""
        for ing in ingredient{
            s = ing.name! + ","
        }
        
        cell.detailTextLabel!.text! = s 
        
        return cell
    }
    
    
    
}
