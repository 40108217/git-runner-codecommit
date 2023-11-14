terraform{
    backend "s3" {
        bucket = "40108217"
        key = "test.tfstate"
        region = "us-east-1"
        
    }
}