clear;clc
choice1 = input("Please choose which method to use(FR:1, PR:2, BFGS:3, L-BFGS:4):");
if choice1 == 1
%% *************************************************************
    %  test FR method
    disp("Please choose which function to test: ")
    choice2 = input("(Rosenbrock function:1, Freudenstein and Roth function:2, Powell singular function:3, Trigonometric function:4): ");
    
    tic
    
    f_type = choice2;
    acc2 = 1e-5;  % accuracy required
    cc = [0.0001 , 0.5];
    alpha_max = 1;
    
    if choice2 == 1
        % x0 of Rosenbrock function
        n = input("Please input the dimension(>=2):");
        m = n;
        x = zeros(n,1);
        for i = 1:2:n-1
            x(i) = -1.2;
            x(i+1) = 1;
        end
        if i ~= n-1
            x(n) = -1.2;
        end
        nm=[n,m];
    end
    if choice2 == 2
        % x0 of Freudenstein and Roth function
        x = [0.5, -2]';
        nm = [2,2];
    end
    if choice2 == 3
        % x0 of Powell singular function
        x = [3,-1,0,1]';
        nm = [4,4];
    end
    if choice2 == 4% x0 of Trigonometric function
        n = input("Please input the dimension(>1):");
        m = n;
        x = (1/n)*ones(n,1);
        nm = [n,m];
        
    end
        
    [num, ff, final_x] = FR(x, acc2, alpha_max, cc, f_type, nm);
    
    disp(' ')
    disp(['numbers of interations: ',num2str(num)])
    disp(['the value of min f(x): ',num2str(ff)])
    disp('the final x is: ')
    disp(final_x)
    
    
    toc
end
if choice1 == 2
    %% *************************************************************
    %  test PR method 
    disp("Please choose which function to test: ")
    choice2 = input("(Rosenbrock function:1, Freudenstein and Roth function:2, Powell singular function:3, Trigonometric function:4): ");
    
    tic
    
    f_type = choice2;
    acc2 = 1e-5;  % accuracy required
    cc = [0.0001 , 0.5];
    alpha_max = 1;
      
    if choice2 == 1
        % x0 of Rosenbrock function
        n = input("Please input the dimension(>=2):");
        m = n;
        x = zeros(n,1);
        for i = 1:2:n-1
            x(i) = -1.2;
            x(i+1) = 1;
        end
        if i ~= n-1
            x(n) = -1.2;
        end
        nm=[n,m];
    end
    if choice2 == 2
        % x0 of Freudenstein and Roth function
        x = [0.5, -2]';
        nm = [2,2];
    end
    if choice2 == 3
        % x0 of Powell singular function
        x = [3,-1,0,1]';
        nm = [4,4];
    end
    if choice2 == 4
        % x0 of Trigonometric function
        n = input("Please input the dimension(>1):");
        m = n;
        x = (1/n)*ones(n,1);
        nm = [n,m];
        
    end
    
    [num, ff, final_x] = PR(x, acc2, alpha_max, cc, f_type, nm);
    
    disp(' ')
    disp(['numbers of interations: ',num2str(num)])
    disp(['the value of min f(x): ',num2str(ff)])
    disp('the final x is: ')
    disp(final_x)
    
    toc
end
if choice1 == 3
    %% *************************************************************
    %  test BFGS method 
    %% BFGS 

    disp("Please choose which function to test: ")
    choice2 = input("(Rosenbrock function:1, Freudenstein and Roth function:2, Powell singular function:3, Trigonometric function:4): ");
    
    tic

    f_type=choice2;
    x = [-1.2, 1]';
    cc=[1e-4,0.9];
    alpha_max = 1;
    acc = 1e-8;

   if choice2 == 1
        % x0 of Rosenbrock function
        n = input("Please input the dimension(>=2):");
        m = n;
        x = zeros(n,1);
        for i = 1:2:n-1
            x(i) = -1.2;
            x(i+1) = 1;
        end
        if i ~= n-1
            x(n) = -1.2;
        end
