Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62585606A326
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=Q7GTjDfu;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=KtjymthY;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=bBl4c4rc;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=QdGQ2WZG
Received: from list by lists.xenproject.org with outflank-mailman.1473254.1680947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNr-0002W1-Bo; Thu, 05 Nov 2026 01:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473254.1680947; Thu, 05 Nov 2026 01:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNq-0002Ru-TS; Thu, 05 Nov 2026 01:35:18 +0000
Received: by outflank-mailman (input) for mailman id 1473254;
 Thu, 05 Nov 2026 01:35:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNo-0001w4-FS
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNn-001x47-Rs
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:15 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd28-bab6-0a2a0a5309dd-0a2a450c8a0c-38
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:15 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd52-f479-0a2a450c0019-94a38ff154f4-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:15 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mssp226770
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:14 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurbwy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:13 +0000 (GMT)
Received: from BN9PR03CA0445.namprd03.prod.outlook.com (2603:10b6:408:113::30)
 by SA2PR16MB4108.namprd16.prod.outlook.com (2603:10b6:806:142::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:35:11 +0000
Received: from BN5PEPF0004698E.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::9c) by BN9PR03CA0445.outlook.office365.com
 (2603:10b6:408:113::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:35:11 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BN5PEPF0004698E.mail.protection.outlook.com (10.167.245.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:35:10 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nw2T2971351
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:35:09 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrm9-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:35:09 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNfxmbw6UazzOmNgx0wHI; Thu, 05 Nov 2026 01:35:09 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=5Fn
	4IgCzV0wLuko316bDEMgqGzHlTRCj+opPIQ8cwGQ=; b=Q7GTjDfuGAAxu4RT7Tu
	suprVMlEvJ5PKethmbCiYPOtsrsqyo37cCtsaTL+gujM3aDMJq7bgi3Or7hoq1Sx
	n3EFqy66e8nfJejmRIv1vInn4ouvt0Oh9lAh0dICeRKrPOaqA2ZviBEBy6cEp330
	K2kGotGtvy5XCrfcSBh5qOTAuTPKNJ+vfJFgH7ussCof7LFMJOTR9YYlploo9/pE
	8ASrT3Dyc3kVw0HI7kDTfbt5GHuPTTr30jawCuAmVJyJTPRh1diiyLD4TcNrCDxJ
	3xIOwiE+eZGRNuO9CvV4+16OpJF1ZzNprr88ZRFgcAjwFvv8bw3oP25lIWCJa4OO
	CbA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWvAAoWn1RI5kmm0ajaocVFBcXPmkZMLV9jerCoUS+OCp1Hebzp5v7ODwDnXIBMmbDwux2fMj1/M5WwrZ8B6EgUBHE4joCXuRA0nSC6GUsFOOewckaxrsaZvU6dqoX5+xKIEiUKW6Q59Cx/OviZkdBzhtEzn2Vj9fCPgU+2sx+eGCDEjMr0F6wxmHMLu7fSsqNEVXPcOU8s+uGmu1ZXAKs9WMNT1NHUUP23wrnmxbpv+SD2J9oZv37Xw/Jgt+va4XbQwHD4Uf4TbFl415qV+t7AWUPnVDNkp9sNuANRkNtrYSEwTkZ49QtKDjwwTFgHvFkCNg29/nR3o+kNj9aXLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Fn4IgCzV0wLuko316bDEMgqGzHlTRCj+opPIQ8cwGQ=;
 b=wVK7UAuOHcBV7s0DIMBIwnPkiYqDNaMBEOkTvZwZntynVy77BfnTaOC1WkwURg8nIxt7ILCfgz2vUt4XN9JYA1dLUz1O0R3SvfQPADcd3AjLx29iC78Ib2v35/0+aiYJyff1eVn7jdo/AYVW7sh/585pcAeJC+Z0esSohlfL+Rh4ZWK6T5yF9um/P12M5oNfNkIM0HvicMglmxYsQIs/gZnVqC/+gMARmM1BQ90Wzq1uybakA6qOf28NYp4Uh/YbsEQES1/uxouRM2GCesVVhSmfhFO3KeI3O2J/mgNGE5kLdeXvxbSByFR0BjBUjt7JXuLqZlJbInoekP+nuKApXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Fn4IgCzV0wLuko316bDEMgqGzHlTRCj+opPIQ8cwGQ=;
 b=KtjymthYSKLuHyDouFcovB+v86UbE3305d8N+6+bYj1sauMdpVRYio9ziUozDDECk41j+AQ46woWPt2TKSQS3jfDg3xz30Duv6bEQWqeiGlPYUZLLt7BsEHW/ZyP148CNVtk/9h/qWi2+xwzR9lqO/jPYihF7b2+WE3LuarJpeE=
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
	ppserprodsaar; bh=5Fn4IgCzV0wLuko316bDEMgqGzHlTRCj+opPIQ8cwGQ=; b=
	bBl4c4rcjApURX2LsybC7qbkFkturXjo51A8uWhQB5J3LwJ6s1F3D/LgQcmsfhsl
	HGVNfdIR87LK1b/q3jLd/zKsVngIhvSRT/QR7u2S8vTrY88bixo5NiXpiWN1pRh4
	Tk5Wsesh06/FrfswjfU2/jI3i61CjjVw6duXDDbI5+0Bb2ZnmtdkbK0UYsuMntGe
	uqOlQ1CvLwmSlgUvH+jGMo1AS2Joc044m39T2Mt/7ir3dJrZzFEEHAGTelK+5g6u
	aHPSxsw4HmdiPvUyv/iQa/UVyqTOM67Omm9XMUo/DHWy+0X9NcNPG3QlcVP8jryw
	xq5igrsUtW/iCgJ/pEXGpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=5Fn4IgC
	zV0wLuko316bDEMgqGzHlTRCj+opPIQ8cwGQ=; b=QdGQ2WZGsuFaoQFPX+TDORN
	eIumfJCsMfBJ4FSiYf3aL5f00SAgXM3+5z+i+gJ2DFgcmjoLHVMk06YxT2lEcHgl
	8hGIGRSQLcWqde5TlHPahGj8/kuc1bBj6ZEfgNSv3MJpml0yAPsLOxq/T1m8VNHG
	874LN4RHXyQZO6nnkFguUGLwDmdYqYAcs6hWtQZgILPapQZJyFnCCLfzpelJeNtB
	m3H6Yjrvwwn8aTEMy5mpgRVVrPB+cSeeLF//pObRGGBM40kX6f3LqHXKXgdhemve
	t/kDE7os01/AqsrUxT3xobgMes7kPWUpMb3vFPMHjCm0nLSeaClGRvSO0/0RxOA=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNfxmbw6UazzOmNgx0wHI
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 25/28] x86/hvm: avic: account for AMD erratum 1235
Date: Wed,  4 Nov 2026 17:33:42 -0800
Message-ID: <20261105013347.719392-26-dmukhin@ford.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050005
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698E:EE_|SA2PR16MB4108:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a3b53f1f-96b5-4ab7-761e-08df3add0838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021121427099003|261022075727099003|261102123227099003|261026140227099003|261022105027099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AreewE9vTTqnaFgPwBv0Zc6ij+MpSUlqRKFL92csTg9Taj26FfxqHgwLoMNLTSWWpSLl1bG02buTAtDMj6oZHaBXQRtisbwvme+5xbuc8DGHVj1t9XBxs9+8kUBHrTv9IWLY0t5R+HxKLqqH1uxzpsNeYVrfZkufyJGDPGgSyT9SPEVaYGiKublXqOoCZY7LpIqFDQ+3SBziQo6LaDVxizJvkRN661J3HtW2XUfwfTtYQI5RkLjrw2yKA5CJ/5T67chKQ2R77DwHIEX+MHyNh3oh/yxD2mDF3p/Wav951TT6S+/rnzjYlU0G8FXhvYvFlNs9q006HWtDKRZ1F3Kg9Q/ZtHBbDbYgzGUSfsnOYYmRZ17dWORBWI/jshXNZjlM0trTUe6KzzIb52ZOi0koxKcANUfg/YsYXA2tEpgxUVKhpjEH+R2NFVcxPYIbvrUtlGTO6Qw/KDws+1V+YRMrTVh2zIdHy3qWxYIEjVXtM19CMYfeGeIrb9ObvixkCs9v/Sb5tm/tChYFKVjSC+l1Gefk8e2/ffWbMKvrYXEFO9ZsTvslAeKm9/IeKVAdx3oube9rRf7sHzJNUXjm7C33nW3tsRQ3DKjAeC5RN0OnJNht7w5+Zi+90BuHbKWVCGOzl7GxiLh/UeOmhTiz6No1b8fLlyxbf2BpEpjJ3JhfTyRsA8tNH9vtIlzUfGUdL5gJ5eXVQsUKcDHGS3/B/tSFoQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GqJK81dkWLrSYYWj7Rjq/x9kgafgExSaS+9QlAkDt6ISoCtcPGqMlHhc8jEA633AeT1KdvvGnWYqTqizw0EkLkRZD0wrbu10EmZ3efFb3LXiC1iehxvo/0FkTTRzTqNU3h8PnIsiZ4PejKz+Cg2IUfa4sthoDW63dk5+4jL1tf4bThcI5xG5C+DqAdOR7d29K2hdyqp9o1clsCY35pbaTFe0wNC5uM4s2IKUEbo7CUkFCACg/gU04jHagDUuamJOHX2IQUVlqB8/EDnFAtd3vNCzj3m8gYFYBKa9FbLEz3WMfL/5Iejpy7+mLeKl67ybOqjunBmXYjNby81EGVLO3j9I+BDndvNytjMG8xRCJlXs0zwW/8AwkuQU42vrc5+X4lzDNOMQmTENmbbuWxf0qaKZBzAp31kx9MRS5asOCH3dKa4Ig/gRYM8IkN6RvMyr
X-Exchange-RoutingPolicyChecked:
	l5lJf0l505IUueLpDw3goGq3SY18zrYgDjKZZSIi7KnKs0VS+0WauyGVCw1VVRSjU5zY033VsQOwQzb/Ph5I4CCsLHLQLcHXT7rsS7zjaRX1eAuXw5sgNP1Z5yIV2I3XwCRRtYicGriEyxpIsILLyUaZ/E0qrsYSZYivavIHkDbCVitKEA9J7E2pKfA6F92gyryK3881VyZ/Cmz5VGbsI+Ch5uMdZ3PB7qMrHI1OGgGaWxMLgLmsxEzIqRr/r9yOOBD1fKHsYtK1hOPUxCN1u3n/QZAkRxNRoAPgGrN4Il4UHQ8jmXbwHmge06T4r80xrKqHbeRjaAqTg/d/izoBww==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FA+AGWWmo3y9f/3t59+dFLlEa9NttpaSEf3NXR7RsHU3sHL+arz7Os6dBiYE/Dw5xQ7JaWSt+J7CJ7ZFozDwSIYXV9YfOrpNF0SZzBnvtJpFQU+Z9KXz3URUIEmXTCZ/22XvxrcDfHZjWlXjTuTfI8LB9lIfySAZfEAR71OgqtXysNL6unqH/q15frIOZnRd8zCoTfidiDaVj7M3HTCEm0XY5bFElRLGaUxCKb/rLvWWATe1LsIpk+aOBTTGVBtHQLsDJ6GgXSutmR8SvgUuA7tGWBnBO2xmgfqFw49EhSHdoq+2FthEf5JCg5NJGbIi7f1NbTv6eCCQOhbxrB9mMdj3y0ElLXLoKkN+xE5BFN01XOKjMtY2nlSxdZlhlubCQ+IEujc6eXvcQDGeJUoCT8FhQE+onEckEEaKmQ8Iz70hN2HYuKilXSY9N18OFyOaDR/QEMU+G7uoHUPj5xoyvXGcZ/PPoPhYfR3HFetzCDqjbFKI3Xc1nWuaFAg4WAgdgfmBPBYrbsER+n3KFXfNGhFZDB55DG9wCRYmfnySllvH8P8xYn7HsLbECgWO8BJ50xk4kY7w25W9MC50HkfZxZYCb7YATEpz+biHgS9EaiAyRZdVQOcW6fH72FoRBVj9tx/Yq+z0nkHcBKabmXCngQ==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:35:10.6841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b53f1f-96b5-4ab7-761e-08df3add0838
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR16MB4108
X-Proofpoint-GUID: 4zEkgKtDU8pg4kA_zy4npj4WOQnfdAXd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXzyusaY6GqjFP
 FdzIvSz6NK3FMJ51pB2+Wr0/3DQkwBjAYFiOPtuAUyAOM7Uxy1PMwZwBO9plE7o14ZC4FtUvkpL
 KGlN7cJahRxKJLnOrNvLwwDLumb7Otp+xel4SHoQIZiajat4Dt0d
X-Proofpoint-ORIG-GUID: 4zEkgKtDU8pg4kA_zy4npj4WOQnfdAXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX5oDrmCDSnx6Q
 /wC6BijOddMN8oj2MH/9GI9/WDOPZkqGaQRmdRPAGbzheG2or9hlRqA8HCjIjjG1vBMzC48qxZM
 jN5YL3kmAYA0/BEd1wUh9Q2DfbpAHLS/XaVdnpOCzqAjAkfxoszywaRS6mkIm6wISeHZgBUEKle
 m0r07PmZMuB4yWcGSXh+TQJYFlztyErIyE5EVA+mSnGZKIuCR6UDWHQcQiEIXwhFRMgVcTA9KkS
 ybpCC3+qCm4zpMXJ8Q7lqDmkNkcssUqXfXTj1IC//EEK122vV+7nqqulvqcAc5DnIY5sunnjAvN
 KpZ4wOBBEMC0O4XC3xKM2UaRLwIXwxmM4xTO3M0KnzL2w6vlkmmzv5NhrB3pULkX6UEaJeb6Ixl
 7BxBuBVoiAS2oYx6kSNDPWGHXjRu3uV5ql9L61L0hdGZYXz16DmsmwdRITuKnHWmTKjVZpmSAhd
 CDrLIMY3Ha7f8kYPwGw==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebdd51 cx=c_pps
 a=MmwiYf2CWIeG5bfvH5NISQ==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=mm34HD63QLQtMxViUbgA:9 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-d25034/1793842515-01CC3A5B-F08E628B/0/0
X-purgate-type: clean
X-purgate-size: 1533
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Disable IPI virtualization for AMD Family 17h (Zen1 and Zen2) and
Hygon Family 18h (derived from AMD Zen1) CPUs due to erratum 1235,
which results in missed VM-Exits on the sender and thus missed wake
events for blocking vCPUs due to the CPU failing to see a software
update to clear 'IsRunning' bit.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/hvm/svm/svm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 77f8278c598b..fd06ccfaab3f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2536,6 +2536,21 @@ static void __init svm_avic_start(void)
      * x2APIC to guests when SVM AVIC is enabled.
      */
     svm_function_table.caps.x2apic = false;
+
+    /*
+     * Disable IPI virtualization for AMD Family 17h (Zen1 and Zen2) and
+     * Hygon Family 18h (derived from AMD Zen1) CPUs due to erratum 1235,
+     * which results in missed VM-Exits on the sender and thus missed wake
+     * events for blocking vCPUs due to the CPU failing to see a software
+     * update to clear 'IsRunning' bit.
+     */
+    if ( boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18 )
+    {
+        svm_avic_features &= ~AVIC_HW_ISRUNNING;
+
+        printk(XENLOG_WARNING
+               "SVM: AVIC IPI acceleration disabled (erratum 1235)\n");
+    }
 }
 
 const struct hvm_function_table * __init start_svm(void)
-- 
2.55.0


