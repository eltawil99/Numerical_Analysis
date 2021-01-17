function varargout = Numerical_Analysis(varargin)
% NUMERICAL_ANALYSIS MATLAB code for Numerical_Analysis.fig
%      NUMERICAL_ANALYSIS, by itself, creates a new NUMERICAL_ANALYSIS or raises the existing
%      singleton*.
%
%      H = NUMERICAL_ANALYSIS returns the handle to a new NUMERICAL_ANALYSIS or the handle to
%      the existing singleton*.
%
%      NUMERICAL_ANALYSIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMERICAL_ANALYSIS.M with the given input arguments.
%
%      NUMERICAL_ANALYSIS('Property','Value',...) creates a new NUMERICAL_ANALYSIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Numerical_Analysis_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Numerical_Analysis_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Numerical_Analysis

% Last Modified by GUIDE v2.5 03-Jan-2021 17:47:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Numerical_Analysis_OpeningFcn, ...
                   'gui_OutputFcn',  @Numerical_Analysis_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Numerical_Analysis is made visible.
function Numerical_Analysis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Numerical_Analysis (see VARARGIN)

% Choose default command line output for Numerical_Analysis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Numerical_Analysis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Numerical_Analysis_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bis.
function bis_Callback(hObject, eventdata, handles)
% hObject    handle to bis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of bis
val=get(handles.bis,'value')
if val==1
set(handles.Falsp,'value',0)
set(handles.fixedp,'value',0)
set(handles.newtenraph,'value',0)
set(handles.Secant,'value',0)
prompt = {'Enter Xl','Enter Xu','Enter desired error'};
dlgtitle = 'Inputs';
dims = [1 35];
definput1 = {'','',''};
answer1 = inputdlg(prompt,dlgtitle,dims,definput1);
xl=str2num(answer1{1});
xu=str2num(answer1{2});
es=str2num(answer1{2});
eq=inline(get(handles.eq,'string'));



iter=0;
xr=xl;
ea=100;
maxit=100;
while(1)

xrold=xr;
xr=(xl+xu)/2;
iter=iter+1;
 
 if xr~=0,ea=abs((xr-xrold)/xr)*100;
 end

test=eq(xl)*eq(xr);
 
 if test<0

 xu=xr;

 elseif test>0
 
 xl=xr;

 else
 
 ea=0;

 end
 if ea<=es , break
 end

end

set(handles.root,'string',num2str(xr));
set(handles.iter,'string',num2str(iter));

end

% --- Executes on button press in Falsp.
function Falsp_Callback(hObject, eventdata, handles)
% hObject    handle to Falsp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Falsp
val=get(handles.Falsp,'value')
if val==1
set(handles.bis,'value',0)
set(handles.fixedp,'value',0)
set(handles.newtenraph,'value',0)
set(handles.Secant,'value',0)
prompt = {'Enter Xl','Enter Xu','Enter desired error'};
dlgtitle = 'Inputs';
dims = [1 35];
definput1 = {'','',''};
answer1 = inputdlg(prompt,dlgtitle,dims,definput1);
xl=str2num(answer1{1});
xu=str2num(answer1{2});
es=str2num(answer1{2});
eq=inline(get(handles.eq,'string'));
iter=0;
xr=xl;
ea=100;

while(1)

xrold=xr;
xr=xu-((xu-xl)*(eq(xu))/(eq(xu)-eq(xl)));
iter=iter+1;
 
 if xr~=0,ea=abs((xr-xrold)/xr)*100;
 end

test=eq(xl)*eq(xr);
 
 if test<0

 xu=xr;

 elseif test>0
 
 xl=xr;

 else
 
 ea=0;

 end
 if ea<=es , break
 end
end

set(handles.root,'string',num2str(xr));
set(handles.iter,'string',num2str(iter));

end

% --- Executes on button press in fixedp.
function fixedp_Callback(hObject, eventdata, handles)
% hObject    handle to fixedp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fixedp
val=get(handles.fixedp,'value')
if val==1
set(handles.bis,'value',0)
set(handles.newtenraph,'value',0)
set(handles.Secant,'value',0)
set(handles.Falsp,'value',0)
prompt = {'Enter X0','Enter desired error'};
dlgtitle = 'Inputs';
dims = [1 35];
definput1 = {'',''};
answer1 = inputdlg(prompt,dlgtitle,dims,definput1);
x0=str2num(answer1{1});

es=str2num(answer1{2});
eq=inline(get(handles.eq,'string'));
x=x0;

for iter=1:100

