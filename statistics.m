clear;close all;clc;
%% Import
nameConfirmed='E:\COVID-19\COVID-19\csse_covid_19_data\csse_covid_19_time_series\time_series_19-covid-Confirmed.csv';
nameDeath='E:\COVID-19\COVID-19\csse_covid_19_data\csse_covid_19_time_series\time_series_19-covid-Deaths.csv';
nameRecovered='E:\COVID-19\COVID-19\csse_covid_19_data\csse_covid_19_time_series\time_series_19-covid-Recovered.csv';

confirmedData=importfile(nameConfirmed)';
deathData=importfile(nameDeath)';
recoveredData=importfile(nameRecovered)';


country={'Japan','Singapore','Korea','Italy','Spain','Germany','Iran','France','Switzerland'};
lines=[2,3,157,17,19,12,156,158,32];

if size(country)~=size(lines)
    fprintf("Wrong size of data.\n")
    return
end
[tem,longSize]=size(lines);

% for i=1:long
%     eval(['confirmed',country{i},'=importfilenameConfirmed,[',num2str(lines(i)),',',num2str(lines(i)),'])'';'])
%     eval(['death',country{i},'=importfile(nameDeath,[',num2str(lines(i)),',',num2str(lines(i)),'])'';'])
%     eval(['recovered',country{i},'=importfile(nameRecovered,[',num2str(lines(i)),',',num2str(lines(i)),'])'';'])
% end

[tem,long]=size(confirmedData);
days=[1:tem]';

clearvars tem i

%% Plots (Countries)
for i=1:longSize
    fig=figure(i);
    plot(days,confirmedData(:,lines(i)),'o-',days,deathData(:,lines(i)),'o-',days,recoveredData(:,lines(i)),'o-','LineWidth',2)
    set(gcf,'position',[200 100 1920 1080],'Name',country{i});
    set(gca, 'linewidth', 1.1,'fontname', 'Helvetica', 'FontSize',18)
    text(0.01,0.85,'From 2020/01/22','Color','blue','FontSize',24,'Units','normalized','HorizontalAlignment','left')
    title(country{i})
    xlabel("Days")
    ylabel("Numbers")
    legend({"Confirmed","Dearth","Recovered"},'Location','NorthWest')

end

%% Plots (types)
% Confirmed
figure
objPlot=[];
for i=1:longSize
    objPlot=[objPlot,'days,confirmedData(:,',num2str(lines(i)),'),''o-'','];
