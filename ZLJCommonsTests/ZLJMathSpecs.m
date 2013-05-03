//
// Created by zlajo
//


#import <Kiwi/Kiwi.h>

#import "ZLJMath.h"

SPEC_BEGIN(ZLJMathSpecs)

describe(@"The function zeros", ^{
	it(@"should provide no solution for a simple polynom of second order that has no solution in R", ^{
		double *solutions_ = calloc(2, sizeof(double));
		int solutionCount =  zeros(1, 1, 1, solutions_);

		[[@(solutionCount) should] equal:@(0)];
	});

	it(@"should provide one solution for a simple polynom of second order that has one solution in R", ^{
		double *solutions = calloc(2, sizeof(double));
		int solutionCount =  zeros(1, 2, 1, solutions);

		[[@(solutionCount) should] equal:@(1)];
		[[@(solutions[0]) should] equal:@(-1)];
	});

	it(@"should provide two correct solutions for a simple polynom of second order that has two solutions in R", ^{
		double *solutions = calloc(2, sizeof(double));
		int solutionCount =  zeros(-1, 1, 2, solutions);

		[[@(solutionCount) should] equal:@(2)];
		[[[NSArray arrayWithObjects:@(solutions[0]), @(solutions[1]), nil] should] containObjects:@(0.5), @(-1), nil];
	});
});

SPEC_END