gx=eq(x);


 if gx~=0,ea=abs((gx-x)/gx)*100;end

 if ea> es
    x =gx;
    
 else
 break
 end

end
set(handles.root,'string',num2str(xr));
set(handles.iter,'string',num2str(iter));
end
% --- Executes on button press in Secant.
function Secant_Callback(hObject, eventdata, handles)
% hObject    handle to Secant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Secant
val=get(handles.Secant,'value');
if val==1
set(handles.bis,'value',0)
set(handles.newtenraph,'value',0)
set(handles.fixedp,'value',0)
set(handles.Falsp,'value',0)
prompt = {'Enter Xa','Enter Xb','Enter desired error'};
dlgtitle = 'Inputs';
dims = [1 30];
definput1 = {'','',''};
answer1 = inputdlg(prompt,dlgtitle,dims,definput1);
xa=str2num(answer1{1});
xb=str2num(answer1{2});
es=str2num(answer1{3});
eq=inline(get(handles.eq,'string'));

for iter = 1:100
    
 xr = xb - eq(xb)*(xa-xb)/(eq(xa)-eq(xb));
 if xr~=0,ea = abs((xr - xb)/xr)*100;end
 
 if ea> es
  xa = xb;
  xb = xr;
 else
 break
 end
end   
set(handles.root,'string',num2str(xr));
set(handles.iter,'string',num2str(iter));
end

% --- Executes on button press in newtenraph.
function newtenraph_Callback(hObject, eventdata, handles)
% hObject    handle to newtenraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of newtenraph
val=get(handles.newtenraph,'value')
if val==1
set(handles.bis,'value',0)
set(handles.fixedp,'value',0)
set(handles.Secant,'value',0)
set(handles.Falsp,'value',0)
prompt = {'Enter Xi','Enter desired error'};
dlgtitle = 'Inputs';
dims = [1 35];
definput1 = {'',''};
answer1 = inputdlg(prompt,dlgtitle,dims,definput1);
xi=str2num(answer1{1});

es=str2num(answer1{2});
eq=inline(get(handles.eq,'string'));

ea=100;
h=0.005;

for iter = 1:100

  xr = xi - 2*h*eq(xi)/(eq(xi+h) - eq(xi-h)) ;%The derivative of a function   is defined by the limit.
  if xr~=0, ea = abs((xr - xi)/xr)*100;end
  
  if ea > es
    xi = xr;
  else
    break
  end
end
set(handles.root,'string',num2str(xr));
set(handles.iter,'string',num2str(iter));
end

function eq2_Callback(hObject, eventdata, handles)
% hObject    handle to eq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq2 as text
%        str2double(get(hObject,'String')) returns contents of eq2 as a double


