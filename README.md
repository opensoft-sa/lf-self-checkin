### Checkpoint #2

_**Goal:** Fill the form components with LF fields_

1.  Start the application executing the command `ng serve cp2-begin` or if you are using  StackBlitz go to following link: <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp2-begin"  target="_blank">StackBlitz-CP2-Begin</a>
2.  Add the fields below to reservation-detail component:

	All the display features are realized in the en-US files and the logic restrictions and input processment are declared in the schema,
	you need to consider that in order to write code using good pratices and separe the logic from display functionalities

    2.1. **lf-text** (name: "email", code: "1.1", label: "E-mail address", minLength: 1)
	
	```typescript
	/*reservation-detail.component.html*/
	...
	<lf-text path = "email"></lf-text>
	...

	/*reservation-detail.es-US.ts*/
	...
	'/reservationDetails/email': {
		code: "1.1",
		[I18N_VALUE_LABEL_KEY]: "E-mail",
	},
	...

	/*reservation-detail.schema.ts*/
	...
	email: stringSchema({}),
	...
	```

	Note: the path you put on the html element needs to match the schema and the I18N file needs to have the right path otherwise no form elements will be displayed

    2.2. **lf-text** (name: "phone", code: "1.2", label: "Phone Number", minLength: 1)

    2.3. **lf-date-range** (name: "checkincheckout", code: "1.3", label: "Check-in / Check-out", isRequired: true)

    2.4. **lf-number** (name: "arrivalHour", code: "1.4", label: "Hour of arrival")

    2.5. **lf-text** (name: "flightNumber", code:"1.5", label: "Flight Number")

3.  Add three tables for each meal on the food component using the sc-food-table previously created:

	```typescript
	/*food.component.html*/
	...
	<sc-food-table #breakfastTable path="breakfastTable"></sc-food-table>
	<sc-food-table #lunchTable path="lunchTable"></sc-food-table>
	<sc-food-table #dinnerTable path="dinnerTable"></sc-food-table>
	...

	/*food.schemas.ts*/
	...
	...foodTableSchema('breakfastTable'),
	...foodTableSchema('lunchTable'),
	...foodTableSchema('dinnerTable'),
	...

	/*food.es-US.ts*/
	export const FOOD_I18N_EN_US =  LfI18n.mergeTranslations({
	...
		FOOD_TABLE_I18N_EN_US,
	...
	})
	```

If you are using the StackBlitz version you can check the final solution <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp2-end"  target="_blank"> here </a>