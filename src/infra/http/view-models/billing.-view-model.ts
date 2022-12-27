import { Billing } from '@app/modules/billing/entities/billing.entity';

class BillingViewModel {
  static toHTTP(billing: Billing) {
    return {
      id: billing.id,
      domain: billing.domain,
      amountOfDays: billing.amountOfDays,
      createdAt: billing.createdAt,
      updatedAt: billing.updatedAt,
    };
  }
}

export { BillingViewModel };