% --- Executes during object creation, after setting all properties.
function eq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function root_Callback(hObject, eventdata, handles)
% hObject    handle to root (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of root as text
%        str2double(get(hObject,'String')) returns contents of root as a double


% --- Executes during object creation, after setting all properties.
function root_CreateFcn(hObject, eventdata, handles)
% hObject    handle to root (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iter_Callback(hObject, eventdata, handles)
% hObject    handle to iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iter as text
%        str2double(get(hObject,'String')) returns contents of iter as a double


% --- Executes during object creation, after setting all properties.
function iter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=get(handles.eq,'string');

axes(handles.axes1);
p=ezplot(a);
p.LineWidth = 2;
grid on
zoom on
ax = gca;
ax.XColor = 'white';
ax.YColor = 'white';
title('')
     xlabel('')
    ylabel('')
set(gca,'color',[0.14 0.17 0.24])


function xmin_Callback(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmin as text
%        str2double(get(hObject,'String')) returns contents of xmin as a double


% --- Executes during object creation, after setting all properties.
function xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmax_Callback(hObject, eventdata, handles)
% hObject    handle to xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmax as text
%        str2double(get(hObject,'String')) returns contents of xmax as a double


% --- Executes during object creation, after setting all properties.
function xmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val=get(handles.popupmenu1,'value');
if val==1


set(handles.roe,'visible','on')
set(handles.inp,'visible','off')
set(handles.intg,'visible','off')
set(handles.sso,'visible','off')
set(handles.fode,'visible','off')
elseif val==2


set(handles.roe,'visible','off')
set(handles.inp,'visible','on')
set(handles.intg,'visible','off')
set(handles.sso,'visible','off')
set(handles.fode,'visible','off')
elseif val==4
set(handles.intg,'visible','on')
set(handles.roe,'visible','off')
set(handles.inp,'visible','off')
set(handles.sso,'visible','off')
set(handles.fode,'visible','off')
elseif val==3
set(handles.sso,'visible','on')
set(handles.intg,'visible','off')
set(handles.roe,'visible','off')
set(handles.inp,'visible','off')
set(handles.fode,'visible','off')
elseif val==5
set(handles.fode,'visible','on')
set(handles.sso,'visible','off')
set(handles.intg,'visible','off')
set(handles.roe,'visible','off')
set(handles.inp,'visible','off')
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xp_Callback(hObject, eventdata, handles)
% hObject    handle to xp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xp as text
%        str2double(get(hObject,'String')) returns contents of xp as a double


% --- Executes during object creation, after setting all properties.
function xp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x=str2num(get(handles.xp,'string'));
y=str2num(get(handles.yp,'string'));




axes(handles.axes3);
p=plot(x,y);

grid on
zoom on
p.LineWidth = 2;
ax = gca;
ax.XColor = 'white';
ax.YColor = 'white';
title('')
     xlabel('')
    ylabel('')
set(gca,'color',[0.14 0.17 0.24])



function yp_Callback(hObject, eventdata, handles)
% hObject    handle to yp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yp as text
%        str2double(get(hObject,'String')) returns contents of yp as a double


% --- Executes during object creation, after setting all properties.
function yp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Yint_Callback(hObject, eventdata, handles)
% hObject    handle to Yint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Yint as text
%        str2double(get(hObject,'String')) returns contents of Yint as a double


% --- Executes during object creation, after setting all properties.
function Yint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Yint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Lagrange.
function Lagrange_Callback(hObject, eventdata, handles)
% hObject    handle to Lagrange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Lagrange
val=get(handles.Lagrange,'value')
if val==1
set(handles.newinp,'value',0)
x=str2num(get(handles.xp,'string'));
y=str2num(get(handles.yp,'string'));

prompt = {'Enter Xin'};
dlgtitle = 'Inputs';
dims = [1 30];
definput1 = {''};
answer1 = inputdlg(prompt,dlgtitle,dims,definput1);
Xint=str2num(answer1{1});

n = length(x);
for i = 1:n
    L(i) = 1;
    for j = 1:n
        if j ~= i
            L(i)= L(i)*(Xint-x(j))/(x(i)-x(j));
        end
    end
end
y.*L;
Yint = sum(y.*L);
set(handles.Yint,'string',num2str(Yint));
end
% --- Executes on button press in newinp.
function newinp_Callback(hObject, eventdata, handles)
% hObject    handle to newinp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of newinp
val=get(handles.newinp,'value');
if val==1
set(handles.Lagrange,'value',0)
x=str2num(get(handles.xp,'string'));
y=str2num(get(handles.yp,'string'));
y=y(:);
x=x(:);
prompt = {'Enter Xin'};
dlgtitle = 'Inputs';
dims = [1 30];
definput1 = {''};
answer1 = inputdlg(prompt,dlgtitle,dims,definput1);
Xint=str2num(answer1{1});

n = length(x);
a(1) = y(1);
for i = 1:n-1
    divDIF(i,1) = (y(i+1)-y(i))/(x(i+1)-x(i));
end
for j = 2:n-1
    for i = 1:n-j
        divDIF(i,j) = (divDIF(i+1,j-1) - divDIF(i,j-1))/(x(j+i) - x(i));
    end
end

for j=2:n
    a(j)=divDIF(1,j-1);
end
Yint=a(1);
xn=1;
for k=2:n
    xn=xn*(Xint-x(k-1));
    Yint=Yint+a(k)*xn;
end
set(handles.Yint,'string',num2str(Yint));
end



function xmax2_Callback(hObject, eventdata, handles)
% hObject    handle to xmax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmax2 as text
%        str2double(get(hObject,'String')) returns contents of xmax2 as a double


% --- Executes during object creation, after setting all properties.
function xmax2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmax2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmin2_Callback(hObject, eventdata, handles)
% hObject    handle to xmin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmin2 as text
%        str2double(get(hObject,'String')) returns contents of xmin2 as a double


% --- Executes during object creation, after setting all properties.
function xmin2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmin2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_row_Callback(hObject, eventdata, handles)
% hObject    handle to x_row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_row as text
%        str2double(get(hObject,'String')) returns contents of x_row as a double


% --- Executes during object creation, after setting all properties.
function x_row_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m1=get(handles.m1,'value');
m2=get(handles.m2,'value');
m3=get(handles.m3,'value');
m4=get(handles.m4,'value');
way=get(handles.way,'value');
x=str2num(get(handles.x_row,'string'));
y=str2num(get(handles.y_row,'string'));
eq2=inline(get(handles.eq2,'string'));
a=str2num(get(handles.a_I,'string'));
b=str2num(get(handles.b_I,'string'));
N=str2num(get(handles.N_I,'string'));
h=str2num(get(handles.h_I,'string'));
if isempty(N)
else
h=(b-a)/N;
set(handles.h_I,'string',num2str(h));
end
if isempty(h)
else
N=(b-a)/h;
set(handles.N_I,'string',num2str(N));
end

if way==1
   if m1==1 || m3==1 || m4==1
       x=linspace(a,b,(N+1));
       y=zeros(1,length(x));
       for n=1:length(x)
           y(1,n)=eq2(x(n));
       end
       set(handles.x_row,'string',num2str(x));
       set(handles.y_row,'string',num2str(y));
   end
   if m2==1
       x2=linspace(h/2,(b-(h/2)),N);
       y2=zeros(1,length(x));
       for n=1:length(x2)
           y2(1,n)=eq2(x2(n));

       end
       
       set(handles.x_row,'string',num2str(x));
       set(handles.y_row,'string',num2str(y));
   end
       
end


if m1==1
    ans1=(h*sum(y(1:(length(y)-1)/N:(length(y)-1))));
     set(handles.ans,'string',num2str(ans1));
end
if m2==1
    ans2=(h*sum(y2));
     set(handles.ans,'string',num2str(ans2));
end
if m3==1

    y_mod=y(1:(length(y)-1)/N:(length(y)));
    ans3=(((h/2)*(y_mod(1)+y_mod(end)))+(h*(sum(y_mod(2:end-1)))));
    set(handles.ans,'string',num2str(ans3));
end
if m4==1
    y_mod=y(1:(length(y)-1)/N:(length(y)));
    ans4=(((h/3)*(y_mod(1)+y_mod(end)))+((4*h/3)*sum(y_mod(2:2:length(y_mod)-1)))+((2*h/3)*sum(y_mod(3:2:length(y_mod)-1))));
    
 set(handles.ans,'string',num2str(ans4));
end
       
      
function y_row_Callback(hObject, eventdata, handles)
% hObject    handle to y_row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_row as text
%        str2double(get(hObject,'String')) returns contents of y_row as a double


% --- Executes during object creation, after setting all properties.
function y_row_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_row (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to eq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq2 as text
%        str2double(get(hObject,'String')) returns contents of eq2 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in way.
function way_Callback(hObject, eventdata, handles)
% hObject    handle to way (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns way contents as cell array
%        contents{get(hObject,'Value')} returns selected item from way
way=get(handles.way,'value');
if way==1

set(handles.eq2,'visible','on')
set(handles.text32,'visible','on')
set(handles.y_row,'visible','off')
set(handles.x_row,'visible','off')
set(handles.text25,'visible','off')
set(handles.text24,'visible','off')
elseif way==2
set(handles.eq2,'visible','off')
set(handles.text32,'visible','off')
set(handles.y_row,'visible','on')
set(handles.x_row,'visible','on')
set(handles.text25,'visible','on')
set(handles.text24,'visible','on')
end
% --- Executes during object creation, after setting all properties.
function way_CreateFcn(hObject, eventdata, handles)
% hObject    handle to way (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_I_Callback(hObject, eventdata, handles)
% hObject    handle to a_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_I as text
%        str2double(get(hObject,'String')) returns contents of a_I as a double


% --- Executes during object creation, after setting all properties.
function a_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_I_Callback(hObject, eventdata, handles)
% hObject    handle to b_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_I as text
%        str2double(get(hObject,'String')) returns contents of b_I as a double


% --- Executes during object creation, after setting all properties.
function b_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function h_I_Callback(hObject, eventdata, handles)
% hObject    handle to h_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of h_I as text
%        str2double(get(hObject,'String')) returns contents of h_I as a double


% --- Executes during object creation, after setting all properties.
function h_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to h_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function N_I_Callback(hObject, eventdata, handles)
% hObject    handle to N_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_I as text
%        str2double(get(hObject,'String')) returns contents of N_I as a double


% --- Executes during object creation, after setting all properties.
function N_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ans_Callback(hObject, eventdata, handles)
% hObject    handle to ans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ans as text
%        str2double(get(hObject,'String')) returns contents of ans as a double


% --- Executes during object creation, after setting all properties.
function ans_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in m2.
function m2_Callback(hObject, eventdata, handles)
% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of m2
val=get(handles.m2,'value');
if val==1
set(handles.m1,'value',0)
set(handles.m3,'value',0)
set(handles.m4,'value',0)

end

% --- Executes on button press in m1.
function m1_Callback(hObject, eventdata, handles)
% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of m1
val=get(handles.m1,'value');
if val==1
set(handles.m2,'value',0)
set(handles.m3,'value',0)
set(handles.m4,'value',0)

end
% --- Executes on button press in m3.
function m3_Callback(hObject, eventdata, handles)
% hObject    handle to m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of m3
val=get(handles.m3,'value');
if val==1
set(handles.m2,'value',0)
set(handles.m1,'value',0)
set(handles.m4,'value',0)

end

% --- Executes on button press in m4.
function m4_Callback(hObject, eventdata, handles)
% hObject    handle to m4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of m4
val=get(handles.m4,'value');
if val==1
set(handles.m2,'value',0)
set(handles.m3,'value',0)
set(handles.m1,'value',0)

end


% --- Executes on button press in gj.
function gj_Callback(hObject, eventdata, handles)
% hObject    handle to gj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gj
val=get(handles.gj,'value');
if val==1
set(handles.ssos, 'String','')
set(handles.cramer,'value',0)
set(handles.ng,'value',0)
set(handles.jac,'value',0)
set(handles.gs,'value',0)
prompt1 = {'Enter the matrix of coefficients ','Enter a column vector of constants '};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'',''};
answer5 = inputdlg(prompt1,dlgtitle1,dims1,definput1);

a=str2num(answer5{1});

b=str2num(answer5{2});
ab = [a,b];
[R, C] = size(ab);
for j = 1:R
    % Pivoting section starts
    pvtemp=ab(j,j);
    kpvt=j;
% Looking for the row with the largest pivot element.
   for k=j+1:R
       if ab(k,j)~=0 && abs(ab(k,j)) > abs(pvtemp)
         pvtemp=ab(k,j);
         kpvt=k;
       end
   end
% If a row with a larger pivot element exists, switch the rows.
   if kpvt~=j
      abTemp=ab(j,:);
      ab(j,:)=ab(kpvt,:);
      ab(kpvt,:)=abTemp;
   end
% Pivoting section ends
   ab(j,:)= ab(j,:)/ab(j,j);
   for i = 1:R
       if i~=j
          ab(i,j:C) = ab(i,j:C)-ab(i,j)*ab(j,j:C);
       end
   end
end
x=ab(:,C);
x=x(:);
x=x(:);
nn=length(x);
 for xcm = 1:nn
          old_str=get(handles.ssos, 'String');
          tmp_str=['X',num2str(xcm),' = ',num2str(x(xcm))];
          new_str=[old_str; {tmp_str}];
          set(handles.ssos, 'String', new_str);
 end

end

% --- Executes on button press in ng.
function ng_Callback(hObject, eventdata, handles)
% hObject    handle to ng (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ng
val=get(handles.ng,'value');
if val==1
set(handles.ssos, 'String','')

set(handles.cramer,'value',0)
set(handles.gj,'value',0)
set(handles.jac,'value',0)
set(handles.gs,'value',0)
prompt1 = {'Enter the matrix of coefficients ','Enter a column vector of constants '};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'',''};
answer5 = inputdlg(prompt1,dlgtitle1,dims1,definput1);

a=str2num(answer5{1});

b=str2num(answer5{2});

ab = [a,b]
[R, C] = size(ab);
for j = 1:R-1
% Pivoting section starts
    if ab(j,j)==0
        for k=j+1:R
            if ab(k,j)~=0
                abTemp=ab(j,:);
                ab(j,:)=ab(k,:);
                ab(k,:)=abTemp;
                break
            end
        end
    end
% Pivoting section ends
    for i = j+1:R
        ab(i,j:C) = ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C);
    end
end
x = zeros(R,1);
x(R) = ab(R,C)/ab(R,R);
for i = R-1:-1:1
    x(i)=(ab(i,C)-ab(i,i+1:R)*x(i+1:R))/ab(i,i);
end


x=x(:);
nn=length(x);
 for xcm = 1:nn
          old_str=get(handles.ssos, 'String');
          tmp_str=['X',num2str(xcm),' = ',num2str(x(xcm))];
          new_str=[old_str; {tmp_str}];
          set(handles.ssos, 'String', new_str);
 end


end

% --- Executes on button press in jac.
function jac_Callback(hObject, eventdata, handles)
% hObject    handle to jac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of jac
val=get(handles.jac,'value');
if val==1
set(handles.ssos, 'String','')
set(handles.cramer,'value',0)
set(handles.gj,'value',0)
set(handles.ng,'value',0)
set(handles.gs,'value',0)
prompt1 = {'Enter the matrix of coefficients ','Enter a column vector of constants ','Enter initial guess for the solution'};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'','',''};
answer5 = inputdlg(prompt1,dlgtitle1,dims1,definput1);

A=str2num(answer5{1});

b=str2num(answer5{2});
x=str2num(answer5{3});


n=size(x,1);
normVal=Inf; 
%% 
% * _*Tolerence for method*_
tol=1e-5; itr=0;
%% Algorithm: Jacobi Method
%%
while normVal>tol
    xold=x;
    
    for i=1:n
        sigma=0;
        
        for j=1:n
            
            if j~=i
                sigma=sigma+A(i,j)*x(j);
            end
            
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
    normVal=abs(xold-x);
end

x=x(:);
nn=length(x);
 for xcm = 1:nn
          old_str=get(handles.ssos, 'String');
          tmp_str=['X',num2str(xcm),' = ',num2str(x(xcm))];
          new_str=[old_str; {tmp_str}];
          set(handles.ssos, 'String', new_str);
 end

end

 
% --- Executes on button press in gs.
function gs_Callback(hObject, eventdata, handles)
% hObject    handle to gs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gs

val=get(handles.gs,'value');
if val==1
set(handles.ssos, 'String','')
set(handles.cramer,'value',0)
set(handles.gj,'value',0)
set(handles.ng,'value',0)
set(handles.jac,'value',0)
prompt1 = {'Enter the matrix of coefficients ','Enter a column vector of constants ','Enter initial guess for the solution'};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'','',''};
answer5 = inputdlg(prompt1,dlgtitle1,dims1,definput1);

A=str2num(answer5{1});

b=str2num(answer5{2});

x=str2num(answer5{3});

n=size(x,1);
normVal=Inf; 
%% 
% * _*Tolerence for method*_
tol=1e-5; itr=0;
%% Algorithm: Gauss Seidel Method
%%
while normVal>tol
    x_old=x;
    
    for i=1:n
        
        sigma=0;
        
        for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
        end
        
        for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
    normVal=norm(x_old-x);
end


x=x(:);
nn=length(x);
 for xcm = 1:nn
          old_str=get(handles.ssos, 'String');
          tmp_str=['X',num2str(xcm),' = ',num2str(x(xcm))];
          new_str=[old_str; {tmp_str}];
          set(handles.ssos, 'String', new_str);
 end

end

function eq_Callback(hObject, eventdata, handles)
% hObject    handle to eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq as text
%        str2double(get(hObject,'String')) returns contents of eq as a double


% --- Executes during object creation, after setting all properties.
function eq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cramer.
function cramer_Callback(hObject, eventdata, handles)
% hObject    handle to cramer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cramer
val=get(handles.cramer,'value');
if val==1
set(handles.ssos, 'String','')

set(handles.ng,'value',0)
set(handles.gj,'value',0)
set(handles.jac,'value',0)
set(handles.gs,'value',0)
prompt1 = {'Enter the matrix of coefficients ','Enter a column vector of constants '};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'',''};
answer5 = inputdlg(prompt1,dlgtitle1,dims1,definput1);

A=str2num(answer5{1});

b=str2num(answer5{2});

n=length(b);
res=zeros(n,1);
D=det(A);
for i=1:n
    Aug=A;
    Aug(:,i)=b;
    res(i)=(det(Aug)/D);
end
x=res;
x=x(:);
nn=length(x);
 for xcm = 1:nn
          old_str=get(handles.ssos, 'String');
          tmp_str=['X',num2str(xcm),' = ',num2str(x(xcm))];
          new_str=[old_str; {tmp_str}];
          set(handles.ssos, 'String', new_str);
 end


end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as a double


% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eq6_Callback(hObject, eventdata, handles)
% hObject    handle to eq6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq6 as text
%        str2double(get(hObject,'String')) returns contents of eq6 as a double


% --- Executes during object creation, after setting all properties.
function eq6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in foderk.
function foderk_Callback(hObject, eventdata, handles)
% hObject    handle to foderk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of foderk

val=get(handles.foderk,'value');
if val==1
set(handles.fodee,'value',0)
set(handles.fodemid,'value',0)
prompt1 = {'Enter initial value of x  ','Enter the final value of x','Enter initial value of y ','Enter initial value of h '};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'','','',''};
answerfoderk = inputdlg(prompt1,dlgtitle1,dims1,definput1);




