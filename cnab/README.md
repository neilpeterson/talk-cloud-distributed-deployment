# Porter bundle for Azure Twitter Sentiment

Twitter Sentiment application can be found here - https://github.com/neilpeterson/twitter-sentiment-for-kubernetes.

## Prerequisites

- Azure Service Principal
- Twitter API Access Keys
- Azure Kubernetes Cluster with Helm v2.14.0 or > installed

## Porter Credentials

Create a file named `~/.porter/credentials/creds.yaml` and add the following credentials. Each will need to be updated with your environment specific values.

```
name: twitter-sentiment
credentials:
- name: azureclientid
  source:
    value: 00000000-0000-0000-0000-00000000000
- name: azureclientsecret
  source:
    value: 00000000-0000-0000-0000-00000000000
- name: azuretenantid
  source:
    value: 00000000-0000-0000-0000-00000000000
- name: subscriptionid
  source:
    value: 00000000-0000-0000-0000-00000000000
- name: twitterConsumerKey
  source:
    value: 0000000000000000000000000
- name: twitterConsumerSecret
  source:
    value: 00000000000000000000000000000000000000000000000000
- name: twitterAccessToken
  source:
    value: 000000000-00000000000000000000000000000000000000000
- name: twitterAccessTokenSecret
  source:
    value: 00000000000000000000000000000000000000000000000000
```

## Porter Commands

Build the bundle.

```
porter build
```

Install the bundle.

```
porter install --param resource-prefix=porter-twitter-demo --param search-text=pizza --cred twitter-sentiment
```

List the installed Porter bundles.

```
$ porter bundle list
NAME                CREATED          MODIFIED        LAST ACTION   LAST STATUS
twitter-sentiment   14 minutes ago   3 minutes ago   install       success
```

Uninstall the porter bundle.

```
porter uninstall twitter-sentiment --cred twitter-sentiment
```
