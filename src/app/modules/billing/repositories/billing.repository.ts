import { Billing } from '../entities/billing.entity';

export abstract class BillingRepository {
  abstract create(billing: Billing): Promise<void>;
}