fodeeq=inline(get(handles.fodeeq,'string'),'x','y'); %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.
xrk=str2num(answerfoderk{1}); %example x0=0
yrk=str2num(answerfoderk{3}); %example y0=0.5
xnrk=str2num(answerfoderk{2});% where we need to find the value of y 
                                            %example x=2
h=str2num(answerfoderk{4});  %example h=0.2
 %Formula: y1=y0+h*fun(x0,y0);
 %fprintf('\n x        y ');
Nsteps = round(xnrk/h)+1; %% number of steps to take
Xrk=[xrk:h:xnrk];
Yrk =[];
Yrk(1,1)=yrk;
for i =2:Nsteps
 
k1=h*fodeeq(xrk,yrk);
    k2=h*fodeeq(xrk+h/2.0,yrk+k1/2.0);
    k3=h*fodeeq(xrk+h/2.0,yrk+k2/2.0);
    x1=xrk+h;
    k4=h*fodeeq(x1,yrk+k3);
    y1=yrk+(k1+2*(k2+k3)+k4)/6;
    Yrk(1,i)=y1; 
    xrk=x1;
    yrk=y1;  
end
set(handles.edit56, 'String',num2str(Xrk) )
set(handles.edit57, 'String',num2str(Yrk) )
 
axes(handles.axes7);
p=plot(Xrk,Yrk);
 p.LineWidth = 2;
