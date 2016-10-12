TimeRest=E4_Ibi(:,2); 
j=1;
for i=3:length(TimeRest)
    slope1=1/(TimeRest(i)-TimeRest(i-1));
    slope2=1/(TimeRest(i-1)-TimeRest(i-2));
    if (slope2-slope1)>1
    doc{j}=i-3;
    j=j+1;
    end
end