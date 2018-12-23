function Graphic()
Variables=Results();

for i=1:1:4
row=(i-1)*16;
x  = [Variables(row+1,5),Variables(row+5,5),Variables(row+9,5),Variables(row+13,5)]; %test point

y1 = [Variables(row+1,6),Variables(row+5,6),Variables(row+9,6),Variables(row+13,6)] ; %error ap  ble 
y2 = [Variables(row+2,6),Variables(row+6,6),Variables(row+10,6),Variables(row+14,6)];  %error ap increase  ble static 
y3 = [Variables(row+3,6),Variables(row+7,6),Variables(row+11,6),Variables(row+15,6)] ; %error ap static   ble  increase
y4 = [Variables(row+4,6),Variables(row+8,6),Variables(row+12,6),Variables(row+16,6)];  %error ap increase  ble increase 
%ap_ble= [Variables(row+1,3),Variables(row+1,4),Variables(row+2,3),Variables(row+2,4),Variables(row+3,3),Variables(row+3,4),Variables(row+4,3),Variables(row+4,4)]                                   
subplot(2,2,i);
plot(x,y1,x,y2,x,y3,x,y4);
ylabel("average error");
  if i==1
        legend('ap:5 ble:5','ap:10 ble:5','as:5 ble:10','ap:10 ble:10');
        title("10x10 area");
        xlabel("test point number 25-33-50-100");
  end
   if i==2
         legend('ap:10 ble:10','ap:20 ble:10','as:10 ble:20','ap:20 ble:20');
         title("20x20 area");
         xlabel("test point number 100 133 200 400"); 
      end
   if i==3
         legend('ap:15 ble:15','ap:30 ble:15','as:15 ble:30','ap:30 ble:30');
         title("30x30 area"); 
         xlabel("test point number 225 300 450 900"); 
      end
    if i==4
         legend('ap:20 ble:20','ap:40 ble:20','as:20 ble:40','ap:40 ble:40');
         title("40x40 area");
         xlabel("test point number  400 533 800 1600"); 
      end    

     
grid
end
end
% subplot(2,2,2);
% plot(x,y1,x,y2,x,y3,x,y4);
% legend(y11(1),'10-5','5-10','10-10');
% 
% subplot(2,2,3);
% plot(x,y1,x,y2,x,y3,x,y4);
% legend(y11(1),'10-5','5-10','10-10');
% 
% subplot(2,2,4);
% plot(x,y1,x,y2,x,y3,x,y4);
% legend(y11(1),'10-5','5-10','10-10');
% grid
























% %% Grafiðin çizdirilmesi
% figure ;
% % Þekli tam ekran açar
% pause(0.00001);
% frame_h = get(handle(gcf),'JavaFrame');
% set(frame_h,'Maximized',1);
% %% ABCD için Parametlerin Hazýrlanmasý
% XA=[5:5:50]; %X ekseni
% % Karar aðacý sonuçlarý
% Y_C_A=A_S(:,2);
% Y_C_B=B_S(:,2);
% Y_C_C=C_S(:,2);
% Y_C_D=D_S(:,2);
% % Destek vektör makine sonuçlarý
% Y_S_A=A_S(:,1);
% Y_S_B=B_S(:,1);
% Y_S_C=C_S(:,1);
% Y_S_D=D_S(:,1);
% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Burada 2 grafiksel sonuç çizdirilecektir.
% %% Bu grafikte ABCD þekilleri çizdirilmiþtir.
% punto=18;
% lfs=10;
% subplot1=subplot(1,2,1);
% grid on;
% ax = gca % Get handle to current axes.
% ax.GridAlpha = 0.8;  % Make grid lines less transparent.
% ax.GridColor = [0.12, 0.7, 0.2]; % Dark Green.
% hold(subplot1,'on');
% plot(XA,Y_C_A,'-bs', ...
%     XA,Y_C_B,'-ms', ...
%     XA,Y_C_C,'-ks', ...
%     XA,Y_C_D,'-rs', ...
%     'LineWidth',1.75, ...
%     'MarkerSize',9,...
%     'Parent',subplot1) ;
% box(subplot1,'on');
% xlim([5 50]);
% % Set the remaining axes properties
% set(subplot1,'FontWeight','bold','FontName','Times New Roman','FontSize',...
%     punto,'FontWeight','bold');
% %% Ýngilizce
% % legend1 = legend('Acc A','Acc B','Acc C','Acc D', ...
% %     'PS A','PS B','PS C','PS D','Location','best') ;
% % set(legend1,...
% %     'Position',[0.924914774007841 0.101005153007041 0.0447916661233951 0.358747983246707], ...
% %     'FontSize',lfs,'AutoUpdate','off');
% % A = ['A/B/C/D Datasets'];
% title('Karar Aðaçlarý','FontWeight','bold','FontSize',punto,...
%     'FontName','Times New Roman');
% xlabel('Özellik Miktarý (%)','FontWeight','bold','FontSize',punto,...
%     'FontName','Times New Roman');
% ylabel('Doðruluk Oraný (%)','FontWeight','bold','FontSize',punto,...
%     'FontName','Times New Roman');
% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Burada 2 grafiksel sonuç çizdirilecektir.
% %% Bu grafikte ABCD þekilleri çizdirilmiþtir.
% punto=18;
% lfs=10;
% subplot1=subplot(1,2,2);
% grid on;
% ax = gca % Get handle to current axes.
% ax.GridAlpha = 0.8;  % Make grid lines less transparent.
% ax.GridColor = [0.12, 0.7, 0.2]; % Dark Green.
% hold(subplot1,'on');
% plot(XA,Y_S_A,'-bs', ...
%     XA,Y_S_B,'-ms', ...
%     XA,Y_S_C,'-ks', ...
%     XA,Y_S_D,'-rs', ...
%     'LineWidth',1.75, ...
%     'MarkerSize',9,...
%     'Parent',subplot1) ;
% box(subplot1,'on');
% xlim([5 50]);
% % Set the remaining axes properties
% set(subplot1,'FontWeight','bold','FontName','Times New Roman','FontSize',...
%     punto,'FontWeight','bold');
% %% Ýngilizce
% legend1 = legend('A','B','C','D','Location','best') ;
% set(legend1,...
%     'Position',[0.924914774007841 0.101005153007041 0.0447916661233951 0.358747983246707], ...
%     'FontSize',lfs,'AutoUpdate','off');
% % A = ['A/B/C/D Datasets'];
% title('Destek Vektör Makineleri','FontWeight','bold','FontSize',punto,...
%     'FontName','Times New Roman');
% xlabel('Özellik Miktarý (%)','FontWeight','bold','FontSize',punto,...
%     'FontName','Times New Roman');
% ylabel('Doðruluk Oraný (%)','FontWeight','bold','FontSize',punto,...
%     'FontName','Times New Roman');