grid on
zoom on
ax = gca;
ax.XColor = 'white';
ax.YColor = 'white';
title('')
     xlabel('')
    ylabel('')

set(gca,'color',[0.14 0.17 0.24])
end
% --- Executes on button press in fodemid.
function fodemid_Callback(hObject, eventdata, handles)
% hObject    handle to fodemid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fodemid
val=get(handles.fodemid,'value');
if val==1
set(handles.fodee,'value',0)
set(handles.foderk,'value',0)
prompt1 = {'Enter initial value of x  ','Enter the final value of x','Enter initial value of y ','Enter initial value of h '};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'','','',''};
answerfodemid = inputdlg(prompt1,dlgtitle1,dims1,definput1);




fodeeq=inline(get(handles.fodeeq,'string'),'x','y'); %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.
xmid=str2num(answerfodemid{1}); %example x0=0
ymid=str2num(answerfodemid{3}); %example y0=0.5
xnmid=str2num(answerfodemid{2});% where we need to find the value of y 
                                            %example x=2
h=str2num(answerfodemid{4});  %example h=0.2
 %Formula: y1=y0+h*fun(x0,y0);
 %fprintf('\n x        y ');
Nsteps = round(xnmid/h)+1; %% number of steps to take
Xmid=[xmid:h:xnmid];
Ymid =[];
Ymid(1,1)=ymid;
for i =2:Nsteps
    
    k=ymid+h*fodeeq(xmid,ymid);
    x1=xmid+h;
    y1=ymid+h/2*(fodeeq(xmid,ymid)+fodeeq(x1,k)); 
    Ymid(1,i)=y1;   
    xmid=x1;
    ymid=y1;  
