function otsu(I)
    
    figure;imshow(I);  % display the  Original Image
    figure;imhist(I);  % display the Histogram
    n=imhist(I);       % n stores the number of occurence of each color values.
    N=sum(n);          % total number of pixels
    max=0; 
    for i=1:256
       P(i)=n(i)/N;     %probability of each intensity level
    end
    
    for T=2:255      % step through all thresholds from 2 to 255
        w0=sum(P(1:T));         % Weight1-Probability of class 1
        w1=sum(P(T+1:256));     % Weight2-Probability of class 2 
        u0=dot([0:T-1],P(1:T))/w0; % class mean u0, dot performs dot product
        u1=dot([T:255],P(T+1:256))/w1; % class mean u1
        
        sigma=w0*w1*((u1-u0)^2);      %sigma denotes between class variance. We want to find the threshold in such a way that betweeen class variance is maximized so that image can be easily segmented
        
        %below code finds the value of threshold at which the between class
        %var is maximum
        
        if sigma>max 
           max=sigma; 
           threshold=T-1; % desired threshold corresponds to maximum variance of between class
        end
    end

bw=im2bw(I,threshold/255); % Convert to Binary Image
figure(3),imshow(bw); % Display the Binary Image

end

    
