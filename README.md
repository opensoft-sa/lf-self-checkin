## LF starter guide

Welcome to <a href="https://bitbucket.org/opensoftgitrepo/lightweightform" target="_blank">Lightweightform (LF)</a>
an angular based open source web framework that simplifies the development of
complex web forms. It provides developers a set of libraries and resources
that alleviate the burden associated with complex form programming.

This guide will help you getting started with our framework and after you complete
the guide you will be able to start to develop amazing complex forms easily.

This guide is also available in the StackBlitz platform, to save you all the touble of installing all the required tools.

## Requirements-Local Version

- <a href="https://nodejs.org/en/" target="_blank">NodeJS and NPM</a>
- <a href="https://cli.angular.io/" target="_blank">Angular CLI</a> - install angular cli globally on npm `npm install -g @angular/cli`
- <a href="https://github.com/nodejs/node-gyp" target="_blank">node-gyp</a> - We use node sass loader that depends on node-gyp.

## Setup-Local Version

- <a href="https://bitbucket.org/opensoftgitrepo/lf-self-checkin" target="_blank">Self Check-In</a> - clone or download the self check-in app's repository
- Execute command `npm install`
- Start the application executing the command `ng serve cp1-begin`
- Navigate to <a href="http://localhost:4200/" target="_blank">http://localhost:4200/</a>


## Requirements-StackBlitz Version

- Internet connection when loading a new checkpoint, but after that you can work off-line and even fork the code to create your own Self-CheckIn or publish you difficulties in a certain point.

## Setup-StackBlitz Version

- In this option there is no setup to be made, simply click on the StackBlitz link present in each chapter and you will have access to the code present in each chapter and the respective solution. We advice you to try to do the exercises by yourself, the solution is only a support and is not unique, so in the end you may had a different, but still, working application. 



## Guide

In this starter example you will develop an LF based Self Check-in complex form.

Self Check-in is a hypothetical web-form where the Hotel/Guest House owner will gather information about its guests. Despite being a simple form, it is compliant with the local Hotel policies and demonstrates some LF features, like repeatable forms and validations. Have fun.

This guide is divided in six checkpoints:

- Define the structure of the application
- Fill the form components with LF fields
- Implement schema specifications for the LF fields
- Implement LF fields with computed values
- Customize computed values display
- Add form's actions to the LF application
- Add internationalization features in your LF application

### Checkpoint #1

_**Goal:** Define the structure of the application_

1.  Start the application executing the command `ng serve cp1-begin`
or if you are using  StackBlitz go to following link: <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp1-begin" target="_blank">StackBlitz-CP1-Begin</a>

2.  Define the application's title ("LF Self check-in app")
3.	Define the application title and base root in the `index.html` file:
	```html
	<!--index.htm-->
	<head>
	...
	<base href="/"/>
	...
	<title>LF self check-in app</title>
	...
	</head>
	```
	 
4. Define the lf-title, lf-tree-nav and router-outlet on the `app.component.html`
	```html
	<!--app.component.html-->
	<lf-title>LF self check-in app</lf-title>
	<lf-tree-nav></lf-tree-nav>
	<router-outlet></router-outlet>
	```
	 
	 
5. Now let´s define some base routes that will be used by your app to identify each element:

	5.1. Define the reservations-details component to be the default route of you app

	5.2. Declare the accomodation component as a child of the reservationDetails

	5.3. Declare food and other-services as children of the guest/:index2

	5.4. In the final your app routes should look like this:

	```typescript
	const routes: LfRoutes = [
		{path: '', redirectTo: reservationDetails, pathMatch: 'full'},
		{path: reservationDetails, component: reservationDetailsComponent},
		{
			path: reservationDetails,
			children: [
				{path: 'accomodation', component: AccommodationComponent},
			],
		},  
		{
			path: 'guests/:index',
			children: [
				{path: '', component: GuestComponent },
				{path: 'food', component: FoodComponent },
				{path: 'otherServices', component: OtherServicesComponent},
			],
		},
	];
	```
	
6.  Add the first form of the application called reservation-detail:

    6.1. Generate component with angular cli `ng generate component components/reservation-detail` or if you are using StackBlitz left-click on the folder you want to create your element in and select `Angular Generator` and then `Componente`, then enter the component name and press enter.

	6.2. Create the `reservervation-details.schema.ts` and `reservationDetails.en.US` files if you are in StackBlitz you can create `.ts` manually using the extension `.ts`, or simply by using the `Angular Class` of `Angular generator`. The `.en.US` file however needs to be created manually.
	
	6.3. Create the translation for the reservations-schema and add it the `app.en.US` file

	```typescript
	/*reservations-details.en-US.ts*/
	export const RESERVATION_DETAILS_I18N_EN_US = LfI18n.mergeTranslations({
		...
		'/reservationDetails': {
			label : "Reservation Details",
		},
		...
	});

	/*app.en.US.ts*/
	export const I18N_SELF_CHECK_IN_EN_US = LfI18n.mergeTranslations(
		...
		RESERVATION_DETAILS_I18N_EN_US,
		...
	);
	```
	
	6.4. Now build the schema for the reservation-detail component and record it inside the appSchema
		
	```typescript
	/*reservationDetails.schema.ts*/
	export const reservationDetailsSchema = recordSchema({
		accomodation : accomodationSchema,
	},{isForm:true});
		
	/*app.schema.ts*/
	export const appSchema = recordSchema({
		reservationDetails: reservationDetailsSchema,
	});
	```

	Note: don´t forget to declare the reservations-details as form by setting the `isForm` attribute to true
		 
