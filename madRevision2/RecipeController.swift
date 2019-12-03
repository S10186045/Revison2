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
        let entity = NSEntityDescription.entity(forEntityName: "CDRecipe", in: context)
        let cdRecipe = NSManagedObject(entity: entity!, insertInto: context)
        
        cdRecipe.setValue(recipe.name, forKey: "name")
        cdRecipe.setValue(recipe.preparationTime, forKey:"preparationTime")
        
        //cdRecipe.name = recipe.name
        //cdRecipe.preparationTime = recipe.preparationTime
        
        appDelegate.saveContext()
        
    }
    
    func AddIngredientToRecipe(recipe:Recipe, ingredient:Ingredient){
        //refer to telegramme
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CDIngredient", in: context)
    
        
        //Fetch Recipe
        let cdIngredient = NSManagedObject(entity: entity!, insertInto: context) as! CDIngredient
        cdIngredient.name = ingredient.name
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"CDRecipe")

        fetchRequest.predicate = NSPredicate(format: "name = %@", recipe.name!)
        do{
            let cdRecipe = try context.fetch(fetchRequest)
            let temp = cdRecipe[0] as! CDRecipe
            cdIngredient.addToRecipes(temp)
        }
        catch{
            print(error)
        }
        
        appDelegate.saveContext()
    }
    
    func RetrieveRecipe()->[Recipe]{
        var recipe:[Recipe] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        //Fetch Recipe
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"CDRecipe")
        do{
            let cdRecipe = try context.fetch(fetchRequest) as! [CDRecipe]
            for r in cdRecipe{
                recipe.append(Recipe(name: r.name!, preparationTime: r.preparationTime))
            }
        } catch{
            print(error)
        }
        
        return recipe
    }
    
    func RetrieveIngredientFromRecipe(recipe:Recipe)->[Ingredient]{
        //refer to telegramme
        var ingredient:[Ingredient] = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"CDIngredient")
        fetchRequest.predicate = NSPredicate(format: "ANY recipes.name = %@", recipe.name!)
        do{
            let cdIngredient = try context.fetch(fetchRequest) as! [CDIngredient]
            for r in cdIngredient{
                ingredient.append(Ingredient(name: r.name!))
            }
        } catch{
            print(error)
        }
        
        
        return ingredient
    }
    
}
