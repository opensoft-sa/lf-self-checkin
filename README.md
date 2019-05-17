### Checkpoint #6

_**Goal:** Add form's actions to the LF application_

1.  Start the application executing the command `ng serve cp6-begin` or if you are using  StackBlitz go to following link: <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp6-begin" target="_blank">StackBlitz-CP6-Begin</a>.
2.  Understand how to add actions, such as load, save and submit to the self check-in application
3.  Add a save action to save the form content to a file, making the modifications below:

	```typescript
    /*app.component.html*/
	...
	<lf-app [actions]="actions">...</lf-app>
	...
	
    /* app.component.ts */
	...
	actions = [
		{
			id: 'save',
			style: 'outline-secondary',
			icon: 'save',
			callback: async () => {
				const dateStr = new Date().toISOString().replace(/:|\./g, '-');
				const fileName = `census-${dateStr}.json`;
				try {
					await this.lfStorage.saveToFile('/', fileName);
					console.log('Value saved successfully');
					this.lfStorage.setPristine('/');
				} catch (err) {
					console.error('Error saving file:', err);
				}
			},
		},
	];
	...
	```


4.  Add a load action to load the form content from a file, using the code below:
	
	```typescript
	/* app.component.ts */
	id: 'load',
   	style: 'outline-secondary',
   	icon: 'folder-open',
    isDisabled: !this.lfFileStorage.loadIsSupported,
    callback: async () => {
     	try {
       		await this.lfStorage.loadFromFile('/');
       		console.log('Value loaded successfully');
       	} catch (err) {
       		console.error('Error loading file:', err);
       	}
    },
  	```
	
5. Add a validate action to validate the form content, using the code below:

	```typescript
	/* app.component.ts */
	...
    id: 'validate',
    style: 'outline-danger',
    icon: 'check-square-o',
    callback: () => this.lfApp.validate(),
	...
	```

6. Add a submit action to submit the form content to a server, using the code below:
		
	```typescript
     /* app.component.ts */
	...
	id: 'submit',
    text: "Submit",
    style: "outline-success",
    icon: "send",
    callback: () => {
    	this.submit();
    }
   	...
	```

If you are using the StackBlitz version you can check the final solution <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp6-end" target="_blank"> here </a>.