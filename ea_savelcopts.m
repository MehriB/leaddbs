function ea_savelcopts(handles)

isindependent = getappdata(handles.leadfigure, 'isindependent');

lc = ea_handles2lc(handles);
ea_storemachineprefs('lc',lc)

if ~isindependent
    delete(handles.leadfigure);
    return
end
