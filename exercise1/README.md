# Bucket Exercise

In this exercise, a bucket was created using `Cloudformation`. This bucket is configured as a static website and contains just one file named `curlme.txt`.

![alt text](https://github.com/vinixnan/cloudtest/blob/main/diagram/ex1.png?raw=true)

You can open the `http://ftf.vinicius.bucket.exercise.s3-website-us-east-1.amazonaws.com/curlme.txt` or run:

```sh
curl http://ftf.vinicius.bucket.exercise.s3-website-us-east-1.amazonaws.com/curlme.txt
```

## Files Description

| File  | Description  |
|---|---|
| cloudform.yaml  | The cloudformation file resposible by creating the bucket and associated policies  |
| run.sh  | Runs `aws cloudformation create-stack` and `aws s3 cp`  |
| resources/curlme.txt | Just a simple txt file |
