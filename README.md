# Gilded Rose
Clean Code BootCamp



# Problem Statement

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a<br/>
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.<br/>
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We<br/>
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named<br/>
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that<br/>
we can begin selling a new category of items. First an introduction to our system:



All items have a SellIn value which denotes the number of days we have to sell the item<br/>
All items have a Quality value which denotes how valuable the item is<br/>
At the end of each day our system lowers both values for every item<br/>


Pretty simple, right? Well this is where it gets interesting:<br/>
Once the sell by date has passed, Quality degrades twice as fast<br/>
The Quality of an item is never negative<br/>
"Aged Brie" actually increases in Quality the older it gets<br/>
The Quality of an item is never more than 50<br/>
"Sulfuras", being a legendary item, never has to be sold or decreases in Quality<br/>
"Backstage passes", like aged brie, increases in Quality as its SellIn value approaches<br/>
Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less<br/>
Quality drops to 0 after the concert<br/>

"Conjured" items degrade in Quality twice as fast as normal items