end
eval(['plot(',objPlot,'''LineWidth'',2)'])
set(gcf,'position',[200 100 1920 1080],'Name','Confirmed');
set(gca, 'linewidth', 1.1,'fontname', 'Helvetica', 'FontSize',18)
text(0.01,0.05,'From 2020/01/22','Color','blue','FontSize',24,'Units','normalized','HorizontalAlignment','left')
title('Confirmed')
xlabel("Days")
ylabel("Numbers")
% ytickformat('%2.2d')
legend(country,'Location','NorthWest')
%%
figure
objPlot=[];
for i=1:longSize
    objPlot=[objPlot,'days,confirmedData(:,',num2str(lines(i)),'),''o-'','];
end
eval(['semilogy(',objPlot,'''LineWidth'',2)'])
set(gcf,'position',[200 100 1920 1080],'Name','Confirmed (Logrithm)');
set(gca, 'linewidth', 1.1,'fontname', 'Helvetica', 'FontSize',18)
text(0,-0.07,'From 2020/01/22','Color','blue','FontSize',24,'Units','normalized','HorizontalAlignment','left')
title('Confirmed (Logrithm)')
xlabel("Days")
ylabel("Numbers")
% ytickformat('usd') 
legend(country,'Location','NorthWest')
%%
% Death
figure
objPlot=[];
for i=1:longSize
    objPlot=[objPlot,'days,deathData(:,',num2str(lines(i)),'),''o-'','];
end
eval(['plot(',objPlot,'''LineWidth'',2)'])
set(gcf,'position',[200 100 1920 1080],'Name','Death');
set(gca, 'linewidth', 1.1,'fontname', 'Helvetica', 'FontSize',18)
text(0.01,0.05,'From 2020/01/22','Color','blue','FontSize',24,'Units','normalized','HorizontalAlignment','left')
title('Death')
xlabel("Days")
ylabel("Numbers")
% ytickformat('%.0f')
legend(country,'Location','NorthWest')

% Recovered
figure
objPlot=[];
for i=1:longSize
    objPlot=[objPlot,'days,recoveredData(:,',num2str(lines(i)),'),''o-'','];
end
eval(['plot(',objPlot,'''LineWidth'',2)'])
set(gcf,'position',[200 100 1920 1080],'Name','Recovered');
set(gca, 'linewidth', 1.1,'fontname', 'Helvetica', 'FontSize',18)
text(0.01,0.05,'From 2020/01/22','Color','blue','FontSize',24,'Units','normalized','HorizontalAlignment','left')
title('Recovered')
xlabel("Days")
ylabel("Numbers")
% ytickformat('%.0f')
legend(country,'Location','NorthWest')


function number = importfile(filename, dataLines)
%IMPORTFILE 从文本文件中导入数据
%  TIMESERIES19COVIDCONFIRMED1 = IMPORTFILE(FILENAME)读取文本文件 FILENAME
%  中默认选定范围的数据。  返回数值数据。
%
%  TIMESERIES19COVIDCONFIRMED1 = IMPORTFILE(FILE, DATALINES)按指定行间隔读取文本文件
%  FILENAME 中的数据。对于不连续的行间隔，请将 DATALINES 指定为正整数标量或 N×2 正整数标量数组。
%
%  示例:
%  timeseries19covidConfirmed1 = importfile("E:\COVID-19\COVID-19\csse_covid_19_data\csse_covid_19_time_series\time_series_19-covid-Confirmed.csv", [18, 18]);
%
%  另请参阅 READTABLE。
%
% 由 MATLAB 于 2020-03-21 04:11:30 自动生成

%% 输入处理

% 如果不指定 dataLines，请定义默认范围
if nargin < 2
    dataLines = [2, Inf];
end

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 62);

% 指定范围和分隔符
opts.DataLines = dataLines;
opts.Delimiter = ",";

% 指定列名称和类型
opts.VariableNames = ["Var1", "Var2", "Var3", "Var4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25", "VarName26", "VarName27", "VarName28", "VarName29", "VarName30", "VarName31", "VarName32", "VarName33", "VarName34", "VarName35", "VarName36", "VarName37", "VarName38", "VarName39", "VarName40", "VarName41", "VarName42", "VarName43", "VarName44", "VarName45", "VarName46", "VarName47", "VarName48", "VarName49", "VarName50", "VarName51", "VarName52", "VarName53", "VarName54", "VarName55", "VarName56", "VarName57", "VarName58", "VarName59", "VarName60", "VarName61", "VarName62"];
opts.SelectedVariableNames = ["VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25", "VarName26", "VarName27", "VarName28", "VarName29", "VarName30", "VarName31", "VarName32", "VarName33", "VarName34", "VarName35", "VarName36", "VarName37", "VarName38", "VarName39", "VarName40", "VarName41", "VarName42", "VarName43", "VarName44", "VarName45", "VarName46", "VarName47", "VarName48", "VarName49", "VarName50", "VarName51", "VarName52", "VarName53", "VarName54", "VarName55", "VarName56", "VarName57", "VarName58", "VarName59", "VarName60", "VarName61", "VarName62"];
opts.VariableTypes = ["string", "string", "string", "string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 指定变量属性
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var4"], "EmptyFieldRule", "auto");

% 导入数据
number = readtable(filename, opts);

%% 转换为输出类型
number = table2array(number);
end