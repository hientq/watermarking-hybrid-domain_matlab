function varargout = muoitieu(varargin)
% MUOITIEU MATLAB code for muoitieu.fig
%      MUOITIEU, by itself, creates a new MUOITIEU or raises the existing
%      singleton*.
%
%      H = MUOITIEU returns the handle to a new MUOITIEU or the handle to
%      the existing singleton*.
%
%      MUOITIEU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MUOITIEU.M with the given input arguments.
%
%      MUOITIEU('Property','Value',...) creates a new MUOITIEU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before muoitieu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to muoitieu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help muoitieu

% Last Modified by GUIDE v2.5 10-Apr-2016 09:01:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @muoitieu_OpeningFcn, ...
                   'gui_OutputFcn',  @muoitieu_OutputFcn, ...
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


% --- Executes just before muoitieu is made visible.
function muoitieu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to muoitieu (see VARARGIN)

% Choose default command line output for muoitieu
handles.output = hObject;
handles.anhGoc=0;
handles.anhThuyVan=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes muoitieu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = muoitieu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
anhGoc=handles.anhGoc;
aG=rgb2gray(anhGoc);
% Muoi Tieu
anhThuyVan=handles.anhThuyVan;
muoitieu1=imnoise(anhThuyVan,'salt & pepper', 0.01); 
axes(handles.axes2);         %Fisso l'axes per il plot
imshow(muoitieu1);
anhMuoiTieu=rgb2gray(muoitieu1);

cr = max(max(normxcorr2(anhGoc(:,:,1), muoitieu1(:,:,1))));
cg = max(max(normxcorr2(anhGoc(:,:,2), muoitieu1(:,:,2))));
cb = max(max(normxcorr2(anhGoc(:,:,3), muoitieu1(:,:,3))));
c=(cr+cg+cb)/3;
%figure, surf(c), shading flat
set(handles.txtncc1,'String',c);

% PSNR
 
p = PSNR_RGB(anhGoc,muoitieu1);
set(handles.txtpsnr1,'String',p);
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname anhmau]=uigetfile({'*.jpg;*.png;*.tif;*bmp'},'Chon Anh'); %select image
anhGoc=imread(strcat(anhmau,fname));
axes(handles.axes1)             %Fisso l'axes per il plot
imshow(anhGoc)
handles.anhGoc=anhGoc;
guidata(hObject, handles);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname anhmau]=uigetfile({'*.jpg;*.png;*.tif;*bmp'},'Chon Anh'); %select image
anhThuyVan=imread(strcat(anhmau,fname));
axes(handles.axes2)             %Fisso l'axes per il plot
imshow(anhThuyVan)
handles.anhThuyVan=anhThuyVan;
guidata(hObject, handles);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
anhGoc=handles.anhGoc;
aG=rgb2gray(anhGoc);
% Muoi Tieu
anhThuyVan=handles.anhThuyVan;
muoitieu1=imnoise(anhThuyVan,'salt & pepper', 0.02); 
axes(handles.axes2);         %Fisso l'axes per il plot
imshow(muoitieu1);
anhMuoiTieu=rgb2gray(muoitieu1);

cr = max(max(normxcorr2(anhGoc(:,:,1), muoitieu1(:,:,1))));
cg = max(max(normxcorr2(anhGoc(:,:,2), muoitieu1(:,:,2))));
cb = max(max(normxcorr2(anhGoc(:,:,3), muoitieu1(:,:,3))));
c=(cr+cg+cb)/3;
%figure, surf(c), shading flat
set(handles.txtncc2,'String',c);

% PSNR
p = PSNR_RGB(anhGoc,muoitieu1);
set(handles.txtpsnr2,'String',p);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
anhGoc=handles.anhGoc;
aG=rgb2gray(anhGoc);
% Muoi Tieu
anhThuyVan=handles.anhThuyVan;
muoitieu1=imnoise(anhThuyVan,'salt & pepper', 0.03); 
axes(handles.axes2);         %Fisso l'axes per il plot
imshow(muoitieu1);
anhMuoiTieu=rgb2gray(muoitieu1);

cr = max(max(normxcorr2(anhGoc(:,:,1), muoitieu1(:,:,1))));
cg = max(max(normxcorr2(anhGoc(:,:,2), muoitieu1(:,:,2))));
cb = max(max(normxcorr2(anhGoc(:,:,3), muoitieu1(:,:,3))));
c=(cr+cg+cb)/3;
%figure, surf(c), shading flat
set(handles.txtncc3,'String',c);

% PSNR

p = PSNR_RGB(anhGoc,muoitieu1);
set(handles.txtpsnr3,'String',p);