end
set(handles.edit56, 'String',num2str(Xmid) )
set(handles.edit57, 'String',num2str(Ymid) )
 
axes(handles.axes7);
p=plot(Xmid,Ymid);
p.LineWidth = 2;
grid on
zoom on
ax = gca;
ax.XColor = 'white';
ax.YColor = 'white';
title('')
     xlabel('')
    ylabel('')
 
set(gca,'color',[0.14 0.17 0.24])
end
% --- Executes on button press in fodee.
function fodee_Callback(hObject, eventdata, handles)
% hObject    handle to fodee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of fodee
val=get(handles.fodee,'value');
if val==1
set(handles.fodemid,'value',0)
set(handles.foderk,'value',0)
prompt1 = {'Enter initial value of x  ','Enter the final value of x','Enter initial value of y ','Enter initial value of h '};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'','','',''};
answerfodee = inputdlg(prompt1,dlgtitle1,dims1,definput1);




fodeeq=inline(get(handles.fodeeq,'string'),'x','y'); %Write your f(x,y) function, where dy/dx=f(x,y), x(x0)=y0.
xeuler=str2num(answerfodee{1}); %example x0=0
yeuler=str2num(answerfodee{3}); %example y0=0.5
xneuler=str2num(answerfodee{2});% where we need to find the value of y 
                                            %example x=2
