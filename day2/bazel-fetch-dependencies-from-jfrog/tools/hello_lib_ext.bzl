load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _hello_lib_ext_impl(module_ctx):
    http_archive(
        name = "hello_lib",
        urls = [
            "http://172.17.0.3:8082/artifactory/my-repo/hello_lib-1.0.0.tar.gz",
        ],
        strip_prefix = "hello_lib-1.0.0",
        # sha256 = "...",  # strongly recommended
    )

hello_lib_ext = module_extension(
    implementation = _hello_lib_ext_impl,
)

