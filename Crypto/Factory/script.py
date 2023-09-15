import sympy

number = 21740962110328230832239032656649610932068604557

def find_prime_factors(n):
    factor = sympy.nextprime(2)  # Start with the smallest prime, which is 2

    while n > 1:
        if n % factor == 0:
            n //= factor
            yield factor
        else:
            factor = sympy.nextprime(factor)

factors = list(find_prime_factors(number))
print(factors)
