const BASE_PRICE = 500;

export function calculateTicketPrice(criteria) {
	const { age, isStudent, isEarlyBird, company } = criteria;

	let price = BASE_PRICE;

	if (isEarlyBird) {
		// TODO: Change to actual number once we know the early bird discount rate
		price *= 0.8;
	}

	if (isStudent && age <= 25) {
		return price * 0.5;
	}

	if (['sentry', 'vercel'].includes(company)) {
		return price * 0.8;
	}

	return price;
}
