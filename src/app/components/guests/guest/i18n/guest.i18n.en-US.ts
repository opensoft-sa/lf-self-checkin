import {LfI18n} from '@lightweightform/core';
import {OTHER_SERVICES_I18N_EN_US} from '../components/other-services/i18n/other-services.i18n.en-US';
import {FOOD_I18N_EN_US} from '../components/food/i18n/food.i18n.en-US';
import {I18N_VALUE_LABEL_KEY} from '@lightweightform/bootstrap-theme';

export const GUEST_I18N_EN_US = LfI18n.mergeTranslations({
  OTHER_SERVICES_I18N_EN_US,
  FOOD_I18N_EN_US,
  '/guests/?': {
    [I18N_VALUE_LABEL_KEY]: 'Guest',
  },
});
