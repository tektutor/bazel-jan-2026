# fetch_hello_lib.bzl
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def fetch_hello_lib():
    http_archive(
        name = "hello_lib",
        urls = ["http://172.17.0.3:8082/artifactory/my-repo/hello_lib-1.0.0.tar.gz"],
        strip_prefix = "hello_lib-1.0.0",
    )

