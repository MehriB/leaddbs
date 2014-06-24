%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 4252 $)
%-----------------------------------------------------------------------

function ea_normalize_ptspecific_atl(options)

troot=[options.earoot,'templates',filesep,'segment',filesep];
aroot=[options.earoot,'atlases',filesep,options.atlasset,filesep];
proot=[options.root,options.patientname,filesep];

force=1; % always re-process..


% make directories in patient folder
mkdir([proot,'atlases']);
mkdir([proot,'atlases']);
mkdir([proot,'atlases',filesep,options.atlasset]);
mkdir([proot,'atlases',filesep,options.atlasset,filesep,'lh']);
mkdir([proot,'atlases',filesep,options.atlasset,filesep,'rh']);
mkdir([proot,'atlases',filesep,options.atlasset,filesep,'mixed']);
mkdir([proot,'atlases',filesep,options.atlasset,filesep,'midline']);

atlases=ea_genatlastable(options.earoot,options);

for atlas=1:length(atlases.names)
    switch atlases.types(atlas)
        case 1 % left hemispheric atlas.
            natlf=[proot,'atlases',filesep,'native',filesep,options.atlasset,filesep,'lh',filesep];
            patlf=[proot,'atlases',filesep,options.atlasset,filesep,'lh',filesep];
        case 2 % right hemispheric atlas.
            natlf=[proot,'atlases',filesep,'native',filesep,options.atlasset,filesep,'rh',filesep];
            patlf=[proot,'atlases',filesep,options.atlasset,filesep,'rh',filesep];
        case 3 % both-sides atlas composed of 2 files.
            nratlf=[proot,'atlases',filesep,'native',filesep,options.atlasset,filesep,'rh',filesep];
            pratlf=[proot,'atlases',filesep,options.atlasset,filesep,'rh',filesep];
            nlatlf=[proot,'atlases',filesep,'native',filesep,options.atlasset,filesep,'lh',filesep];
            platlf=[proot,'atlases',filesep,options.atlasset,filesep,'lh',filesep];
        case 4 % mixed atlas (one file with both sides information.
            natlf=[proot,'atlases',filesep,'native',filesep,options.atlasset,filesep,'mixed',filesep];
            patlf=[proot,'atlases',filesep,options.atlasset,filesep,'mixed',filesep];
        case 5 % midline atlas (one file with both sides information.
            natlf=[proot,'atlases',filesep,'native',filesep,options.atlasset,filesep,'midline',filesep];
            patlf=[proot,'atlases',filesep,options.atlasset,filesep,'midline',filesep];
    end
    
    for side=detsides(atlases.types(atlas))
        if atlases.types(atlas)==3
            switch side
                case 1
                    natlf=nratlf;
                    patlf=pratlf;
                case 2
                    natlf=nlatlf;
                    patlf=platlf;
            end
        end
        % gzip support
        
        if strcmp(atlases.names{atlas}(end-2:end),'.gz')
            gunzip([natlf,atlases.names{atlas}]);
            atln=atlases.names{atlas}(1:end-3);
            wasgz=1;
        else
            atln=atlases.names{atlas};
            wasgz=0;
        end
        
       
        
        if ~exist([patlf,atlases.names{atlas}],'file') || force
            
          
            
            
            % apply original transformation back to warped atlas.
            matlabbatch{1}.spm.util.defs.comp{1}.def = {[proot,'y_ea_normparams.nii']};
            matlabbatch{1}.spm.util.defs.ofname = '';
            matlabbatch{1}.spm.util.defs.fnames = {[natlf,atln,',1']};
            matlabbatch{1}.spm.util.defs.savedir.saveusr = {patlf};
            matlabbatch{1}.spm.util.defs.interp = 1;
            jobs{1}=matlabbatch;
            cfg_util('run',jobs);
            clear matlabbatch jobs
            
            movefile([patlf,'w',atln],[patlf,atln]);
            
            
            % re-gzip tpm, patl and atlas file.
            if wasgz
                try gzip([natlf,atln]); end
                try delete([natlf,atln]); end
                try gzip([patlf,atln]); end
                try delete([patlf,atln]); end
            end
        end
        
        
        
    end
    
    
    
    
end




function sides=detsides(opt)

switch opt
    case 1 % left hemispheric atlas
        sides=1;
    case 2 % right hemispheric atlas
        sides=2;
    case 3
        sides=1:2;
    case 4
        sides=1:2;
    case 5
        sides=1; % midline
        
end