h=str2num(answerfodee{4});  %example h=0.2
 %Formula: y1=y0+h*fun(x0,y0);
 %fprintf('\n x        y ');
Nsteps = round(xneuler/h)+1; %% number of steps to take
XEuler=[xeuler:h:xneuler];

YEuler =[];
YEuler(1,1)=yeuler;
for i =2:Nsteps

    %fprintf('\n%4.3f  %4.3f ',x0,y0); %values of x and y
    y1=yeuler+h*fodeeq(xeuler,yeuler);
    YEuler(1,i)=y1;
    x1=xeuler+h;
    xeuler=x1;
    yeuler=y1;  
end

set(handles.edit56, 'String',num2str(XEuler) )
set(handles.edit57, 'String',num2str(YEuler) )
 
axes(handles.axes7);
p=plot(XEuler,YEuler);
p.LineWidth = 2;
grid on
zoom on 
ax = gca;
ax.XColor = 'white';
ax.YColor = 'white';
title('')
     xlabel('')
    ylabel('')
 
set(gca,'color',[0.14 0.17 0.24])

end



function fodeeq_Callback(hObject, eventdata, handles)
% hObject    handle to fodeeq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fodeeq as text
%        str2double(get(hObject,'String')) returns contents of fodeeq as a double


% --- Executes during object creation, after setting all properties.
function fodeeq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fodeeq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%XEuler=getappdata(handles.fodee, 'XEuler');
%YEuler=getappdata(handles.fodee, 'YEuler');
%Xmid=getappdata(handles.fodemid, 'Xmid');
%Ymid=getappdata(handles.fodemid, 'Ymid');
%Xrk=getappdata(handles.foderk, 'Xrk');
%Yrk=getappdata(handles.foderk, 'Yrk');
fodeeq=inline(get(handles.fodeeq,'string'),'x','y');

