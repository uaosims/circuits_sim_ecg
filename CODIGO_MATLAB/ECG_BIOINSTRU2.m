function varargout = ECG_BIOINSTRU2(varargin)
% ECG_BIOINSTRU2 MATLAB code for ECG_BIOINSTRU2.fig
%      ECG_BIOINSTRU2, by itself, creates a new ECG_BIOINSTRU2 or raises the existing
%      singleton*.
%
%      H = ECG_BIOINSTRU2 returns the handle to a new ECG_BIOINSTRU2 or the handle to
%      the existing singleton*.
%
%      ECG_BIOINSTRU2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ECG_BIOINSTRU2.M with the given input arguments.
%
%      ECG_BIOINSTRU2('Property','Value',...) creates a new ECG_BIOINSTRU2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ECG_BIOINSTRU2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ECG_BIOINSTRU2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ECG_BIOINSTRU2

% Last Modified by GUIDE v2.5 29-May-2020 15:26:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ECG_BIOINSTRU2_OpeningFcn, ...
                   'gui_OutputFcn',  @ECG_BIOINSTRU2_OutputFcn, ...
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


% --- Executes just before ECG_BIOINSTRU2 is made visible.
function ECG_BIOINSTRU2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ECG_BIOINSTRU2 (see VARARGIN)

% Choose default command line output for ECG_BIOINSTRU2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ECG_BIOINSTRU2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ECG_BIOINSTRU2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%configuración de la comunicación
global s
delete(instrfind({'Port'},{'COM1'}))% Elimina todas las comunicaciones del puerto 1
s=serial('COM1','BaudRate',9600) % se incia la comunicacion serial con velocidad de 9600 bits por segundo
fopen(s)% abre el puerto para tanto leer como y escribir

%%ciclo para que se estabilize la conexión
%vector de tiempo
a=0 %inicio del lim inferior en x x o tiempo
b=1 %inicio del lim superior en eje x o tiempo este valor por que a 60 lpm se espera tener 5 registros ((60lpm * 5 )1pm/60s))^-1 =1/6 s
i=0
%tm=0
lim=0
h = animatedline% grafica animada
v=0%inicio del voltaje
t=0%inicio del tiempo
ver=0 %inicio del condicional por si se desea usar drawnow cada 100
%muestras
while true %ciclo infinito para plotear
i=i+1 %Contador 
datos=fscanf(s,'%d')
v=(datos*(5/1023))/6 %v(i)=datos en formato decimal*(5/1023) %tranformación de bits a  voltaje
t=t% t(i)=tm %tiempo de muestreo
if lim>=(1) %condicional para que corra el tiempo axes
 a=a+0.002
 b=b+0.002
end
axes(handles.axes1) %axes donde se graficara
addpoints(h,t,v)% line(t,v)%plot(t,v) % se coloca la grafica cada tiempo de muestreo
axis([a b 0.05 0.23])  % Muevo los eje para ver la grafica
if ver==100 %ciclo para ejecutar drawnow cada 100 muestras, no fuenciono
drawnow % comando para graficar en tiempo real
ver=0
end
t=t+0.002 %tm=tm+0.002 %el tiempo de la garfica se aumenta cada tiempo de muestreo
lim=lim+0.002
ver=ver+1
%pause(.0001) %pausa que no fue necesaria
end

fclose(s)






% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in v3.
function v3_Callback(hObject, eventdata, handles)
% hObject    handle to v3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'9')
% --- Executes on button press in v2.
function v2_Callback(hObject, eventdata, handles)
% hObject    handle to v2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'8')
% --- Executes on button press in v1.
function v1_Callback(hObject, eventdata, handles)
% hObject    handle to v1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'7')
% --- Executes on button press in v4.
function v4_Callback(hObject, eventdata, handles)
% hObject    handle to v4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'A')
% --- Executes on button press in v5.
function v5_Callback(hObject, eventdata, handles)
% hObject    handle to v5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'B')
% --- Executes on button press in v6.
function v6_Callback(hObject, eventdata, handles)
% hObject    handle to v6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'D')
% --- Executes on button press in avr.
function avr_Callback(hObject, eventdata, handles)
% hObject    handle to avr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'4')
% --- Executes on button press in avl.
function avl_Callback(hObject, eventdata, handles)
% hObject    handle to avl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'5')
% --- Executes on button press in avf.
function avf_Callback(hObject, eventdata, handles)
% hObject    handle to avf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'6')
% --- Executes on button press in d1.
function d1_Callback(hObject, eventdata, handles)
% hObject    handle to d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'1')
% --- Executes on button press in d2.
function d2_Callback(hObject, eventdata, handles)
% hObject    handle to d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'2')
% --- Executes on button press in d3.
function d3_Callback(hObject, eventdata, handles)
% hObject    handle to d3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fprintf(s,'3')

% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in apagado.
function apagado_Callback(hObject, eventdata, handles)
% hObject    handle to apagado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fclose(s) 
delete(s) 
clear s
 delete(instrfind({'Port'},{'COM1'}))
