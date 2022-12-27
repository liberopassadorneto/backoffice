import { CreateBillingService } from '@app/modules/billing/services/create-billing.service';
import { Body, Controller, Post } from '@nestjs/common';
import { CreateBillingDto } from '../dtos/create-billing.dto';
import { BillingViewModel } from '../view-models/billing.-view-model';

@Controller('billing')
export class BillingController {
  constructor(private createBillingService: CreateBillingService) {}

  @Post()
  async create(@Body() { domain }: CreateBillingDto) {
    const { billing } = await this.createBillingService.execute({
      domain,
    });

    return {
      billing: BillingViewModel.toHTTP(billing),
    };
  }
}
