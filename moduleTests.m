classdef basicTest < matlab.unittest.TestCase
    

	properties
		OriginalPath
	end

	methods(TestMethodSetup)
		function addFileToPath(testCase)
		end
    end

	methods(TestMethodTeardown)
		function restorePath(testCase)
		end
	end

	methods(Test)
		function testDimensions(testCase)
            beta0Expected = 1; betaExpected = [1 1 1 1 0 0 0 0]';
            N=100;
            p = length(betaExpected);
            x = rand(N, p);
            y = beta0Expected + x*betaExpected;
            [beta0, beta] = coordAscentENet(y, x, 0.1, 0, {});
            beta0
            beta
            testCase.assertSize(beta, [p 1]);
            testCase.assertEqual(beta0, beta0Expected, 'AbsTol', 0.05)
            testCase.assertEqual(beta, betaExpected, 'AbsTol', 0.05)
        end
    end
 end
