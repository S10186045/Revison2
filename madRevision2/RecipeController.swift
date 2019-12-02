//
//  RecipeController.swift
//  madRevision2
//
//  Created by MAD2_P01 on 2/12/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class RecipeController{
    
    

    
    func AddRecipe(recipe:Recipe){
        //refer to telegramme
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)!
        let cdRecipe = NSManagedObject(entity: entity, insertInto: context)
        
        cdRecipe.setValue(recipe.name, forKey: "name")
        cdRecipe.setValue(recipe.preparationTime, forKey:"preparationTime")
        
        //cdRecipe.name = recipe.name
        //cdRecipe.preparationTime = recipe.preparationTime
        
        appDelegate.saveContext()
        
    }
    
    func AddIngredientToRecipe(recipe:Recipe, ingredients:Ingredient){
        //refer to telegramme
    }
    
    func RetrieveRecipe()->[Recipe]{
        var recipe:[Recipe] = []
        return recipe
    }
    
    func RetrieveIngredientFromRecipe(recipe:Recipe)->[Ingredient]{
        //refer to telegramme
        var ingredient:[Ingredient] = []
        
        return ingredient
    }
    
}