prompt1 = {'Enter initial value of x  ','Enter the final value of x','Enter initial value of y ','Enter initial value of h '};
dlgtitle1 = 'Inputs';
dims1 = [1 35];
definput1 = {'','','',''};
answercompare = inputdlg(prompt1,dlgtitle1,dims1,definput1);




xin=str2num(answercompare{1}); 
xrk=xin;
xmid=xin;
xfi=str2num(answercompare{2});


yeuler=str2num(answercompare{3}); 
ymid=yeuler;
yrk=ymid;
yexa=ymid;
h=str2num(answercompare{4});

exeq=str2func(['@(x,y)' get(handles.fodeeq,'string')]);

XX=[xin:0.001: xfi];

[xex,yex] = ode45(exeq,XX,yexa);





 Nsteps = round(xfi/h)+1; %% number of steps to take

X=[xin:h:xfi];
XEuler=X;
YEuler =[];
YEuler(1,1)=yeuler;
for i =2:Nsteps

    
    y1=yeuler+h*fodeeq(xin,yeuler);
    YEuler(1,i)=y1;
    x1=xin+h;
    xin=x1;
    yeuler=y1;  
end


Ymid =[];
Ymid(1,1)=ymid;
for i =2:Nsteps
    
    k=ymid+h*fodeeq(xmid,ymid);
    x1=xmid+h;
    y1=ymid+h/2*(fodeeq(xmid,ymid)+fodeeq(x1,k)); 
    Ymid(1,i)=y1;   
    xmid=x1;
    ymid=y1;  
end


Yrk =[];
Yrk(1,1)=yrk;
for i =2:Nsteps
 
k1=h*fodeeq(xrk,yrk);
    k2=h*fodeeq(xrk+h/2.0,yrk+k1/2.0);
    k3=h*fodeeq(xrk+h/2.0,yrk+k2/2.0);
    x1=xrk+h;
    k4=h*fodeeq(x1,yrk+k3);
    y1=yrk+(k1+2*(k2+k3)+k4)/6;
    Yrk(1,i)=y1; 
    xrk=x1;
    yrk=y1;  
end







axes(handles.axes7);



    
plot(xex,yex,X,YEuler,X,Ymid,X,Yrk);
grid on
zoom on
ax = gca;
ax.XColor = 'white';
ax.YColor = 'white';
title('')
     xlabel('')
    ylabel('')
set(gca,'color',[0.14 0.17 0.24])
legend({'\color{white}exact ','\color{white}Euler','\color{white}Modified','\color{white}Runge-Kutta'})

%syms x,y
%ode = diff(y,x) ==exeq ;
%cond = y(0) == yexa;
%ySol = dsolve(ode,cond)
%ddd=char(ySol)
%f = msgbox(ddd,'dy/dx');

function edit56_Callback(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit56 as text
%        str2double(get(hObject,'String')) returns contents of edit56 as a double


% --- Executes during object creation, after setting all properties.
function edit56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit57 as text
%        str2double(get(hObject,'String')) returns contents of edit57 as a double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
