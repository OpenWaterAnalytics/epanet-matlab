function [errcode,vx,vy,vertx,verty] = getNodeXY(InpFname,DLLname,Hname)
%   Reads Epanet data file to get node coordinate info (no toolkit function
%   for this task).

global EN_SIZE;

% Copy epanet input file to temporary file
tempInpFname = tempname;
copyfile(InpFname,tempInpFname);

% Open Epanet 
[errcode] = ENMatlabSetup(DLLname,Hname);
if errcode ~=0 return; end
[errcode] = ENopen(tempInpFname,'epanet.rpt','');
if errcode ~= 0 return; end

% Initialize 
vx = NaN(EN_SIZE.nnodes,1);
vy = NaN(EN_SIZE.nnodes,1);
vertx = cell(EN_SIZE.nlinks,1);
verty = cell(EN_SIZE.nlinks,1);
nvert = zeros(EN_SIZE.nlinks,1);

% Open epanet input file
[EPANETIN,errmsg] = fopen( InpFname, 'rt' );
if EPANETIN < 0
    disp errmsg
    return
end

sect = 0;
% Read each line from input file.
while 1
    tline = fgetl(EPANETIN);
    if ~ischar(tline),   break,   end

    % Get first token in the line
    tok = strtok(tline);

    % Skip blank lines and comments
    if isempty(tok), continue, end
    if (tok(1) == ';'), continue, end

    % Check if at start of a new COOR or VERT section
    if (tok(1) == '[')
        % [COORDINATES] section
        if strcmpi(tok(1:5),'[COOR')
            sect = 1;
            continue;
        % [VERTICES] section
        elseif strcmpi(tok(1:5),'[VERT')
            sect = 2;
            continue;
        % [END]
        elseif strcmpi(tok(1:4),'[END')
            break;
        else
            sect = 0;
            continue;
        end
    end
    
    if sect == 0
        continue;
    
    % Coordinates
    elseif sect == 1
        A = textscan(tline,'%s %f %f');
        % get the node index
        [errcode,index] = ENgetnodeindex(char(A{1}));
        if errcode ~=0 return; end
        vx(index) = A{2};
        vy(index) = A{3};
    
    % Vertices
    elseif sect == 2
        A = textscan(tline,'%s %f %f');
        [errcode,index] = ENgetlinkindex(char(A{1}));
        if errcode ~=0 return; end
        nvert(index) = nvert(index) + 1;
        vertx{index}(nvert(index)) = A{2};
        verty{index}(nvert(index)) = A{3};
    end
end

% Close Epanet
[errcode] = ENclose();
if errcode ~= 0 return; end
ENMatlabCleanup();

% Close Epanet input file
fclose(EPANETIN);
