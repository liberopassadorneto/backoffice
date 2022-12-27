import { Injectable } from '@nestjs/common';
import { Billing } from '../entities/billing.entity';
import { BillingRepository } from '../repositories/billing.repository';

export interface CreateBillingRequest {
  domain: string;
}

export interface CreateBillingResponse {
  billing: Billing;
}

@Injectable()
export class CreateBillingService {
  constructor(private billingRepository: BillingRepository) {}

  async execute({
    domain,
  }: CreateBillingRequest): Promise<CreateBillingResponse> {
    const billing = new Billing({
      domain,
    });

    await this.billingRepository.create(billing);

    return { billing };
  }
}
