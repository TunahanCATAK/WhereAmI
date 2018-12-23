function Variables=Results ()

count=1;
for area=1:1:4  %area 
    
row_count = area*10; %matrix row count
column_count = area*10; %matrix column count

for i=1:1:4     %test point 
%max_tp_number = (area+i)*20; %test point count 
max_tp_number = round((row_count*column_count)/(i)); %test point count 
   for j=1:1:4 %blue ap
       if j==1
          max_ap_number = area*5; %access point count
          max_ble_number = area*5; %bluetooth beacon count 
       end
        if j==2
          max_ap_number = area*10; %access point count
          max_ble_number = area*5; %bluetooth beacon count 
        end
        if j==3
          max_ap_number = area*5; %access point count
          max_ble_number = area*10; %bluetooth beacon count 
        end
        if j==4
          max_ap_number = area*10; %access point count
          max_ble_number = area*10; %bluetooth beacon count 
       end
       
       
       disp([count,".Olasýlýk"]);  
     error= whereami(row_count, column_count, max_ap_number, max_ble_number, max_tp_number);
     Variables(count,:)=[row_count,column_count,max_ap_number,max_ble_number,max_tp_number,error];
 %a(count,:)=[count,count,count]    
count=count+1;
   end
   
   
end
end

csvwrite('Results_variables', Variables);

end

