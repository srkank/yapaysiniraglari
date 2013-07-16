function varargout = ek(varargin)
% EK M-file for ek.fig
%      EK, by itself, creates a new EK or raises the existing
%      singleton*.
%
%      H = EK returns the handle to a new EK or the handle to
%      the existing singleton*.
%
%      EK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EK.M with the given input arguments.
%
%      EK('Property','Value',...) creates a new EK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ek_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ek_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ek

% Last Modified by GUIDE v2.5 18-May-2013 05:17:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ek_OpeningFcn, ...
                   'gui_OutputFcn',  @ek_OutputFcn, ...
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


% --- Executes just before ek is made visible.
function ek_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ek (see VARARGIN)

% Choose default command line output for ek
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ek wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ek_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function epoc_Callback(hObject, eventdata, handles)
    %get(hObject,'String');
    handles.epoc = str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function epoc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epoc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function araka_Callback(hObject, eventdata, handles)
   % get(hObject,'String');
    handles.arakat = str2double(get(hObject,'String'));
handles.output = hObject;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function araka_CreateFcn(hObject, eventdata, handles)
% hObject    handle to araka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



    


% --- Executes on button press in oke.
function oke_Callback(hObject, eventdata, handles)
   ek('Visible','off')
    
