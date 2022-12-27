import { BillingRepository } from '@app/modules/billing/repositories/billing.repository';
import { Module } from '@nestjs/common';
import { PrismaService } from './prisma/prisma.service';
import { PrismaBillingRepository } from './prisma/repositories/prisma-billing.repository';

@Module({
  providers: [
    PrismaService,
    {
      provide: BillingRepository,
      useClass: PrismaBillingRepository,
    },
  ],
  exports: [BillingRepository],
})
export class DatabaseModule {}
