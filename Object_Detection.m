function varargout = Object_Detection(varargin)
% OBJECT_DETECTION MATLAB code for Object_Detection.fig
%      OBJECT_DETECTION, by itself, creates a new OBJECT_DETECTION or raises the existing
%      singleton*.
%
%      H = OBJECT_DETECTION returns the handle to a new OBJECT_DETECTION or the handle to
%      the existing singleton*.
%
%      OBJECT_DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OBJECT_DETECTION.M with the given input arguments.
%
%      OBJECT_DETECTION('Property','Value',...) creates a new OBJECT_DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Object_Detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Object_Detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Object_Detection

% Last Modified by GUIDE v2.5 04-Nov-2016 08:36:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Object_Detection_OpeningFcn, ...
                   'gui_OutputFcn',  @Object_Detection_OutputFcn, ...
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


% --- Executes just before Object_Detection is made visible.
function Object_Detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Object_Detection (see VARARGIN)

% Choose default command line output for Object_Detection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Object_Detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Object_Detection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile('*.jpg','select a folder');
axes(handles.axes1);
matlabImage = imread(strcat(pathname,filename));
image(matlabImage);
axis off
axis image
handles.filename = filename;
handles.pathname = pathname;
guidata(hObject,handles);


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = handles.filename;
pathname = handles.pathname;
face_detection(filename,pathname);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = handles.filename;
pathname = handles.pathname;
warning_sign(filename, pathname);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = handles.filename;
pathname = handles.pathname;
car_detector(filename, pathname);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = handles.filename;
pathname = handles.pathname;
tree_detector(filename, pathname);

% --- Executes on key press with focus on pushbutton5 and none of its controls.
function pushbutton5_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = handles.filename;
pathname = handles.pathname;
traffic_light(filename, pathname);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = handles.filename;
pathname = handles.pathname;
cat_detector(filename, pathname);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = handles.filename;
pathname = handles.pathname;
h = waitbar(0,'Starting Face Detection...');
pause(2);
face_detection(filename,pathname);
%waitbar(1/6);

 waitbar(1/6,h,'Starting Warning sign Detection...');
pause(2);
warning_sign(filename, pathname);
%waitbar(2/6);

 waitbar(2/6,h,'Starting Car Detection...');
pause(2);
car_detector(filename, pathname);
%waitbar(3/6);

 waitbar(3/6,h,'Starting tree Detection...');
pause(2);
tree_detector(filename, pathname);
%waitbar(4/6);

 waitbar(4/6,h,'Starting Traffic Light Detection...');
pause(2);
traffic_light(filename, pathname);
%waitbar(5/6);

 waitbar(5/6,h,'Starting Cat Detection...');
pause(2);
cat_detector(filename, pathname);
waitbar(6/6,h);
close(h);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
videoFaceDetector();
