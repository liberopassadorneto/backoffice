import { Billing } from './billing.entity';

describe('Billing Entity', () => {
  it('should be able to create a Billing', () => {
    const billing = new Billing({
      domain: 'example@bitrix24.com.br',
    });

    expect(billing).toBeTruthy();
    expect(billing.amountOfDays).toEqual(14);
    expect(billing.createdAt).toBeInstanceOf(Date);
    expect(billing.updatedAt).toBeNull();
  });
});
