function [yy,score]=f_modified_cricket_score (url)
% Coded by Swapan Masanta - 28-Mar-2019 11:27:36



format short g
[x]=f_Google_cricket_search(url);
y=[x(1,1),x(2,1),x(3,1),x(1,1)/x(3,1)];
score=f_Google_cricket_details(url);
Run=x(1);
Wicket=x(2);
Over=x(3);
Over2=floor(Over)+(Over-floor(Over))*10/6;
RunRate=Run/Over2;

yy=[Run,Wicket,Over2,RunRate];
end


function [output2]=f_Google_cricket_search(url)
[output]=f_Google_cricket_details(url);
txt = output{1,1};
expression = '(?<Run>\d+)/(?<Wicket>\d+)';
[x,~] = regexp(txt,expression,'tokens','match');

txt2 = output{1,2};
expression ='(\d+(\.\d+)*)';
[y,~] = regexp(txt2,expression,'tokens');

output2=[str2double(x{1,1}(1,1)); str2double(x{1,1}(1,2));str2double(y{1,1}(1,1))];
end


function output=f_Google_cricket_details(url)
urlp=[url];
txt=urlread(urlp);
txt = regexprep(txt,'<style.*?/style>','');
txt = regexprep(txt,'<.*?>','');

Score = strsplit(txt,'|');
Main = strtrim(strsplit(Score{1,1},'('));
Indv = strtrim(strsplit(Main{1,2},','));
Bowler =strtrim(strsplit(Indv{1,end},')'));
% new = {'\n'};

output{1,1}=Main{1,1};
output{1,2}=Indv{1,1};
output{1,3}=Indv{1,2};
output{1,4}=Indv{1,3};
output{1,5}=Bowler{1,1};
end
