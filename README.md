Dynamo with Docker container
===================

## Dependencies

* docker-machine 0.4.1 and more
* docker-compose 1.4.0 and more

当リポジトリは、docker-machine環境下での実行を例としています。

## Usage

Build Docker Image 

```
$ docker-compose build
```


Run Dynamo Containerを起動

``` bash
$ docker-compose up
```

table listを表示

``` bash
$ aws dynamodb list-tables --endpoint-url http://192.168.99.100:8080
{
  "TableNames": []
}
```

テーブル作成

``` bash
$ aws dynamodb create-table --endpoint-url http://192.168.99.100:8080 --table-name test --attribute-definitions AttributeName=testId,AttributeType=S --key-schema AttributeName=testId,KeyType=HASH --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1
```

table listを表示

``` bash
$ aws dynamodb list-tables --endpoint-url http://192.168.99.100:8080
{
    "TableNames": [
        "test"
    ]
}
```
