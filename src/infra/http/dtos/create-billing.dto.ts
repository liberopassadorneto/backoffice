import { IsNotEmpty, IsUrl } from 'class-validator';

class CreateBillingDto {
  @IsNotEmpty()
  @IsUrl()
  domain: string;
}

export { CreateBillingDto };
