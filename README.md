### Checkpoint #5

_**Goal:** Customize values display_

1.  Start the application executing the command `ng serve cp5-begin` or if you are using  StackBlitz go to following link: <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp5-begin" target="_blank">StackBlitz-CP5-Begin</a>.

2.  Let's format the computed values to make our self check-in application look better

3.  Add the following fields to "totalPrice" in "food", and notice the changes on the value's formatting
	
	```typescript
	/*food-table.component.html*/
	...
	<lf-table-column id = "price" [scale] = 2 ></lf-table-column>
	...
	
	/*food-table.en-US.ts*/
	...
	
	'/guests/?/?/?/?/price':{
		decimalSeparator : ",",
		[I18N_NUMBER_THOUSANDS_SEPARATOR_KEY] : ".",
		suffix : " $",
	},
	
	...
	
	'/guests/?/?/subTotalbreakfastTable':{
		decimalSeparator : ',',
		[I18N_NUMBER_THOUSANDS_SEPARATOR_KEY] : ".",
		suffix : " $",
	},
		
	... (repeate for subTotallunchTable and subTotaldinnerTable)
	```

4.  Add the same fields to "price" in "food-table"


If you are using the StackBlitz version you can check the final solution <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp5-end"  target="_blank"> here </a>.