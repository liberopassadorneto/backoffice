import { Injectable } from '@nestjs/common';
import { PrismaService } from '@infra/database/prisma/prisma.service';
import { BillingRepository } from '@app/modules/billing/repositories/billing.repository';
import { Billing } from '@app/modules/billing/entities/billing.entity';
import { PrismaBillingMapper } from '../mappers/prisma-billing.mapper';

@Injectable()
export class PrismaBillingRepository implements BillingRepository {
  constructor(private prisma: PrismaService) {}

  async create(billing: Billing): Promise<void> {
    const raw = PrismaBillingMapper.toPrisma(billing);

    await this.prisma.billing.create({
      data: raw,
    });
  }
}
