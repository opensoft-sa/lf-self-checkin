### Checkpoint #7

_**Goal:** Add form's language options to the LF application_

In this demonstration we choose to use the Portugues language as an example, but you can do it for every language.
We also separated the .pt-Pt and .en-Us for each component for a  simple comprehension but we can have everything in a single file. 

1. Start the application executing the command `ng serve cp7-begin` or if you are using  StackBlitz go to following link: <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp7-begin" target="_blank">StackBlitz-CP7-Begin</a>.
2. Start by adding a new language provider in the app.module.ts
		
	```typescript
	/*app.module.ts*/
	...
	providers: [
		...
		{provide: LF_APP_I18N, useValue: {'pt-PT': I18N_SELF_CHECK_IN_PT, 'en-US' : I18N_SELF_CHECK_IN_EN_US}},
		...
	],
	...
	```

	
3. Now you need to associate the language to the select button that will permit you to change the appli
4. cation language
		
	```typescript
	/*app.en.US*/
	...
	'*':{
		...
		actionsMenuOptions: {
			language: {
				'en-US': 'English',
				'pt-PT': 'Portuguese',
			},
		},
	...
	}
	```

4. Now you need to fill all the .pt-PT.ts files similiar to the .en-US that are all made in the checkpoint,
5. We suggest you copy the .en-US.ts file to the correspondent .pt-Pt.ts file and translate all the labels.

If you are using the StackBlitz version you can check the final solution <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp7-end" target="_blank"> here </a>.