%this part of the algorithm corrects the IBI data based     
   s=length(E4_Ibi);
time=E4_Ibi(:,2);
a=E4_Ibi(:,3);   % a is defined in order to store the IBI matrix so the 
                % Ibi_variable matrix would stay the same
i=2;
for i=2:s
   
    diff=abs(a(i-1)-a(i));
    if (diff<=(a(i-1)*(0.2))) && (time(i-1)+a(i-1)<time(i))
        a(i)=a(i);
         
    else
        time(i)=time(i-1)+a(i);
        a(i)=time(i)-time(i-1)-a(i-1);
         
    end
end

%----------------------------------------------------------%

        
%calculating HRV Features
%SDNN
%calculating mean of RR
MeanRR=sum(a)/length(a);
%calculating SDNN
rest=0; 
for i=1:length(a)
    rest=rest+(a(i)-MeanRR).^2;
end
SDNN=((1/length(a))*rest).^0.5;
%calculating RMSSD
rest=0;
 for i=1:length(a)-1
     rest=rest+(a(i+1)-a(i)).^2;
 end
 RMSSD=((1/length(a))*rest).^0.5;
 %calculating pNN50
 NN50=0;
 for i=1:length(a)-1
     deltaD=time(i+1)-time(i);
     if deltaD>0.05
         NN50=NN50+1;
     end
 end
 pNN50=NN50/length(a);
 
 
     


    