import { BillingRepository } from '@app/modules/billing/repositories/billing.repository';
import { Billing } from '@app/modules/billing/entities/billing.entity';

export class InMemoryCreateBillingRepository implements BillingRepository {
  public billings: Billing[] = [];

  async create(billing: Billing): Promise<void> {
    this.billings.push(billing);
  }
}
