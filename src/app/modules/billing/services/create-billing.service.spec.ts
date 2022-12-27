import { InMemoryCreateBillingRepository } from '@test/in-memory-repositories/create-billing.repository';
import { CreateBillingService } from './create-billing.service';

describe('CreateBillingService', () => {
  it('should be able to create a new billing', async () => {
    const inMemoryCreateBillingRepository =
      new InMemoryCreateBillingRepository();

    const createBilling = new CreateBillingService(
      inMemoryCreateBillingRepository,
    );

    const { billing } = await createBilling.execute({
      domain: 'example-domain@bitrix24.com.br',
    });

    expect(inMemoryCreateBillingRepository.billings).toHaveLength(1);
    expect(inMemoryCreateBillingRepository.billings[0]).toEqual(billing);
  });
});
