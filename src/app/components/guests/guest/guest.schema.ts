import {recordSchema} from '@lightweightform/storage';
import {foodSchema} from './components/food/food.schema';
import {otherServicesSchema} from './components/other-services/other-services.schema';

export const guestSchema = recordSchema(
  {
    food: foodSchema,
    otherServices: otherServicesSchema,
  },
  {isForm: true},
);
