import {recordSchema} from '@lightweightform/storage';
import {accomodationSchema} from './accommodation/accomodation.schema';

export const reservationDetailsSchema = recordSchema(
  {
    accomodation: accomodationSchema,
  },
  {isForm: true},
);
