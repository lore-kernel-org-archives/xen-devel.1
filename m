Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897BD606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=HAJi+jOU;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=lipeUAuj;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=AdbOw6t5;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=Vf4p7Viw
Received: from list by lists.xenproject.org with outflank-mailman.1486344.1689086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRZQF-0005nI-9H; Thu, 12 Nov 2026 18:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486344.1689086; Thu, 12 Nov 2026 18:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRZQF-0005nB-5V; Thu, 12 Nov 2026 18:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1486344;
 Thu, 12 Nov 2026 18:21:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xRZQD-0005mp-D4
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 18:21:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRZQC-00EwI8-Q4
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 19:21:16 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af6038b-bab6-0a2a0a5309dd-0a2a450ac8b8-22
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 19:21:11 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6af60395-f2d2-0a2a450a0019-94a38ff114a4-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 19:21:10 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFbZcO1050125
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 18:21:09 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011006.outbound.protection.outlook.com [52.101.62.6])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hwew8383d-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 18:21:08 +0000 (GMT)
Received: from CY5PR18CA0027.namprd18.prod.outlook.com (2603:10b6:930:5::30)
 by PH8PR16MB941215.namprd16.prod.outlook.com (2603:10b6:510:40a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 18:21:03 +0000
Received: from MW3PEPF00001653.namprd21.prod.outlook.com
 (2603:10b6:930:5:cafe::8d) by CY5PR18CA0027.outlook.office365.com
 (2603:10b6:930:5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 12 Nov 2026 18:21:03 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 MW3PEPF00001653.mail.protection.outlook.com (10.167.249.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.2
 via Frontend Transport; Thu, 12 Nov 2026 18:20:47 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ACFeHRY2307308
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:20:47 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hvjh2a1w3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 13:20:47 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id RZPgxD62NvYgURZPhx1oH3; Thu, 12 Nov 2026 18:20:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:Message-ID:MIME-Version:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=XVglSaZMVr7JMstT3Hg92mLnS
	N8Wy4/trnWU7heZNVk=; b=HAJi+jOUvxhTmY+M22ArekOI5f+NOgmTfulC9P8zQ
	Xd/qktgHd758lsZSpybHBsUzMvGbDXZ3HFjJ6+1rGHG9nMxm8zjJkl3Hdpc1/BHN
	a2CIclYy2XcOz4moYibc1rV/NrXqge7wL8U7grpCNIz5ogICZRvpT/hbCODtS0gP
	aTeVnEQrMqXI3guyII5KvEpw8W2TysUE532iwWOWPzFer1KRyxsPO9IDPh91v3pt
	nJYxRicuXgbvk7LGE/nCmOY5yUFCM81uceMANQqH38WBjjbxwJIHXkysz74TNaaP
	oGjbA9wj5L4eaOVAg7fByu4vX1pKo7ZJ/VaF2fdFmxBpA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPp3hurt6VBAo90iaJseBnuvKtmAnTbUokEmsQKPPwiaCz50gjgYxBP0mI1yZ76tHeuvpaC8fVU/9qLwQy7iFH41jYL0Ix5GEq5Cv7X4f1ggpm0gXyU8wviWRuwp9j5vaejDqe1oufNUhotmXmuqjltRlMGmxdLtDTp050uAKP9NnpsRiBK7kaRyAeJIreSqIZXwCvhPH//CnrG1ZhiyGDyQZYmfXywLpc6joWxORYXGLC092f6QQz/IKX1k9j6Nl4tBfQWh9Oku6LL09xLQCPI+ZLyUOUq+Eme+JsrvjNEUbpSZbpl1D4xRQP6VU7G6VhFguUazRqxJlchIc9JcFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVglSaZMVr7JMstT3Hg92mLnSN8Wy4/trnWU7heZNVk=;
 b=qPOAlbc0cG/1TiLIQe96ZfkQg5/bt9iIW6XYqWKowM4NQYKFxV+l2wwkQZwDLO/H2yNXY7WFo1aNCleQ34W8K9buERfHb6dmKJVHr0ERojSj/rBLtpKKfLwwQhj6XriMtpAtRyVnVJmTRI+uVimY3bSNa8svllXZoqPn0vdRHUarFWbWDVpwghkTjIK4aQXRddYaTCQdSg+17qRUiM5ecWAupPSZM3iuJ4dAI8pqidHziXHza+3tvovd9Cy1lGQPEr3tKTQ1WBOFedk+SAT3v98SAGYJ+rAeBgceLIzxFrb959BbSpVG6PgUozapTfqon8w+EMh9gr5NSxGbpjV3Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVglSaZMVr7JMstT3Hg92mLnSN8Wy4/trnWU7heZNVk=;
 b=lipeUAujQ/AqIMNHW34XFth7DnaeX9dJPQ/qh0B448x/Z2Wg5mruhLIOBB/qkDwWaadaJIc8EWI2VMUMqCVL2KzfBsu9yeB1HFzP8K+cERjazwamOyMgm5EmBheNd6o7ROo2pL7WQSMqNZmkm5hjfZQrqW4oN22LxLEdh/MpAYo=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=XVglSaZ
	MVr7JMstT3Hg92mLnSN8Wy4/trnWU7heZNVk=; b=AdbOw6t55FpbTKHdGjae1fV
	PoD7WJZeRucdqWhPOgsTMMKpB/0kzfA9oknxemyIeSG6nk7FhQkw3zbo1v9x23hD
	KDjrXOX2m+h1SVi2Q0u7Yr6eavXbPOeF9K4zQ7vimsC2Mr+06kXlkzZOt1WRnt7K
	ETQoAGFE3+02BAN6yCVOyX5D7mvz7VimQvnL4QL6qluZyqGBsb6oQjsJC8+LUboj
	QsNdxYk0APRCh3TM2iddihH3BHJubHZu+KL9oIkkrbpzwfifNuBCb5grqYq9g0wh
	2lkNXbRz4I5u0zbZww7jItCGZPEKNjX2jL/CmTrgKOvqQt3ByrfP+MWvyMhhpgA=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=XVglSaZMVr7JMstT3Hg92mLnSN8Wy4/
	trnWU7heZNVk=; b=Vf4p7ViwlAw5z4NkxJjIvL8rXtb+slIYcrDAVfixioMI3qC
	HJoQTHZzeUskl8H4NUrGftFxIQbvngUHXKBj8KWb9TtPPe+INCNUXT698ggnpLCh
	mb9NwriY2tGcFRvAYqhEui+yb9Uj3PbztdKzmkCt4Y0gs5r0xr4O6CHbUEeWO7MF
	ePyG8lruf2drFoiFk52IfGhd18iUisnehxP/bJ0cjRm5J+xKLiZiwVp1eVDQwBOf
	JU3Jv3u4gpVaovrJ3MwPOg5wefJNZyD4fS4WJLryhLNm3C06ajaqwdbaIXUBoTC+
	CfmmO9G2A0d1bfwiLXEwd0g/tntvqdnyM+I7o5w==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: RZPgxD62NvYgURZPhx1oH3
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v6 0/2] xen/console: updates to rate-limiting
Date: Thu, 12 Nov 2026 10:20:40 -0800
Message-ID: <20261112182042.1104699-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120072
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001653:EE_|PH8PR16MB941215:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9d21ebb2-2f29-4cee-eb70-08df40e9acd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|261022113327099003|11063799006|56012099006|260925022911599003|260925021311599003|260925021911599003|10067099003|261022075727099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HxfbH5IRdb+OAeTPgUBhLchVKY0wX24/RRZpXyhKWjpN74e22KoTw7F5LwmeQNnnW0Po1kVW3/Ahb2O7TtlqYHaZUgnYHBDQCOi3pAQMjQRIbwxpuuHCTmbKyP4I+9ylYdhyV5PKbFOHlsDTT0WDyioc89BCExzUkQ7ZYNlXgGv0JAa58c24g0DdUAUW1W6x+Z68iuTFJy9xgdfPz0ozmlCcRRx/BLC76O2A2g5Hjep0pX87TzaJoqjQ7Ecu5ptlRsg97wBH+jEgu9a1TrBfoxuWFBCgkPb74CNKGmb8fuWHPkJlmeGvUceY17ZSO68FgQUZv9h8iR4HffFT7O0Z6PIlkPN/hIUeigbziwECW+dzw2nufoSShTLELGhuRld4YrUbvon10S9diKzJuaBZBrWfxTxoCUsNB2tQSMoSKlNFb2fjJIrxQjUDUB6P9VUWFar4KD2uUqt1F9xd3bgy1uM+98RnQgoqWYxR7/upCyNnQDdc7ImNEwmiK20w5Oasg75m6zYj3TjrbDDsXHrWVElmlbrJViWYVDkimmjk0pd2BN7jaMn9ZTLDYZOlUTPUwLvANYLmeIReidaowu/9KUuK5CkGuQRDEVltqHbBZgxRoy4rZEKO/ZFx61tHnpFd8ggzyOu0v9rV7WrVuQSEvg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(261022113327099003)(11063799006)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(261022075727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+0c0Sw7tvr7R7wyswLgNx4IXPRPrU5MtRUStZ+jL6vxC/2bagPy/FNU8c4cspvG4sildXshcefBnN1zxspFMtmd6llw2TCnUQQIHi0DSwnnJOwK0BmK28nSEKI9xd7Mv9BmcT7mxVYZaoTVA8AwjRDSPu/ujJvfRgstRe4WBcfL4fCQHtBQKLFaKpHjEJdmDCZNfsV4Wote2cKZY5NafKVsmfWn10CaxjDlxZSQgtEGfJfNZ3O4fJw44nWblN9x2OsXqLeNjpVniY3gY/Ewghqu/kEDDQsT5CCetSnCVTeMcOrW6oge+GB8/TAxNLcnRnXU+BEVmTHxr+kqiJAbVUubM1343KRs2R3hIzSMj6AzKbTjn4XWbc40Oaq3curnlc9L5Bx5lu/DegVDB1wEQL6s0hL/iTqlmMUi/Arp6VxpJjGc4Uux2ipq8o+BiIT/o
X-Exchange-RoutingPolicyChecked:
	Yv+NYn1x8nUMNt7zbt4OevzWjgM3YJNsGrSNdVKrHMb+eMCw3hiRCaL++yPIRthaV9oEqQR/Kmri4iSdggpAVvH8/6BTVYuaZm48vXNY6AACi2nRSHszUEEDIDEvhmG22ep2KFhrE5QihpGqRnOSR2Gf+NwhHEknaFuUMaL9hB3DFQkew0ag/ktt+OS1If5y3DEtdt/vwm1Ue0vYfrxkkN3NfAr8ba7yQj7ScI7aZlsaxc7CrkU29nGhtMRd2aEPom6s8NQQlW3XOlUcCDjNoRuQtbUcd5eY1v7JNOpZh1S+F8LlKErW3WUGoR+eo6f3UrPiYeaQ7nexegBKwlOA6g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Roha6AbRfOefiE37DRoTR8VsKPuIH8wYfqrVaJgdZpJQAXPwuAAzaITkmm/gKcuEBx2N6bMA4/6hS+bTHBEWsJANzYsqAgjIsvBRKLuiB9SRmszc4whJR87/6K6ERq1DlV8SaxQcQgkznIjHFmvQLCMRvpjvRmome6kx90xACxLaIh3UY3+f5U7oitAMIq4EgqCGDISpeNM3upn8Fi6CPWiUfS/GXmPhwLq/POKcjjS21V+GOF6MH18tdoD5QqgeYIacG6xK7D8H55dRCDAdC+sZC23C07lxi/UuJvVr0qGvVOh7Mh3PbwTOuzYiGdlMhXowNKA8RrEYE88qE2N+7X29mFHPd2wGPQoA2IY4oswucslmhXiuUktsakdJd6DeFPCWg8JuUsCFxd97/GDcIJCgFYn538BfCQxXZ8XB0G7W+CmNwmRxd5hqI+oOt6BGzG2tsAVE5ooefiH+FoBIkpaUCDr5UocbUNIb5EZsfHkGhJyuMr7oxfPLpSPWzgJ6tVLMH9LILCAINjNmpnfXQo3VeRUBBfT9EjAVvU2pFO1yLeG1q4FhjfX18ouyeh9gPobo0K1auKVboRCjxpi3swsQlbHEWNKM0/JzN+6jFBEKE8Ssz69I3Km6lDnWSBV4hRHvGxtaUJtJA3aaX9cFsQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 18:20:47.9379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d21ebb2-2f29-4cee-eb70-08df40e9acd6
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001653.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR16MB941215
X-Authority-Analysis: v=2.4 cv=duNOmFg4 c=1 sm=1 tr=0 ts=6af60394 cx=c_pps
 a=OmH7RzXgq2BZ7BLjxN5ZDg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=VwQbUJbxAAAA:8
 a=cbNQJ9GKAAAA:8 a=p0WdMEafAAAA:8 a=h3kyZRLOFgqh9XYC3mMA:9
 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: ln5mEzIzTVsTapnOqzDRDWR8E4QBf4Va
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfX6SHlKm/O3a+n
 E/HUxU9xo5LjO0ePeNiGcwxUhGHbCooxciJk+ivScYp1KiJIllTyf54t7d6cNI4/pQRIT4AwnRf
 +Qjm/yRt1uK6msMKqzc0OWpv3jBr3WZMRL2ZV6Y2UpzqkhiXcI4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA3MiBTYWx0ZWRfXyJ0FW97xHYSN
 AVN9i04o6q+SEDSmHNJBYAXpCZlfO9EAFqfQR0nQWmCMKZVSbngbQJvqc2nQcA6h4HoTdYjX+go
 PwUklxZ/yzt6T37XBU7w08sDBcyj/VznwWJqaVmwMvG1JaJQaku1hH76JARB6i6T+OsX6LjVkML
 qXsm6RZUy+OKwVtFfE7WGZOGV9H51Bs1sD8llaWFT0LU3Z0C80iwT7CCja43Q3Obmpb+mBIkSz5
 PXOzX69P9Fp1WIyy3K3DcWZfFJ/audQZQazFxVhWZrbm7LG4GsbPWREXbniydKokG/FJJtTVICX
 x9Dnso+1qIsHaesxX+gfU6soH2U8V1U6xJxFxRUIRVc/pXL/P3ck3OQLkaNh9YF25bdiMsMXxwJ
 RX01NLRDHBc298cC9aZPFPGZNWwrivOPqyiBX+w/K3gB1ki7QTN71lqO/7o6/FfTD++biWnJjTx
 pKgPOGkZv5vOFRxJX6Q==
X-Proofpoint-GUID: ln5mEzIzTVsTapnOqzDRDWR8E4QBf4Va
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120072
X-purgate-ID: tlsNG-4011c0/1794507671-5A3DCCFC-C05CE05E/0/0
X-purgate-type: clean
X-purgate-size: 758
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The series introduces compile-configuration for diagnostic
messages rate-limiting.

Patch 1 introduces compile-time rate-limiting controls.

Patch 2 is a fixup for the rate-limiter to adjust to new compile-time
rate-limiting parameters.

v5: https://lore.kernel.org/xen-devel/20260811233824.1874525-1-dmukhin@ford.com/
CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/3057631284

Denis Mukhin (2):
  xen/console: add build-time rate-limiting controls
  xen/console: re-calibrate rate-limiter based on compile-time options

 xen/common/Kconfig         | 30 ++++++++++++++++++++++++++++++
 xen/drivers/char/console.c | 34 +++++++++++++++++++++++++---------
 2 files changed, 55 insertions(+), 9 deletions(-)

-- 
2.56.0


