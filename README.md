### Checkpoint #4

_**Goal:** Implement LF fields with computed values_

1.  Start the application executing the command `ng serve cp4-begin` or if you are using  StackBlitz go to following link: <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp4-begin"  target="_blank">StackBlitz-CP4-Begin</a>.
2.  Notice the existing function "computedPrice" in the "foodTable" component
3.  Make the value of the field "price" of "foodTable" depend on the "typeFood" field value, using the "computedPrice" function

	```typescript
	/*food-table.component.html*/
	...
		<lf-table #lfTable [path]="path">
			...
			<lf-table-header>
				...
				<lf-table-column id = "price"></lf-table-column>
				...
			</lf-table-header>
				
			...
			
			<tr lfTableRow [path]="id" >
				...
				<td lfTableCell><lf-number path="price"></lf-number></td>
				...
			</tr>
		...
		</lf-table>
		<lf-number [path]="subTotalName"></lf-number>
	...

	/*food-table.schema.ts*/
	...
	price : numberSchema({
        ...
		computedValue: computedPrice
		...
	}),
	...
	```

4.  Notice the "subTotal" computed getter function of the "food-table" component that returns the sum total of the the "food-table"'s prices
5.  Repeat the process of point 3. to create a html element that calculates the subTotalPrice:
		
	```typescript
	/*food-table.component.html*/
	...
	<lf-table #lfTable [path]="path">
	...
	</lf-table>
	<lf-number [path]="subTotalName"></lf-number>
	...
	```

6.  Set the field "totalPrice" of "food" as computed, using the existing "totalPrice" function.

If you are using the StackBlitz version you can check the final solution <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp4-end"  target="_blank"> here </a>.