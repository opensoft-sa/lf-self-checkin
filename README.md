### Checkpoint #3

_**Goal:** Implement schema specifications for the LF fields_

1.  Start the application executing the command `ng serve cp3-begin` or if you are using  StackBlitz go to following link: <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp3-begin"  target="_blank">StackBlitz-CP3-Begin</a>.
2.  Add a minimum of 18 years old schema specification to the "birthDate" field on the guest component

	```typescript
   	/* guest.schema.ts */
	...
	birthDate: dateSchema({
		isRequired : true,
		isNullable : true,
		validate: has18PlusYears,
	}),
	...
	```
		
3. Add a internationalization error message that will be dislay later when the form validation fails
	
	```typescript
	/*guest.en-US*/
	...
	'/guests/?/birthDate':{
		[I18N_VALUE_LABEL_KEY]: 'Date of Birth',
		validations: {
			INVALID_AGE: 'You need to have at least 18 years old to do you Self-Check-In.',
		},
	},
	...
	```

	Note: The code of the error thrown in the schema file need to match the the validations atribute

4.  Add an e-mail schema specification to the "email" field on the reservation-detail component similar to point 2. You can use the function commented in the schema to validate the e-mail.

5.  Add a max length schema specification to the "flightNumber" field in reservation-detail
	
	```typescript
	/*reservation-detail.schema.ts*/
	...
	flightNumber: numberSchema({
		max : 1000000,
		Required : true,
		isNullable : true,
	}),
	...
	```

6.  Add min and max schema specifications to the "arrivalHour" field on the reservation-detail component

	```typescript
	/*reservation-detail.schema.ts*/
	...
	hourOfArrival: numberSchema({
		min: 0,
		max:23,
		Required : true,
		isNullable : true,
	}),
	...
	```

7.  Add a schema specification to the "personalTrainer" field in other-services, so that the field is only required if the guest opts for gym service

	```typescript
	...
	h3Number : numberSchema({
		isRequired : asksForGymService,
		isNullable : true,
		min : 0,
	}),
	...
	```

	Tip: Create a function that checks if the personal trainer radio is set to Y

If you are using the StackBlitz version you can check the final solution <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp3-end"  target="_blank"> here </a>.