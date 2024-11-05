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

    if startsWith(args.Version, "v")
        versionNumber = extractAfter(args.Version, 1);
    else
        versionNumber = args.Version;
    end

    fprintf("packaging version %s\n", versionNumber);
end
