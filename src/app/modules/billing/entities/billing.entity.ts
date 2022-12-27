import { Replace } from '@helpers/Replace';
import { randomUUID } from 'node:crypto';

export class BillingProps {
  domain: string;
  amountOfDays: number;
  createdAt: Date;
  updatedAt?: Date | null;
}

export class Billing {
  private readonly _id: string;
  private props: BillingProps;

  constructor(
    props: Replace<BillingProps, { amountOfDays?: number; createdAt?: Date }>,
    id?: string,
  ) {
    this._id = id ?? randomUUID();

    this.props = {
      ...props,
      amountOfDays: props.amountOfDays ?? 14,
      createdAt: props.createdAt ?? new Date(),
      updatedAt: props.updatedAt ?? null,
    };
  }

  public get id(): string {
    return this._id;
  }

  public get domain(): string {
    return this.props.domain;
  }

  public set domain(domain: string) {
    this.props.domain = domain;
  }

  public get amountOfDays(): number {
    return this.props.amountOfDays;
  }

  public get createdAt(): Date {
    return this.props.createdAt;
  }

  public get updatedAt(): Date | null | undefined {
    return this.props.updatedAt;
  }

  public updateDate(): void {
    this.props.updatedAt = new Date();
  }
}
