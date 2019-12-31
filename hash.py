# -*- coding: utf-8 -*-
"""
Created on Sun Dec 29 19:25:14 2019

@author: Lee
"""

import hashlib

# 双重哈希函数
def sha256d(string):
    if not isinstance(string,bytes):
        string=string.encode()
    
    return hashlib.sha256(hashlib.sha256(string).digest()).hexdigest()
    
    
print(sha256d('I love China!'))