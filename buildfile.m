function plan = buildfile
    plan = buildplan(localfunctions);
end

function packageTask(~, args)
    arguments
        ~
        args.ID(1,1) string = "00000000-0000-0000-0000-000000000000"
        args.Version(1,1) string = ""
    end

    if args.Version == ""
        error("build:package:versionNotSet", "Please provide a package version number");
    end

    if startsWith(args.Version, "v")
        versionNumber = extractAfter(args.Version, 1);
    else
        versionNumber = args.Version;
    end

    toolboxFolder = fullfile(pwd, "toolbox");

    toolboxOptions = matlab.addons.toolbox.ToolboxOptions( ...
        toolboxFolder, args.ID ...
    );

    toolboxOptions.ToolboxName = "Sample";
    toolboxOptions.ToolboxVersion = versionNumber;

    toolboxOptions.OutputFile = fullfile( ...
        pwd, sprintf("sample-%s.mltbx", toolboxOptions.ToolboxVersion) ...
    );

    matlab.addons.toolbox.packageToolbox(toolboxOptions);
end
