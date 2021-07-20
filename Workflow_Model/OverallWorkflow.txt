#@begin DataCleaningNYPL @desc Workflow for cleaning NYPL Menus public Dataset for menus

#@in Menu.csv @uri file://Raw_Dataset/Menu.csv
#@in MenuItem.csv @uri file://Raw_Dataset/MenuItem.csv
#@in MenuPage.csv @uri file://Raw_Dataset/MenuPage.csv
#@in Dish.csv @uri file://Raw_Dataset/Dish.csv

	#@begin OpenRefineCleanMenu @desc Use Openrefine to clean Menu.csv file
	#@in Menu.csv @uri file://Raw_Dataset/Menu.csv
	#@out CleanedMenu.csv @uri file://Cleaned_Dataset/CleanedMenu.csv
	#@end OpenRefineCleanMenu

	
	#@begin OpenRefineCleanMenuItem @desc Use Openrefine to clean MenuItem.csv file
	#@in MenuItem.csv @uri file://Raw_Dataset/MenuItem.csv
	#@out CleanedMenuItem.csv @uri file://Cleaned_Dataset/CleanedMenuItem.csv
	#@end OpenRefineCleanMenuItem
	
	#@begin OpenRefineCleanMenuPage @desc Use Openrefine to clean MenuPage.csv file
	#@in MenuPage.csv @uri file://Raw_Dataset/MenuPage.csv
	#@out CleanedMenuPage.csv @uri file://Cleaned_Dataset/CleanedMenuPage.csv
	#@end OpenRefineCleanMenuPage
	
	#@begin OpenRefineCleanDish @desc Use Openrefine to clean Dish.csv file
	#@in Dish.csv @uri file://Raw_Dataset/Dish.csv
	#@out CleanedDish.csv @uri file://Cleaned_Dataset/CleanedDish.csv
	#@end OpenRefineCleanDish

	#@begin SQLiteDataloaderOperationsMenu @desc Use Sql loading scripts to load ClenedMenu.csv into DB
	#@in CleanedMenu.csv @uri file://Cleaned_Dataset/CleanedMenu.csv
        #@param DataloaderscriptMenu
	#@out Cleaned_Menu @uri sqlite://database.db/Cleaned_Menu
	#@end SQLiteDataloaderOperationsMenu
	
	#@begin SQLiteDataloaderOperationsMenuItem @desc Use Sql loading scripts to load ClenedMenuItem.csv into DB
	#@in CleanedMenuItem.csv @uri file://Cleaned_Dataset/CleanedMenuItem.csv
        #@param DataloaderscriptMenuItem
	#@out Cleaned_MenuItem @uri sqlite://database.db/Cleaned_MenuItem
	#@end SQLiteDataloaderOperationsMenuItem
	
	#@begin SQLiteDataloaderOperationsMenuPage @desc Use Sql loading scripts to load ClenedMenuPage.csv into DB
	#@in CleanedMenuPage.csv @uri file://Cleaned_Dataset/CleanedMenuPage.csv
        #@param DataloaderscriptMenuPage
	#@out Cleaned_MenuPage @uri sqlite://database.db/Cleaned_MenuPage
	#@end SQLiteDataloaderOperationsMenuPage
	
	#@begin SQLiteDataloaderOperationsDish @desc Use Sql loading scripts to load ClenedDish.csv into DB
	#@in CleanedDish.csv @uri file://Cleaned_Dataset/CleanedDish.csv
        #@param DataloaderscriptDish
	#@out Cleaned_Dish @uri sqlite://database.db/Cleaned_Dish
	#@end SQLiteDataloaderOperationsDish

	#@begin SQLConstraintCheck @desc Use Sqlite to check constraints and discard the problematic rows
	#@param CheckConstraintScript
	#@in Cleaned_Menu
	#@in Cleaned_MenuItem
	#@in Cleaned_MenuPage
	#@in Cleaned_Dish
	#@out final_output_menu
	#@out final_output_menu_item
	#@out final_output_menu_page
	#@out final_output_dish
	#@end SQLContraintCheck 


#@out final_output_menu @uri sqlite://database.db/final_output_menu
#@out final_output_menu_item @uri sqlite://database.db/final_output_menu_item
#@out final_output_menu_page @uri sqlite://database.db/final_output_menu_page
#@out final_output_dish @uri sqlite://database.db/final_output_dish

#@end DataCleaningNYPL

