# dockerfiles

This repository contains a generator for [Dockerfiles](http://www.docker.com).

```text
node generator.js <config-file> --build --push
```

A typical configuration file looks like that:

```json
[
    {
        "template": "template.tpl",
        "resources": true,
        "resourceNamePattern": "resource-file-name-${any-variable-defined}-final.*",
        "name": "${os}_${java}_${product}",
        "repository": "<your-name>/<your-docker-repository-name>",
        "variables": [
            [
                { "os": "debian-squeeze" },
                { "os": "debian-wheezy" },
                { "os": "ubuntu-14.04" }
            ],
            [
                {"java": "oracle-7-jdk"},
                {"java": "oracle-8-jdk"}
            ],
            [
                {"product": "1.0.0"},
                {"product": "2.0.0"}
            ]
        ]
    }
]
```

As you see the file's content is an array of config objects, which
means that multiple configurations can be contained in one file.

Each configuration object got it's own template file which is a placeholder
for the resulting Dockerfile.

The template is filled with the variables defined in the configuration file.

The example above would result in 12 Dockerfiles (each in their own folder)
because of the combinations of each variable value defined:

* debian-squeeze - oracle-7-jdk - 1.0.0
* debian-squeeze - oracle-7-jdk - 2.0.0
* debian-squeeze - oracle-8-jdk - 1.0.0
* debian-squeeze - oracle-8-jdk - 2.0.0
* debian-wheezy - oracle-7-jdk - 1.0.0
* debian-wheezy - oracle-7-jdk - 2.0.0
* debian-wheezy - oracle-8-jdk - 1.0.0
* debian-wheezy - oracle-8-jdk - 2.0.0
* ubuntu-14.04 - oracle-7-jdk - 1.0.0
* ubuntu-14.04 - oracle-7-jdk - 2.0.0
* ubuntu-14.04 - oracle-8-jdk - 1.0.0
* ubuntu-14.04 - oracle-8-jdk - 2.0.0

In the same hierarchy level as the configuration file is the
`resources` folder which contains the files you need to build
your docker image. The generator script copies the files from the
resources folder into the same folder where the Dockerfile is.

The `resourceNamePattern` config parameter helps to filter
unnecessary files and can contain the parameter values you define.

The `name` parameter corresponds to the name of the folder the
Dockerfile will be saved to.

The `repository` parameter determines the docker repository
the image will be pushed to.

The `variables` parameter take arrays of hashes that define
the values of the combinations your docker images build with.
You can also combine multiple values in on hash to avoid
unnecessary value combinations that would result in their
own Dockerfiles:

```json
"variables": [
    [
        { "os": "debian-squeeze", "dist": "debian" },
        { "os": "debian-wheezy", "dist": "debian" },
        { "os": "ubuntu-14.04", "dist": "ubuntu" }
    ],
    [
        { "java": "oracle-7-jdk", "java_home": "/usr/shared/lib/java/" },
        { "java": "oracle-8-jdk", "java_home": "/usr/shared/lib/java8/" }
    ],
    [
        { "product": "1.0.0" },
        { "product": "2.0.0" }
    ]
]
```

The first variable in the value hash is used to build the name
of the resulting docker image. The rest is merely available in the
template.

A typical template would look like that:

```text
FROM any-docker-repository:${os}_${java}

ADD resource-file-name-${any-variable-defined}-final.tar.gz /usr/share/
RUN ...

CMD ['/usr/share/resource-file-name-${any-variable-defined}-final/bin/start.sh']
```

The goal of this generator is to produce easy to configure docker images
for testing software with different versions of standard software
(like java, tomcat, jetty, etc.) The docker images built with this
generator should be considered as base images for your own images.
