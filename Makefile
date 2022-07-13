# Must have `sentry-cli` installed globally
# Following variables must be passed in

SENTRY_AUTH_TOKEN=284dc157d9bb41a0aa022bf20e13390d79e318ed946c4cea8b18af3455069e9c
SENTRY_ORG=swastik-dq
SENTRY_PROJECT=javascript-react

REACT_APP_RELEASE_VERSION=`sentry-cli releases propose-version`

setup_release: create_release upload_sourcemaps

create_release:
	sentry-cli releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(REACT_APP_RELEASE_VERSION)

upload_sourcemaps:
	sentry-cli releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) files $(REACT_APP_RELEASE_VERSION) \
		upload-sourcemaps --url-prefix "~/static/js" --validate build/static/js