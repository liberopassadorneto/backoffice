import { Billing } from '@app/modules/billing/entities/billing.entity';
import { billing as PrismaBilling } from '@prisma/client';

class PrismaBillingMapper {
  static toPrisma(billing: Billing) {
    return {
      id: billing.id,
      domain: billing.domain,
      amount_of_days: billing.amountOfDays,
      created_at: billing.createdAt,
      updated_at: billing.updatedAt,
    };
  }

  static toDomain(prismaBilling: PrismaBilling): Billing {
    return new Billing({
      domain: prismaBilling.domain,
      amountOfDays: prismaBilling.amount_of_days,
      createdAt: prismaBilling.created_at,
      updatedAt: prismaBilling.updated_at,
    });
  }
}

export { PrismaBillingMapper };
