import { CreateBillingService } from '@app/modules/billing/services/create-billing.service';
import { Module } from '@nestjs/common';
import { DatabaseModule } from '../database/database.module';
import { BillingController } from './controllers/billing.controller';

@Module({
  imports: [DatabaseModule],
  controllers: [BillingController],
  providers: [CreateBillingService],
})
export class HttpModule {}
