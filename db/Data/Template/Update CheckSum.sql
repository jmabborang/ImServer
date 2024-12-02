-- set active = 1
UPDATE sk
SET sk.Active = 1 
FROM tblSecurityKeys sk
WHERE [CheckSum] IS NULL

SELECT CHECKSUM([Description] + '123456789THISISTHESALT') AS CheckSumValue, sk.SecurityKey, sk.[CheckSum], sk.Active
FROM tblSecurityKeys sk
WHERE [CheckSum] IS NULL