%         x = 100*rand(n,1);
        nm=[n,m];
    end
    if choice2 == 2
        % x0 of Freudenstein and Roth function
        x = [0.5, -2]';
        nm = [2,2];
    end
    if choice2 == 3
        % x0 of Powell singular function
        x = [3,-1,0,1]';
        nm = [4,4];
    end
    if choice2 == 4% x0 of Trigonometric function
        n = input("Please input the dimension(>1):");
        m = n;
        x = (1/n)*ones(n,1);
        nm = [n,m];
        
    end
    
    [num, ff, final_x] = BFGS(x, acc, alpha_max, cc, f_type, nm);
    
    disp(' ')
    disp(['numbers of interations: ',num2str(num)])
    disp(['the value of min f(x): ',num2str(ff)])
    disp('the final x is: ')
    disp(final_x)

    toc
end

if choice1 == 4
    %% *************************************************************
    %  test L-BFGS method 
    %% L-BFGS 

    disp("Please choose which function to test: ")
    choice2 = input("(Rosenbrock function:1, Freudenstein and Roth function:2, Powell singular function:3, Trigonometric function:4): ");
    
    tic

    f_type=choice2;
    x = [-1.2, 1]';
    cc=[1e-4,0.9];
    alpha_max = 1;
    acc = 1e-6;
    num = 5;

   if choice2 == 1
        % x0 of Rosenbrock function
        n = input("Please input the dimension(>=2):");
        m = n;
        x = zeros(n,1);
        for i = 1:2:n-1
            x(i) = -1.2;
            x(i+1) = 1;
        end
        if i ~= n-1
            x(n) = -1.2;
        end
        nm=[n,m];
    end
    if choice2 == 2
        % x0 of Freudenstein and Roth function
        x = [0.5, -2]';
        nm = [2,2];
    end
    if choice2 == 3
        % x0 of Powell singular function
        x = [3,-1,0,1]';
        nm = [4,4];
    end
    if choice2 == 4% x0 of Trigonometric function
        n = input("Please input the dimension(>1):");
        m = n;
        x = (1/n)*ones(n,1);
        nm = [n,m];
        
    end
    
    [num, ff, final_x] = L_BFGS(x, acc, alpha_max, cc, f_type, nm, num);
    
    disp(' ')
    disp(['numbers of interations: ',num2str(num)])
    disp(['the value of min f(x): ',num2str(ff)])
    disp('the final x is: ')
    disp(final_x)

    toc
end

if choice1 == 5
    %% *************************************************************
    %  test Newton-CG method 
    %% Newton-CG 

    disp("Please choose which function to test: ")
    choice2 = input("(Rosenbrock function:1, Freudenstein and Roth function:2, Powell singular function:3, Trigonometric function:4): ");
    
    tic

    f_type=choice2;
    x = [-1.2, 1]';
    cc=[1e-4,0.9];
    alpha_max = 1;
    acc = 1e-6;
    num = 5;

   if choice2 == 1
        % x0 of Rosenbrock function
        n = input("Please input the dimension(>=2):");
        m = n;
        x = zeros(n,1);
        for i = 1:2:n-1
            x(i) = -1.2;
            x(i+1) = 1;
        end
        if i ~= n-1
            x(n) = -1.2;
        end
        nm=[n,m];
    end
    if choice2 == 2
        % x0 of Freudenstein and Roth function
        x = [0.5, -2]';
        nm = [2,2];
    end
    if choice2 == 3
        % x0 of Powell singular function
        x = [3,-1,0,1]';
        nm = [4,4];
    end
    if choice2 == 4% x0 of Trigonometric function
        n = input("Please input the dimension(>1):");
        m = n;
        x = (1/n)*ones(n,1);
        nm = [n,m];
        
    end
    
    [num, ff, final_x] = Newton_CG(x, acc, alpha_max, cc, f_type, nm);
    
    disp(' ')
    disp(['numbers of interations: ',num2str(num)])
    disp(['the value of min f(x): ',num2str(ff)])
    disp('the final x is: ')
    disp(final_x)

    toc
end
