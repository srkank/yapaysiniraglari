function varargout = prostat(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prostat_OpeningFcn, ...
                   'gui_OutputFcn',  @prostat_OutputFcn, ...
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


function prostat_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);


function varargout = prostat_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function egtset_Callback(hObject, eventdata, handles)
    [file path]=uigetfile('*.mat','E�itim dosyas�n� se�iniz');
    
    yol = strcat(path, file);
    handles.egs = load(yol);
    set(handles.egtname,'String',file);
handles.output = hObject;
guidata(hObject, handles);
    
       
function tesset_Callback(hObject, eventdata, handles)
    [file path]=uigetfile('*.mat','E�itim dosyas�n� se�iniz');
    
    yol = strcat(path, file);
    handles.tes = load(yol);
    set(handles.testname, 'String', file);
handles.output = hObject;
guidata(hObject, handles);


function yontem_Callback(hObject, eventdata, handles)
    contents = cellstr(get(hObject,'String'));
    handles.tur = get(hObject,'Value');
    if(handles.tur == 2)
        ek();
    end
handles.output = hObject;
guidata(hObject, handles);


function yontem_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function calis_Callback(hObject, eventdata, handles)
    
    if(handles.tur == 2)
        
        hf2=findobj(0, 'Type', 'figure', 'Name', 'ek');
        
 
        edt1_ek=findobj(hf2,'Tag', 'epoc');
        val_Form2=str2num(get(edt1_ek, 'String'));
        edt2_ek=findobj(hf2, 'Tag', 'araka');
        val1_Form2=str2num(get(edt2_ek, 'String'));
        
        [dogru, yanlis, yanlislar] = backprop(val1_Form2,1,val_Form2, handles.egs.p, handles.egs.t, handles.tes.ptest, handles.tes.ttest);
        isim = '                           Backpropagation YSA sonu�lar�';
    %else
    %    t = zeros(size(handles.egs.t));
    %    t(2,:) = handles.egs.t;
    %    ttest = zeros(size(handles.tes.ttest));
    %    ttest(2,:) = handles.tes.ttest;
    %    [dogru, yanlis, yanlislar] = perseptron(handles.egs.p, t, handles.tes.ptest, ttest);
    %    isim = '                           Perseptron YSA sonu�lar�';
    end
    sonuc = {isim; strcat('Dogru te�his say�s� :',num2str(dogru)); strcat('Yanl�� te�his say�s� :',num2str(yanlis));strcat('Yanl�� te�his edilen hasta numaralar� :',num2str(yanlislar))};
    set(handles.sonuc,'String',sonuc);
    
handles.output = hObject;
guidata(hObject, handles);

function sonuc_CreateFcn(hObject, eventdata, handles)


function egtname_CreateFcn(hObject, eventdata, handles)


function testname_CreateFcn(hObject, eventdata, handles)
    


% --- Executes on button press in tesdes.
function tesdes_Callback(hObject, eventdata, handles)
    %[p, t] = randtest(45);
    [ptest, ttest] = randtest(19);
    %save('C:\Users\serkan\Desktop\yapaysinir_proje\set\egitimSeti.mat','p','t');
    save('C:\Users\serkan\Desktop\yapaysinir_proje\set\testSeti.mat','ptest','ttest');
handles.output = hObject;
guidata(hObject, handles);