7. Add a form, named "guest", to the application:

    7.1. Generate component with angular cli `ng generate component components/guests/components/guest` or if you are using StackBlitz repeat the procedure of steep 6.1.

    7.2. Create the guest.schema.ts and guest.en-US.ts files
	
	7.3. Create the translation for the guest-schema and add it the app.en.US file
	
	```typescript
	/*guest.en-US.ts*/
	export const GUEST_I18N_EN_US = LfI18n.mergeTranslations({
		'/guests/?': {
		[I18N_VALUE_LABEL_KEY] : "Guest",
		},
	});

	/*app.en.US.ts*/
	export const I18N_SELF_CHECK_IN_EN_US = LfI18n.mergeTranslations(
		...
		GUEST_I18N_EN_US,
		...
	);
	```

	7.4. Now build the schema for the guest component and record it inside the appSchema like in the step 6.4.

8.  Add a table form, called "guests", to the application:

    8.1. Generate component with angular cli `ng generate component components/guests` or in StackBlitz repeat the procedure of 6.1.
	
	8.2. Create the guests.schema.ts and guests.en-US.ts files

    8.3. Create the translation for the guests-schema and add it the app.en.US file

	```typescript
	export const GUESTS_I18N_EN_US = LfI18n.mergeTranslations({
		GUEST_I18N_EN_US,
		'/guests':{
			[I18N_VALUE_LABEL_KEY] : "Guests"
		},
	});
	```

	Note: guests is a table form of guest forms, you need to need to merge the GUEST_I18N_EN_US inside the GUESTS_I18N_EN_US 

	8.4. Now build the schema for the guests component and record it inside the appSchema

	```typescript
	/*guests.schema.ts*/
	export const guestsSchema  = tableSchema(guestSchema, {minSize:1})
	
	/*app.schema.ts*/
	export const appSchema = recordSchema({
		guests: guestsSchema,
	});
	```

9.  Add a sub-form inside reservation-detail's component:

    9.1. Generate a sub form called "accommodation" (path: "components/reservation-detail/components/accommodation", name: "accommodation", label: "Accommodation")

	9.2. Create the accomodation.schema.ts and accomodation.en-US.ts files
	
	9.3. Create a tableSchema inside the accomodationSchema that will be used in the future to create a table
and put it inside the reservation-detail.schema
	
	```typescript
	/*accomodation.schema.ts*/
	export const accomodationSchema  = recordSchema({
		accomodationsTable: tableSchema(
			recordSchema({})
		),
	},{isForm:true});
		...
	
	/*reservationDetails.schema.ts*/
	export const reservationDetailsSchema = recordSchema({
		accomodation : accomodationSchema,
	},{isForm:true});
	```
	
    9.4. Create the translation for the accomdation component and add it the app.en.US file and reservationDetails.en-US.
	
	```typescript
	/*accomodation.en-US*/
	export const ACCOMODATION_I18N_EN_US = LfI18n.mergeTranslations({
		'/reservationDetails/accomodation':{
			[I18N_VALUE_LABEL_KEY] : "Accomodation",
		},
	});

	/*reservationDetails.en-US*/
	export const RESERVATION_DETAILS_I18N_EN_US = LfI18n.mergeTranslations({
		...
		ACCOMODATION_I18N_EN_US,
		...
	});
	```

10. In the same way, add two new sub forms to guest with the specification indicated below

	10.1.  Food component: path: "components/guests/components/guest/food"

	10.2.  Create Food schema and es-US files with name: "food", label: "Food"

	10.3.  Other Services component: path: "components/guests/components/guest/otherServices"

	10.4.  Create Other Services schema and es-US files with name: "otherServices", label: "Other Services"

	10.5.  Now you need to put the components inside the guests component as shown below

	```typescript
	/*guest.schema.ts*/
	export const guestSchema  = recordSchema({
		food: foodSchema, 
		otherServices : otherServicesSchema,   
	}, {isForm:true})

	...

	/*guest.es-US.ts*/
   	export const GUEST_I18N_EN_US = LfI18n.mergeTranslations({
	...
	OTHER_SERVICES_I18N_EN_US,
	FOOD_I18N_EN_US,
	...
	});
	```
    	
If you are using the StackBlitz version you can check the final solution <a href="https://stackblitz.com/github/opensoft-sa/lf-self-checkin/tree/cp1-end"  target="_blank"> here </a>, but try to do it by yourself :)