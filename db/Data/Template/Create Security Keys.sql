DECLARE @tblSecurityKeys TABLE (Id INT IDENTITY(1,1), SecurityKey VARCHAR(300), [Description] VARCHAR(300), Parent VARCHAR(300))

INSERT INTO @tblSecurityKeys (SecurityKey, [Description], Parent)
SELECT SecurityKey, [Description], [ParentKey]
FROM (
	-- SELECT 'Dashboard' AS SecurityKey, 'Dashboard' AS [Description], '' AS ParentKey
	-- UNION ALL
	-- SELECT 'Inventory' AS SecurityKey, 'Inventory' AS [Description], '' AS ParentKey
) tmp

DECLARE @cnt INT = 1

WHILE @cnt <= (SELECT COUNT(*) FROM @tblSecurityKeys)
BEGIN 
	INSERT INTO tblSecurityKeys(SecurityKey, [Description], ParentId)
	SELECT sk1.SecurityKey, sk1.[Description], sk.Id
	FROM @tblSecurityKeys sk1 
	LEFT OUTER JOIN tblSecurityKeys sk ON sk1.Parent = sk.SecurityKey
		WHERE sk1.Id = @cnt
		AND NOT EXISTS (SELECT Id FROM tblSecurityKeys WHERE SecurityKey = sk1.SecurityKey)
	
	SET @cnt = @cnt + 1
END

-- UPDATE tblSecurityKeys SET [CheckSum] = 'dsadwaddsadw' WHERE SecurityKey = 'Account.New' 