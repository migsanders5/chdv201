/*DIRECTIONS PLEASE READ:
The purpose of this do file is to introduce you to basic descriptive data visualization in Stata!
Before running these commands, make sure you have loaded the dataset and recoded any variables you want to recode.
For simplicity I will be using existing, un-recoded variables in the dataset.
Read the comments and run each code one by one (by highlighting the line of code and clicking execute (the button with the arrow pointing right). Stata only runs one graph at a time, so if you simply click do, it will run the whole do file and you'll only see the final graph. */

***Creating a Bar Graph***
	*Bar graphs are a good way to visualize the distribution of a categorical variable. 
	
		*to graph the variable degree in a bar chart, use the following command. 
		/*note that (percent) tells stata you want the bars to represents the percent of the observations in
		each category. You can also use (frequency) to get raw numbers.*/
		
		graph bar (percent), over(degree)
		
		/* I encourage you to read the help file for the command graph bar to familiarize yourself with the options.*/
		
		help graph bar
		
		**returning to our bar graph, you can change the titles of the  y axis and overall graph
		
		graph bar (percent) , over(degree) ytitle("Percent") title("Distribution of Educational Attainment") 
		
		**you can use an if statement to limit your bar graph to one population, for example people under 25
		
		graph bar (percent) if age<25 , over(degree) ytitle("Percent") title("Distribution of Educational Attainment")
		
		**you can add a note to the graph to tell readers that you are looking only at ages below 25 or adjust the title.
		
		graph bar (percent) if age<25 , over(degree) ytitle("Percent") title("Distribution of Educational Attainment for Adults Under 25") note("GSS Data from 2018, 2021. Adults under 25 only.")
		

		
***Creating Pie Charts****
	**Bar charts are another way to show the distribution of a categorical variable. Let's stick to the variable degree
	
	graph pie , over(degree) 
	
	**it might be useful to label the slices
	
	graph pie , over(degree)  plabel( _all percent , format(%3.2g))

	**again you can limit your pie chart to one population using an if statement
	**the following code gives us a pie chart of degree attainment just for women, I am also adding a title
	
	graph pie if sex==1 , over(degree)  plabel( _all percent , format(%3.2g)) title("Women's Educational Attainment") note("GSS 2018 and 2021 data.")
	
****Histograms
	**For continuous variables, show us the distribution by making a histogram. Consider the variable height.
	
	histogram height
	
	** the default in the histogram command is to give you density. You can also switch to precentages or freuqencies
	
	histogram height, frequency
	histogram height, percent
	
	**again you can use if statements to limit the population
	
	histogram height if sex==1 , title("Women's Height Distribution")
