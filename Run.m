% Coded by Swapan Masanta - 28-Mar-2019 11:27:36

m=1;
count=1;count1=1;count2=2;ymin=0;ymax=12;
store_run=zeros(2,2);wicket{m,1}(1,:)=[0,0,0];
url='http://www.espncricinfo.com/series/8048/game/1178397/kings-xi-punjab-vs-sunrisers-hyderabad-22nd-match-indian-premier-league-2019';


j=i+1;
for i=2:2000
    clear da data
    [x,score]=f_modified_cricket_score (url);%innings %show result
    store_raw{m,1}(i,:)=x;
    data=store_raw{m,1};
    [~, ia, ~]=unique(data(:,3),'last');
    da=data(ia,:);
    store{m,1}=da;
    %%

    if (i>1 && store_raw{m,1}(i,2)>store_raw{m,1}(i-1,2))
        wicket{m,1}(count,:)=[store_raw{m,1}(i,3),store_raw{m,1}(i,1),store_raw{m,1}(i,2)];
        count=count+1;
        speak('wicket')
        speak(x(2))
        wicket{m,1}(count-1,:)
        %         h=figure(2);
        %         txt1=({'O  U  T',x(2)});
        %         text(0.3,0.3,txt1,'HorizontalAlignment','center','Color','red','FontSize',32)
        %         txt2=({score{1},score{2},score{3},score{5}});
        %         text(0.8,0.7,txt2,'HorizontalAlignment','center','Color','m','FontSize',12)
        speak(x(1:2))
        speak(score{5})
        %         pause(10)
        %         close(h)
        %         pause (20)
    end
    
  %%  
    
    
    %
    figure(1)
    subplot(3,1,2)
    plot(store{m,1}(:,3),store{m,1}(:,1),'--m','LineWidth',0.3,...
        'Marker','o','MarkerFaceColor','green','MarkerSize',.7);
    % Plot the fitted line
    if length(store{m,1}(:,3)) > 24
        [~]= f_bestfit(store{m,1}(end-30:end,3),store{m,1}(end-30:end,1),1,'c-.',1);
    end
    grid minor
    
    xlabel({sprintf('%s',score{1,1}),sprintf('%s',score{1,2})},'FontSize',6,'FontWeight','bold','Color','k')
    title(sprintf('%s ',datestr(rem(now,1))),'FontSize',6,'FontWeight','bold','Color','k')
    lent=length(store{m,1}(:,3)>120);
    if (i>1 && store_raw{m,1}(i,2)>store_raw{m,1}(i-1,2))
        wicket{m,1}(count,:)=[store_raw{m,1}(i,3),store_raw{m,1}(i,1),store_raw{m,1}(i,2)];
        count=count+1;
    end
    if (length(wicket{m,1}(:,1))>1)
        hold on
        scatter(wicket{m,1}(:,1),wicket{m,1}(:,2),'+g')
        hold off
    end
    
    run=store_raw{m,1}(i,1)-store_raw{m,1}(i-1,1);
    if (i>1 && store_raw{m,1}(i,3)>store_raw{m,1}(i-1,3)&& store_raw{m,1}(i,1)>store_raw{m,1}(i-1,1) )
        speak(run)
    end
    
    
    
    %%
    subplot(3,1,3)
    plot(store{m,1}(:,3),store{m,1}(:,4),'LineStyle','--', 'LineWidth',0.3,...
        'Marker','o','MarkerFaceColor','red','MarkerSize',.7);
    grid minor
    ylim([ymin,ymax]);
    xlabel({sprintf('%s, %s',score{1,3},score{1,4}),sprintf('%s',score{1,5})},...
        'FontSize',6,'FontWeight','bold','Color','k')
    % Plot the fitted line
    if length(store{m,1}(:,3)) > 24
        [~]=f_bestfit(store{m,1}(end-30:end,3),store{m,1}(end-30:end,4),1,'c-.',2);
    end
    %%
    if (length(wicket{m,1}(:,1))>1)
        hold on
        scatter(wicket{m,1}(:,1),zeros(length(wicket{m,1}(:,1)),1),'g')
        hold off
    end
    
    
    
    
    
    if (i>3 && (store_raw{m,1}(i,3)-store_raw{m,1}(i-1,3))>0)
        disp(run)
        store_run(count2,1)=run;
        store_run(count2,2)=store_raw{m,1}(i,3);
        store_run(count2,3)=store_raw{m,1}(i,4);
        count2=count2+1;

        
        
        
        
        
        subplot(3,1,1)
        store_run(store_run(:,1)==0,1)=-0.1;
        bar(store_run(2:end,2),store_run(2:end,1),'r');
        grid on
        %%
        if (length(wicket{m,1}(:,1))>1)
            hold on
            scatter(wicket{m,1}(:,1),zeros(length(wicket{m,1}(:,1)),1),'g')
            hold off
        end
        
    end
    
    
    
    
    %%
    pause (15)

end

    save store_raw store_raw
    save wicket wicket
    save store_run store_run
% 
% 
% 
% %%
% 
% for i=43:2000
%     [x,score]=f_modified_cricket_score (url);%innings %show result
%     store_raw{m,1}(i,:)=x;
%     %speak(x(1:2))
%     %%
%     if (i>1 && store_raw{m,1}(i,2)>store_raw{m,1}(i-1,2))
%         wicket{m,1}(count,:)=[store_raw{m,1}(i,3),store_raw{m,1}(i,1),store_raw{m,1}(i,2)];
%         count=count+1;
%         speak('wicket')
%         speak(x(2))
%         wicket{m,1}(count-1,:)
%         h=figure(1);
%         txt1=({'O  U  T',x(2)});
%         text(0.3,0.3,txt1,'HorizontalAlignment','center','Color','red','FontSize',32)
%         txt2=({score{1},score{2},score{3},score{5}});
%         text(0.8,0.7,txt2,'HorizontalAlignment','center','Color','m','FontSize',12)
%         speak(x(1:2))
%         speak(score{5})
%         pause(10)
%         close(h)
%     end
%     pause (45)
% end
% 
