Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C313C606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=Je5G3iSw;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=erfcBUAK;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=GTOsEOIp;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=tT7tJvbV
Received: from list by lists.xenproject.org with outflank-mailman.1473168.1680794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmN3-0004Kn-4i; Thu, 05 Nov 2026 01:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473168.1680794; Thu, 05 Nov 2026 01:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmN3-0004Kc-0I; Thu, 05 Nov 2026 01:34:29 +0000
Received: by outflank-mailman (input) for mailman id 1473168;
 Thu, 05 Nov 2026 01:34:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmN2-0004IS-4n
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:34:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmN1-001wz8-Eg
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:34:27 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdcb9-2eae-0a2a0a5409dd-0a2a4507d75c-42
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:27 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd22-b4ea-0a2a45070019-94a38ff1868c-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:34:27 +0100
Received: from pps.filterd (m0367129.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mrHX890979
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:34:25 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hr99fkww7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:34:25 +0000 (GMT)
Received: from CH5P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::29)
 by PH0PR16MB5183.namprd16.prod.outlook.com (2603:10b6:510:29d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:34:21 +0000
Received: from BN7PEPF000000A8.namprd05.prod.outlook.com
 (2603:10b6:610:1f2:cafe::44) by CH5P221CA0005.outlook.office365.com
 (2603:10b6:610:1f2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:34:21 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN7PEPF000000A8.mail.protection.outlook.com (10.167.245.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:34:20 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nU6g3231477
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:34:19 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnydrnp7y-8
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:34:19 -0500 (EST)
Received: from localhost ([19.12.76.221]) by cmsmtp with ESMTPSA
 id OmMrxwiCZDnFpOmMsx5gs9; Thu, 05 Nov 2026 01:34:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Transfer-Encoding:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppford; bh=/ry
	tJLaOrpToKNYYdwh3BV0gO7/pEbXcSOViRTflAPA=; b=Je5G3iSwG8zKW8nI0Il
	yRsYp1KggvQeUdzEjjQuyWcISPgAoIZcWXusFZUJywd/vfzctquNUA2xpbVHZ2oA
	s49c9uvPFKH2VrSMyIlGjq0fAqjM+QTWNQpWfmL8WWo89TDsHKs9f0scDjhE8j5X
	w0LVb6xKD9YoS1lYAUW9/GshHiptSwVVIMw8Do5XF3pKDqZB8kvVGqgkcUzVbYPb
	/F82zhtQsyeB/QLMUwxrjbEDPFdkvQ5PzvsXx1fkLsubg39ykFU//VtbbTPwId8T
	n5HCts+NLzrbeFGCfLrT+VBETtaeTQsjboLcTdnud53VIN8aCgguU85/j7OjDCiG
	ldA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhZ9hwWCX3syEKEYwKmHkMudbA/p72i12cd9lpTHetNDwFwv4evyKh/wmU0KDBYw9qNEhasOF6U7bXSKwKEZiD9eKKXYEHb2GMmyL30wUkZgTViAEq6q4WVwLNJO5/mdZdg1H8zUMD0lzxAEXrV1YO9CW1fR8pbRcG3e8ZLOpbOewpQKG4jwxOp7PTUdzqu/5lCHDLCaGdKC6Eo0VVUFJtyVOyxwFIGZPP9CLKc/0oQu4NIj4KwUkX6V0kHOq4bUq/l2m9KeS1O0tXZdcb/Y0ymYFNiTNeyyB8jtIJm+7dlmQTvfUryzrWoSFYb8jFuSL2nRIeRSA50jL4WIEGaygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rytJLaOrpToKNYYdwh3BV0gO7/pEbXcSOViRTflAPA=;
 b=NsF55cMiba715zDOShXRt6ypcFjJoyhJMqUD1SysBTYjlijjiV+0w/9pkDjEVnKTo3r8nisO5Ar6BRCXcxb53PTDx69KIZlzPqGBK/sQ1+E6J9ySIdHWJBq+uS5lRMPtmeNjAqskP1ftffQ66FhWoOWyhlc2BWtwciDqgf7apKp+Mm/JkvfNEXDPNh+Cu1+3ADVaWSMcY2HiiJdCs3ksw7TDmcrK7/fEa71bOqjo6M5HLMyede1Xn7apojN2aWHb+AkpaNkM698JrlkXFZ/TjC8nyk80+TAf+tjkxXSPYlbTFkrUuVeBUH04ofjDZ0zf9I429+IYPEKMZj3Ypjz1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rytJLaOrpToKNYYdwh3BV0gO7/pEbXcSOViRTflAPA=;
 b=erfcBUAKWiKEj7PYDlsCFV+JwnSkTjhn8cV6/k6lVt5KYjMjgoXY5r9eQBn1lgG0lx+I5tLC2KrqNWrEIgC+91jPfcFbpp7Ha6iLbq6yPvaUg2rm9LCeI2zU++phkWuWjxHm0ZGkrhokkdOoUr9uOLeO/6n4+np2fUAes+oPyuM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 205.220.161.53) smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	ppserprodsaar; bh=/rytJLaOrpToKNYYdwh3BV0gO7/pEbXcSOViRTflAPA=; b=
	GTOsEOIpprL7gyxNdZsiQK8D4Yzo/wMu6yx7dczMWFYXkMjzb5jX9FqpctWffF8k
	Cer+PGPhy8D4ml++5eIEGreP4qkK8nrQ9wiVAjXk2w+5/1/QKWhYXXfI1sSQV/bx
	0vJez0zGfgSVdE459UTBAm/ABgqwm0W2CzKVa1kyXSz8j3+Z2OrXNH2lYPqEaCTP
	JexY71aHkNa1MwTuCpK2k/lSCpX/bcgxbLHrlEuMsbohLWEof2duSYkrS2dYVIyd
	QgxvPiRpq/omTw7bgbixNpbyIqItJ6xvBkBtR+6dXuCc9/veQfiXCigZ9xU4Zz5D
	kOcAb5XJeTpkRwFvr225eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=/rytJLa
	OrpToKNYYdwh3BV0gO7/pEbXcSOViRTflAPA=; b=tT7tJvbVEihWKbNWlTO13XG
	7lYaSFfneNvvwDEMmsErOVOK7rs+WdPA8/5KY2JCKTHFZ1mIBxWnZvY+QKnDo9TW
	Vqvs/Ly4m4+uwk6RL8k0g/GB6ny6hMLMOS3lGZ9ulfhGoC4SYJyaAOIIHdgITp+J
	Mq35gpwtb1LzY0Sv8cYO6iIvxMzukA3gNHsEhJHNP42AzjZCny+HHjVBFRB7KwaH
	OJfpXbwI2vYfCp/zuTqSc7Jz5tsysZeLGTnuhZnsIypeUMIybpeitcVslY1ggXdN
	330OMw1izLY44vLapNDnr+BMXi33TpWaNnYbLL7sViKOrF5gbsry0Bi4LyWNwbQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmMrxwiCZDnFpOmMsx5gs9
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 04/28] x86/hvm: avic: add domain state initialization
Date: Wed,  4 Nov 2026 17:33:21 -0800
Message-ID: <20261105013347.719392-5-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
References: <20261105013347.719392-1-dmukhin@ford.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A8:EE_|PH0PR16MB5183:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0d2be5b8-95da-4459-68d0-08df3adcea5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Eteuo5GLf8GzO2UvN0vuWVmgdvy/1l/Ii+cQ8nWisG2FF4ofHsl12RaHBofvk4LydgHQhSIkzlXMYLrkwnMnXmiEZl11uRaG8c1Meg4akK/HfV/FWvZm+YLVNXQ/cD/T9gQVSJNEPGjMRQlg3Ur540mQMfEXg67Cvyxgg/NVdEveealoMlF5JbHC3i8Nb80cEsc74FXXLSTtGBWVXHG/hrHUHqzQhwHe0dnkBbIw0sTuYqNDUgsDFcyOJb954mzEGVFkryP6lpdsC9Io6qeXe/NrBtLQrFrZtj6Qk4xAS/SDeoVxpwf+JZSzXpc/izIXnxNdMSrsP+Dd/BjEoXHlGNRbLpWv0tM932tTnjnl8DfZL+C4GxExjlwr3OTAh+OhIAueQgHiYn6exyPGn+qOQEn3xDlQQKCa6P8pDcz8D3lC4+SFgrw6kxqpDNM3WeWSXcdk/3rK0JPpWJ53XruDdAWaK1WX5PA4glKQRn+419kYjn17+M/xkj6TpvcobWfzFXWeaI6UlS8Zrx0k32YjdqY4Cbn8hI3ksfiR2fWN/OlMeVrKfmOxi0XVV9cRtfk7ORZWNEUGjvGzOXFfnPRjsrIkKC0kYDB+8ZB2GJyevO+gbDC0uo3gIkixTAZeuggHpGu4qefnw2jLWaK4i7uiAZEaLVuS0Lt4//p+7KWlE5B8+1ScijpAlgfTxyafq4awkUlzh46l8FcWI8vSCsMrsw==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kdmMjnEr/BKbkI8tOqCENzRgcD2BV4TvT+TWSPDhFBxRhkzFV/917HAYUjKCu2XlBlAYfbqL4Wz1MmkLA/2VQJP3nyX9Xla9I/DOaRLevGJq9x8VlzPOSGsisk18+0x9/LH1Sc3ejfa3HzlLe1SLz6oIISm9w8b+gi3Bxa9Q42pJYZq5Az/5LecIpWTpHs6cLlHuKG/OVunnIDN4zFcKXoldNjiamp1o468VclmLC3C3Rqp0T0LHuzW5U0xYwu7TwRmyuS4CbApyv+kjttyZyD/iuayl4YMQcXsv7MH0p/LWKl9de780dDoyvPeogh1NNfvirAAE84GGs0kFn45FePlddX6zW0nK4Ama3aDT0aoDrjGOiZNNUQw73qsUr1caGNzKhGBFX3XoVtaJBiD0sKSIfDa7PqN9ZtEzkxWQbJl681N+0PYJvKVCoQpFYxNf
X-Exchange-RoutingPolicyChecked:
	yh26y6cnjlc9WruqWkG0fzJBnPHOrHv+zUJGu08CkHbQuCddc/ul34RN6PDUfNeQBG4+D1thaN3tGsE74Ml7mwO3AiyvgJAoAZCVvgKByjy5m0nCmlaE0KCVYPnd2ky2VO0A/N7isoGw41fq3+et5dvNbh7v4g6eG+9o51P3nnZt+iRMz/jApdd3QGMCd0oP2MC6FjGPz/LiULO0rEc5MYDpEkbQ1MAs3TVtQM+NKzxoO1up+lsbjEZWyRgh40BksfP6U6So4/+N00kvHabvbDwnYvXr28Zr4i8iC/0EU7LEgxk9RIE5bSIi8cOl5Fz4YTQryT+7wzvX35C7E0wBWg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HxMAGQSi+xh8ZT8RbPoQQOVKcGdDy2D4DYzOlP7WTKiebRtEi3qHPs01LvwsiujE+0zkts58AbHc5yvRbgyn6QVTqpzCXyyI20TI6FfC44vUzABjOlRGil/VkmVFnA5/HH93lJHp/Ft9bJ1L8SrI/n06d898FK6oeRoJfB4hYJw8jT/7S0QX2KgNiNVJshi3gfh2YiyhS5E4lXLgkDyAZWbTjYtFuKNCw8AxwyMHs7xkfWlGlttbExZ2bExZtBjO2KdnVSRGO1gy58XwItvciIYOmbYFTmLfshiVL+sO0CigO7dB613V2uHErULyV7IkZB2YynGMBOLnS3iz4qHxbdkY+rkGSvhEN/sTya9v1X+gwVHvpa+1sGzEIAtljAS3tyr+0yZ2wFrbgm575SE/isTy0PQRpMHDE7v1urJSmRKfpaW2Scvfg9q+zhGTCMQE7RI0cG88e7RteWjKMrSRKDMLSPA8z0jExJdFvXfeBa2ZKU8wQN8WNyW77YBNV50DVXYhhFQ/LovxPNqH0MnfGpa5vr44go06GOwANcgajpO1aGO4q8djxUKAWpcQmZJEesD15ZgU9rU+Xh3ryTSDqOCREOjK+Wb4katUjv4HEaUqGMQYtpSHVKSDz+ZXQc8CCSYNXGssenhURaQBHvVl5w==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:34:20.5983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2be5b8-95da-4459-68d0-08df3adcea5d
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR16MB5183
X-Proofpoint-GUID: M2S_k9zGP5pFJBsaG4adDjK_75sAOxFm
X-Proofpoint-ORIG-GUID: M2S_k9zGP5pFJBsaG4adDjK_75sAOxFm
X-Authority-Analysis: v=2.4 cv=LcKpeTfi c=1 sm=1 tr=0 ts=6aebdd21 cx=c_pps
 a=Eb813/LJkoRL1pr8t+D1ZA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=X3KReqg2EL6A36SYCKpz:22 a=cbNQJ9GKAAAA:8
 a=zB3gE8vstAoKj83shg8A:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXxt6yiVB3ECx4
 aXxiwdSkY9d1SokJit2rZpLKV4cC83pTdrhPrHkmYT57PAa1aSwKeVbS7Kw9DyTVJbbYNDd1cc9
 ii8w+cFCUOU1r6RyAOcw7nHEQULa5fbE693QUXioamUjG37C6/BTnLK/V7Er4SLh3KPPcmM7zAG
 xWl/f7A0QPwaHGLmzTN+EhL342/N0J+KtapKOVnCOaEkPT27gZCPm57ue3fsD2taVEEgzpvc2V6
 ECByO3miMU7ShTNJMISFUYoFmlgLbUAjyTCvuuonhMddv3/Bdh45RoG9Hp9Mb3fFhpeRwLw/JQ7
 MiQQofRMleNoFTOrgTpC3ZdXqjshr9tAbGuCAulfJBUKTqeuqDrZDgg5im39Vmwq5LUeWXacNV9
 S0eIl06Olan+7d0Wm6rfVpkYWjiuUGbOTaPAM85STsWLp5ADq/LiX4q8Mc4I+HqxbVSmll4+wOI
 3Fr1uV3nSQg2+xb+6Pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXwACeWiCR0vkR
 SQPLloUqZgIDr4Xw/+zaLC0WUNO/k5nyzjjn+q7eCPCEvHUUjvpAEVIQQqgsFJiJrYVDeiFGRHp
 Dz47mLSUYjGlOZoiT/fY295KzqLhvAdZt/3irRQfPN5A8GrbS7as
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-ef75cf/1793842467-A7CD7AE4-1913EE39/0/0
X-purgate-type: clean
X-purgate-size: 7952
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Establish per-domain SVM AVIC backing page mapping and SPA mappings
for APIC physical/logical ID tables. Use MEMF_no_refcount mappings
similarly to Intel's VMX APICv setup.

Gate per-domain AVIC state initialization behind 'svm_avic=' command
line option.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/Makefile            |   1 +
 xen/arch/x86/hvm/svm/avic.c              | 136 +++++++++++++++++++++++
 xen/arch/x86/hvm/svm/avic.h              |  14 +++
 xen/arch/x86/hvm/svm/svm.c               |  20 ++++
 xen/arch/x86/include/asm/hvm/svm-types.h |   8 ++
 5 files changed, 179 insertions(+)
 create mode 100644 xen/arch/x86/hvm/svm/avic.c
 create mode 100644 xen/arch/x86/hvm/svm/avic.h

diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
index 8a072cafd572..7dd16e32a77d 100644
--- a/xen/arch/x86/hvm/svm/Makefile
+++ b/xen/arch/x86/hvm/svm/Makefile
@@ -1,4 +1,5 @@
 obj-y += asid.o
+obj-y += avic.o
 obj-y += emulate.o
 obj-bin-y += entry.o
 obj-y += intr.o
diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
new file mode 100644
index 000000000000..2c0e113ae34e
--- /dev/null
+++ b/xen/arch/x86/hvm/svm/avic.c
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AMD Advanced Virtual Interrupt Controller (AVIC)
+ */
+
+#include <asm/hvm/emulate.h>
+#include <asm/msr.h>
+#include <asm/p2m.h>
+#include <xen/param.h>
+
+#include "avic.h"
+
+bool __read_mostly svm_avic_enable;
+
+static const char __section(".bss.page_aligned.const") __aligned(PAGE_SIZE)
+    avic_apic_access_page[PAGE_SIZE];
+
+static int cf_check avic_parse_cmdline(const char *s)
+{
+    int rc;
+
+    rc = parse_bool(s, NULL);
+    if ( rc != -1 )
+    {
+        svm_avic_enable = !!rc;
+    }
+    else if ( *s == '\0' )
+    {
+        svm_avic_enable = true;
+    }
+    else
+    {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+custom_param("svm_avic", avic_parse_cmdline);
+
+/*
+ * Enable guest accesses to APIC_DEFAULT_PHYS_BASE.
+ *
+ * AVIC walks the nested page table to check access permissions, but
+ * ignores the SPA from the leaf entry and instead uses the address in
+ * VMCB.avic_backing_page.
+ *
+ * Install a mapping so APIC accesses don't trap to Xen while xAPIC is
+ * accelerated.
+ */
+static int avic_set_mmio_p2m_entry(struct domain *d)
+{
+    gfn_t gfn = _gfn(paddr_to_pfn(APIC_DEFAULT_PHYS_BASE));
+    mfn_t mfn = _mfn(virt_to_mfn(avic_apic_access_page));
+
+    return map_mmio_regions(d, gfn, 1, mfn);
+}
+
+static int avic_clear_mmio_p2m_entry(struct domain *d)
+{
+    gfn_t gfn = _gfn(paddr_to_pfn(APIC_DEFAULT_PHYS_BASE));
+    mfn_t mfn = _mfn(virt_to_mfn(avic_apic_access_page));
+
+    return unmap_mmio_regions(d, gfn, 1, mfn);
+}
+
+int svm_avic_domain_initialise(struct domain *d)
+{
+    struct svm_domain *sd = &d->arch.hvm.svm;
+    struct page_info *pg;
+    mfn_t mfn;
+
+    if ( !svm_avic_enable || !has_vlapic(d) )
+        return 0;
+
+    /* AVIC logical APIC ID table */
+    pg = alloc_domheap_page(d, MEMF_no_refcount);
+    if ( !pg )
+        return -ENOMEM;
+
+    mfn = page_to_mfn(pg);
+    clear_domain_page(mfn);
+
+    sd->avic_logical_id_table_mfn = mfn;
+    sd->avic_logical_id_table = map_domain_page_global(mfn);
+
+    /* AVIC physical APIC ID table */
+    pg = alloc_domheap_page(d, MEMF_no_refcount);
+    if ( !pg )
+        return -ENOMEM;
+
+    mfn = page_to_mfn(pg);
+    clear_domain_page(mfn);
+
+    sd->avic_physical_id_table_mfn = mfn;
+    sd->avic_physical_id_table = map_domain_page_global(mfn);
+
+    return avic_set_mmio_p2m_entry(d);
+}
+
+void svm_avic_domain_relinquish_resources(struct domain *d)
+{
+    struct svm_domain *sd = &d->arch.hvm.svm;
+    mfn_t mfn;
+
+    (void)avic_clear_mmio_p2m_entry(d);
+
+    mfn = sd->avic_physical_id_table_mfn;
+    if ( !mfn_eq(mfn, _mfn(0)) )
+    {
+        unmap_domain_page_global(sd->avic_physical_id_table);
+        sd->avic_physical_id_table = NULL;
+
+        free_domheap_page(mfn_to_page(mfn));
+        sd->avic_physical_id_table_mfn = _mfn(0);
+    }
+
+    mfn = sd->avic_logical_id_table_mfn;
+    if ( !mfn_eq(mfn, _mfn(0)) )
+    {
+        unmap_domain_page_global(sd->avic_logical_id_table);
+        sd->avic_logical_id_table = NULL;
+
+        free_domheap_page(mfn_to_page(mfn));
+        sd->avic_logical_id_table_mfn = _mfn(0);
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
new file mode 100644
index 000000000000..3da62f59b0cf
--- /dev/null
+++ b/xen/arch/x86/hvm/svm/avic.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AMD Advanced Virtual Interrupt Controller (AVIC)
+ */
+
+#ifndef __SVM_AVIC_H__
+#define __SVM_AVIC_H__
+
+extern bool svm_avic_enable;
+
+int svm_avic_domain_initialise(struct domain *d);
+void svm_avic_domain_relinquish_resources(struct domain *d);
+
+#endif /* __SVM_AVIC_H__ */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index db81dad4b681..8b7bfed0049f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -40,6 +40,7 @@
 
 #include <public/sched.h>
 
+#include "avic.h"
 #include "nestedhvm.h"
 #include "svm.h"
 #include "vmcb.h"
@@ -1084,6 +1085,11 @@ static int cf_check svm_domain_initialise(struct domain *d)
         .to   = svm_ctxt_switch_to,
         .tail = svm_do_resume,
     };
+    int rc;
+
+    rc = svm_avic_domain_initialise(d);
+    if ( rc )
+        return rc;
 
     d->arch.ctxt_switch = &csw;
 
@@ -1095,6 +1101,11 @@ static int cf_check svm_domain_initialise(struct domain *d)
     return 0;
 }
 
+static void cf_check svm_domain_relinquish_resources(struct domain *d)
+{
+    svm_avic_domain_relinquish_resources(d);
+}
+
 static int cf_check svm_vcpu_initialise(struct vcpu *v)
 {
     int rc;
@@ -2384,6 +2395,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .cpu_up               = svm_cpu_up,
     .cpu_down             = svm_cpu_down,
     .domain_initialise    = svm_domain_initialise,
+    .domain_relinquish_resources = svm_domain_relinquish_resources,
     .vcpu_initialise      = svm_vcpu_initialise,
     .vcpu_destroy         = svm_vcpu_destroy,
     .save_cpu_ctxt        = svm_save_vmcb_ctxt,
@@ -2464,6 +2476,12 @@ static void __init print_svm_features(void)
         printk(" - none\n");
 }
 
+static void __init svm_avic_start(void)
+{
+    if ( !cpu_has_svm_avic || pv_shim )
+        svm_avic_enable = false;
+}
+
 const struct hvm_function_table * __init start_svm(void)
 {
     svm_host_osvw_reset();
@@ -2487,6 +2505,8 @@ const struct hvm_function_table * __init start_svm(void)
     if ( cpu_has_tsc_ratio )
         svm_function_table.tsc_scaling.ratio_frac_bits = 32;
 
+    svm_avic_start();
+
     svm_function_table.caps.hap = cpu_has_svm_npt;
     svm_function_table.caps.hap_superpage_2mb = true;
     svm_function_table.caps.hap_superpage_1gb = cpu_has_page1gb;
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 71427b3c11d1..30bdaf27a856 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -15,6 +15,14 @@ struct svm_domain {
             uint64_t status;
         };
     } osvw;
+
+    /*
+     * Domain AVIC state.
+     */
+    mfn_t avic_logical_id_table_mfn;
+    uint32_t *avic_logical_id_table;
+    mfn_t avic_physical_id_table_mfn;
+    uint64_t *avic_physical_id_table;
 };
 
 struct svm_vcpu {
-- 
2.55.0


