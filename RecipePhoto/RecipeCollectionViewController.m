//
//  RecipeCollectionViewController.m
//  RecipePhoto
//
//  Created by Pierre Binon on 2017-01-29.
//  Copyright © 2017 Pierre Binon. All rights reserved.
//

#import "RecipeCollectionViewController.h"
#import "DetailViewController.h"
#import "Food.h"
#import "FoodCollection.h"


@class DetailViewController;




@interface RecipeCollectionViewController ()

//    NSArray *recipeImages;
@property (nonatomic) NSArray *foods;

@end




@implementation RecipeCollectionViewController

//static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.foods = [FoodCollection returnArrayOfFoods];
    
    //Add space between the two sections
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);

//=========================================================================================================================================================
//    self.foods = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];
    
    
//    recipeImages = [NSArray arrayWithObjects:@"angry_birds_cake.jpg", @"creme_brelee.jpg", @"egg_benedict.jpg", @"full_breakfast.jpg", @"green_tea.jpg", @"ham_and_cheese_panini.jpg", @"ham_and_egg_sandwich.jpg", @"hamburger.jpg", @"instant_noodle_with_egg.jpg", @"japanese_noodle_with_pork.jpg", @"mushroom_risotto.jpg", @"noodle_with_bbq_pork.jpg", @"starbucks_coffee.jpg", @"thai_shrimp_cake.jpg", @"vegetable_curry.jpg", @"white_chocolate_donut.jpg", nil];
//=========================================================================================================================================================
}




#pragma mark - prepareForSegue
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     if ([segue.identifier isEqualToString:@"showRecipePhoto"]) {
         NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
         
         // Get the new view controller using [segue destinationViewController].
         
         
         
         DetailViewController *detailViewController = segue.destinationViewController;
         NSIndexPath *indexPath = [indexPaths objectAtIndex: 0];
         
         // Pass the selected object to the new view controller.
         Food *foodselected = self.foods[indexPath.section][indexPath.row];
         
         detailViewController.foodImage = foodselected.image;
         detailViewController.recipeImageName = foodselected.descriptionFood;
         
//         detailViewController.foodImage = [self.foods objectAtIndex: indexPath.row];//.image];
//         detailViewController.recipeImageName = [self.foods objectAtIndex: indexPath.row];//.descriptionFood;
         // [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
     }
 }




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    //return arrayName.count;
    //return 1;
    return self.foods.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //return self.foods.count;
    //NSNumber *number = self.foods[section];
    //return [number integerValue];
    return [[self.foods objectAtIndex: section] count];
}


//Provides the data for the collection view cells
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    //recipeImageView.image = [self.foods objectAtIndex: indexPath.row];//.image;
    //recipeImageView.image = [UIImage imageNamed: [self.foods[indexPath.section] objectAtIndex: indexPath.row]];
    Food *foodselected = self.foods[indexPath.section][indexPath.row];
    recipeImageView.image = foodselected.image;
    
    return cell;
}


//Section title - For this don't forget to add an image view before the label!!!
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%li", indexPath.section + 1];
        headerView.title.text = title;
        
//        //Image stuff for the bottom...
//        UIImage *headerImage = [UIImage imageNamed:@"header_banner.png"];
//        headerView.backgroundImage.image = headerImage;
        
        reusableview = headerView;
    }
    
//    //More stuff for the footer...
//    if (kind == UICollectionElementKindSectionFooter) {
//        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
//        
//        reusableview = footerview;
//    }
    
    return reusableview;
}
















@end
