import { calculateTicketPrice } from '../src/ticketPrice';
import { describe, it, expect } from 'vitest';

describe('calculateTicketPrice', () => {
	it('returns base price for non-student adult from non-partner company', () => {
		expect(
			calculateTicketPrice({
				age: 30,
				isStudent: false,
				isEarlyBird: false,
				company: 'othercompany'
			})
		).toBe(500);
	});

	it('returns half price for student aged 25 or younger', () => {
		expect(
			calculateTicketPrice({
				age: 22,
				isStudent: true,
				isEarlyBird: false,
				company: 'othercompany'
			})
		).toBe(250);
	});

	it('returns full price for student older than 25', () => {
		expect(
			calculateTicketPrice({
				age: 28,
				isStudent: true,
				isEarlyBird: false,
				company: 'othercompany'
			})
		).toBe(500);
	});

	it('returns 20% discounted price for vercel employee', () => {
		expect(
			calculateTicketPrice({
				age: 30,
				isStudent: false,
				isEarlyBird: false,
				company: 'vercel'
			})
		).toBe(400);
	});

	it('applies student discount over company discount', () => {
		expect(
			calculateTicketPrice({
				age: 20,
				isStudent: true,
				isEarlyBird: false,
				company: 'sentry'
			})
		).toBe(250);
	});

	it('applies early bird discount', () => {
		// TODO: implement once we have early bird discount rate
	});

	it('applies early bird discount with student discount', () => {
		expect(
			calculateTicketPrice({
				age: 20,
				isStudent: true,
				isEarlyBird: true,
				company: 'sentry'
			})
		).toBeLessThan(500);
	});
});
