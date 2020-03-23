import boto3
import os
import logging
import sys

logging.basicConfig(level=logging.INFO)

class shipamax_s3_utils:
    '''
    utility class to manage AWS S3 bucket operations
    This currently only implements file copy to S3 bucket
    For simplicity, it leverages existing AWS credentials
    '''
    def __init__(self):
        '''
        instantiate class
        '''
        self.s3 = boto3.client('s3')
        logging.debug("class instantiated")
        

    def upload_doc_to_bucket (self, file_to_upload, location, destination_name):
        '''
        helps load doc to S3 location
        '''
        if not os.path.exists(file_to_upload):
            logging.error("File '%s' does not exist." % file_to_upload)
            return
        logging.info ("Attempting to load document %s" % file_to_upload )
        try:
            self.s3.upload_file(file_to_upload, location, destination_name)
        except:
            logging.error("error during upload : %s" % sys.exc_info()[0])
            raise
        logging.info("Success")

if __name__ == "__main__":

    ' a simple test'
    doc_to_load = "some_document"
    bucket_name = "some_bucket"
    save_as = "name_in _bucket"
    doc_mgt = shipamax_s3_utils()
    doc_mgt = doc_mgt.upload_doc_to_bucket(doc_to_load, bucket_name, save_as)

