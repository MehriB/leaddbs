% dedirs_ge_21
% SuS Jan2008 (copied from ika)


function DE_scheme = dedirs_ge_21(nob0s)

if nargin == 0
    DE_scheme = [-0.549492281923 -0.499531375822 -0.669721312694; ...
        -0.229274217564 0.798245119516 0.556990181538; ...
        0.051584885924 -0.126471373803 -0.990628079126; ...
        -0.880573755176 -0.472011665596 0.042365661057; ...
        0.874734231412 0.472842236169 -0.106114297292; ...
        0.464585318035 0.484632949097 -0.741141947885; ...
        0.517653358822 0.668752788677 0.533670973294; ...
        -0.214762501849 0.160053900575 0.963462410637; ...
        0.178941144896 -0.784300408657 -0.594014255422; ...
        -0.517841089726 -0.483670070722 0.705623035677; ...
        -0.594929339937 0.796921583984 -0.104761965723; ...
        0.586167742727 -0.809073263040 0.042518612639; ...
        0.211591983303 -0.690878714671 0.691314280351; ...
        0.180352667723 0.967957510562 -0.174731717191; ...
        0.511467833181 -0.015518531629 0.859162284319; ...
        -0.318668087641 0.525871531163 -0.788612568142; ...
        -0.893219122289 0.152006707555 -0.423147208943; ...
        -0.254923991529 -0.965694963273 0.049467124975; ...
        -0.864507633341 0.245460494780 0.438606540533; ...
        0.946614484046 -0.182258255989 0.265900257086; ...
        0.793779200124 -0.243314387822 -0.557416083486; ...
        ];
elseif nargin == 1
    DE_scheme = [zeros(nob0s,3);...
        -0.549492281923 -0.499531375822 -0.669721312694; ...
        -0.229274217564 0.798245119516 0.556990181538; ...
        0.051584885924 -0.126471373803 -0.990628079126; ...
        -0.880573755176 -0.472011665596 0.042365661057; ...
        0.874734231412 0.472842236169 -0.106114297292; ...
        0.464585318035 0.484632949097 -0.741141947885; ...
        0.517653358822 0.668752788677 0.533670973294; ...
        -0.214762501849 0.160053900575 0.963462410637; ...
        0.178941144896 -0.784300408657 -0.594014255422; ...
        -0.517841089726 -0.483670070722 0.705623035677; ...
        -0.594929339937 0.796921583984 -0.104761965723; ...
        0.586167742727 -0.809073263040 0.042518612639; ...
        0.211591983303 -0.690878714671 0.691314280351; ...
        0.180352667723 0.967957510562 -0.174731717191; ...
        0.511467833181 -0.015518531629 0.859162284319; ...
        -0.318668087641 0.525871531163 -0.788612568142; ...
        -0.893219122289 0.152006707555 -0.423147208943; ...
        -0.254923991529 -0.965694963273 0.049467124975; ...
        -0.864507633341 0.245460494780 0.438606540533; ...
        0.946614484046 -0.182258255989 0.265900257086; ...
        0.793779200124 -0.243314387822 -0.557416083486; ...
        ];
elseif nargin > 1
    disp('Error: too many input parameters');
end
DE_scheme = [DE_scheme(:,2) DE_scheme(:,1) -DE_scheme(:,3)];