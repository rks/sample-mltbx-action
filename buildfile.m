function plan = buildfile
    plan = buildplan(localfunctions);
end

function packageTask(~, args)
    arguments
        ~
        args.Version(1,1) string = ""
    end

    if args.Version == ""
        error("build:package:versionNotSet", "Please provide a package version number");
    end

    fprintf("packaging version %s\n", args.Version);
end
