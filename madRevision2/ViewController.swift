//
//  ViewController.swift
//  madRevision2
//
//  Created by MAD2_P01 on 2/12/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtRecipe: UITextField!
    @IBOutlet weak var txtPreparationTime: UITextField!
    @IBOutlet weak var txtIngredient1: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        let recipeController:RecipeController = RecipeController()
        
        let recipe:Recipe = Recipe(name: txtRecipe.text!, preparationTime: Int16(txtPreparationTime.text!)!)
        
        let ingredient1:Ingredient = Ingredient(name: txtIngredient1.text!)
        
        recipeController.AddRecipe(recipe: recipe)
        recipeController.AddIngredientToRecipe(recipe: recipe, ingredients: ingredient1)
        
        txtRecipe.text = ""
        txtPreparationTime.text = ""
        txtIngredient1.text = ""
        
    }
    
    
    


}

