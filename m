Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A69606A32F
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=QRtuaofg;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=b21o7G+g;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=JJNjmWvl;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=t0GunSRX
Received: from list by lists.xenproject.org with outflank-mailman.1496734.1695139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU5h7-00064y-6q; Thu, 19 Nov 2026 17:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496734.1695139; Thu, 19 Nov 2026 17:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU5h7-00064r-1d; Thu, 19 Nov 2026 17:13:09 +0000
Received: by outflank-mailman (input) for mailman id 1496734;
 Thu, 19 Nov 2026 17:13:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xU5h4-00064l-T5
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 17:13:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU5h3-001PnG-Mq
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 18:13:06 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aff2e1f-8faa-0a2a0a5109dd-0a2a450596c0-4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 18:13:05 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aff2e1e-4cb1-0a2a45050019-94a38ff1a1c8-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 18:13:03 +0100
Received: from pps.filterd (m0367130.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJF81FR1029668
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:13:02 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4j21mtu54g-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 17:13:02 +0000 (GMT)
Received: from BN9PR03CA0666.namprd03.prod.outlook.com (2603:10b6:408:10e::11)
 by LV8PR16MB6185.namprd16.prod.outlook.com (2603:10b6:408:1ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 17:12:59 +0000
Received: from BN2PEPF0000A894.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::1a) by BN9PR03CA0666.outlook.office365.com
 (2603:10b6:408:10e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 17:12:59 +0000
Received: from mx0b-00498f04.pphosted.com (148.163.138.245) by
 BN2PEPF0000A894.mail.protection.outlook.com (10.167.248.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Thu, 19 Nov 2026 17:12:59 +0000
Received: from pps.filterd (m0373461.ppops.net [127.0.0.1])
 by mx0b-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AJH1bjr3153557
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:12:58 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [44.208.76.22])
 by mx0b-00498f04.pphosted.com (PPS) with ESMTPS id 4hy75b6pm4-3
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 12:12:58 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id U5guxd4Q53K62U5gvxpzAq; Thu, 19 Nov 2026 17:12:58 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ppford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector2-azureford-onmicrosoft-com header.d=azureford.onmicrosoft.com header.i="@azureford.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=ppserprodsaar header.d=saarlouis.ford.com header.i="@saarlouis.ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=ppfserpocford header.d=ford.com header.i="@ford.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppford; bh=gXJ+LRPGRN3LnnJRvxZ8Gi+aPrT
	i2tsB+9h7ljEarng=; b=QRtuaofgM//hF5aWUnx++axTdt6ufLTvpmV7AT211L5
	+CjH1IbG1uZ7T9rgwcTIFTxd0/vxr4hvfsJFKq886pNLWr648DAX/FAiRdWnuguh
	f2nmBboVWO1NjouveGNBX/HmzNZTvTl8+FKumtvzOU7oXsFBCCmE4zqHF4y4pEtT
	RJ9QFMNFl4jTXDB7BLUymw+2oMBXOSZJU44IyVexMIoc1MDnfU7jbONuO1HRExV6
	ZRkSZAF/5GhRcNzdA3H0qA+Gb4Fx0mWb+8lShdY1h6YwTpivig4ujS8fgVOZibqH
	qnzN1ikLnmXEYkRDSYj+LfzE6dLTiHzd5oh6WcScvMg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRhvAo94rKtpUGhIpXGxcNL3w3xslo2AdeINuYulzUVTsViZYs9GFVY5dmZCtg4/FmolCCNfeNbA6ZoBw9K0ZYkvgZEhXHJ0MdwkZuFlXcdvXm2/09pqscR5YeLuaQWNjRs7dtMv56/hHB3IayLTXY5u8PDyIiB5cxyUoYQq6St8k2/y5+p4a1KSrAn36byPi+ft39ch2Sl88523wSfoUsl8jDAJmlUcjqDMOO5S8KL3XQ+xgFYl+20Tu+WECfuKciLcZJeGJhSBWvrxAetnSwipBfGPErEaz7aYElU0gXNWKZ0BZDaOgEvs9Z3LKqhpksEbxH8MhrjyG9RDoYaQ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXJ+LRPGRN3LnnJRvxZ8Gi+aPrTi2tsB+9h7ljEarng=;
 b=W8uXcn4FDQ8whhfTp5a4iLDRhW/AS57Pg2steh/2eEW633ePR7fXeN0oGYVC0cKiy6zoSauoJRYpwaEzoB0F1yRxhpLJ/D4DXJQnNx2YLZQzW9xy5wmBeKNSiLhciElIvFetbTLtLQD9B2S8Pc7IKtlcN1KQW7eNnn7+XPCJKi8vNoFK6B4YvJowJkaU8vkdYF8ApeiGJymoeYBpRtCWJJyICVF0JaF9SVgCZdb4Itscs2CskXtan/HyqDHx9MAWJU1NmV7Bk7PtUE96WFLFtUPi3CEhCK7MTMe0M4EDnnuQ1n47UcZ9OImY+oK6bwE2ASaaOtDyC+By8umx9kyQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 148.163.138.245) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXJ+LRPGRN3LnnJRvxZ8Gi+aPrTi2tsB+9h7ljEarng=;
 b=b21o7G+giGjGUynrjNI9vSFjXkoHjT7qFLJM1RJb1Xn3A2pDw3dumUnFkFlM18rtGlGfnmTSN61+vTOjMAG8RfIHYpltTXOGCpD5YrARoLhQygCU4HRSvT4klxOLNKQ7TZNI5P0QaeFKWn+xPPzRVQqkjM6Qojravz8jMYn/seY=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 148.163.138.245) smtp.mailfrom=ford.com; dkim=pass (signature was
 verified) header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 148.163.138.245 as permitted sender) receiver=protection.outlook.com;
 client-ip=148.163.138.245; helo=mx0b-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=ppserprodsaar;
	 bh=gXJ+LRPGRN3LnnJRvxZ8Gi+aPrTi2tsB+9h7ljEarng=; b=JJNjmWvlUzhq
	hxezS9PfH4BJgXSbyjzo0fEMVEepcF4kzfVW3SvjRCefRZ6pYL0SbBYdAIwYbdDJ
	yEvs271j8HGN+vwXx9iZwPVXzEcMj+wCpoFRUQ6Bm8hcIs4lJvF5oBOm8ocEKdAa
	Yoat0Swe+Y5p8lS/u9Dv3Q+eLKrjiJkTp18f5Xt2BeSoouxwLSNq0CZyowO+Vi8K
	uui1WhM9lCRTcIEJERmWmjg1ipLpBJyz/KL/GsfAuTqNdDAWNnrliFMPy2AyTmHW
	id7DccjsgU4ir4/2eZljFMudnNmc2T8LfTd0YF0FBpYQk/dAvKBCn5dNPaQZdPl3
	V0eOEZ9LxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=ppfserpocford; bh=gXJ+LRPGRN3LnnJRvxZ8
	Gi+aPrTi2tsB+9h7ljEarng=; b=t0GunSRX/RzlESHxMylcoygZiCadoWc+aBL9
	SSRR1aDxNvSQ/2TezJDCLQ8Myp6bStpFpw8Ed89bntusFunlmGKDALOen/C9GiVo
	wdWDWbFYA4ONawJC/9SHIhOSATGDGkHnu8G14gNI5yB2quYrWjrDZfUxwJdE5le5
	QArnTdGS5TjGkPJZoNxdCCEb58uscpqEijUf5qfinsmEO16OJfd786pMpgJ8DzlR
	z3rXRvpVJHkzA2ixRpWJ48lxeLo/79XthY34ZVkYruJwvAUj9DPzYwn1uYMGsZwH
	GnEXFL+q7ktyaDOM8smW3y+mLgyC6Luv7Zw4tBVpJMDozXWaCQ==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: U5guxd4Q53K62U5gvxpzAq
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
Date: Thu, 19 Nov 2026 09:12:55 -0800
To: cristian.andrei1423@gmail.com
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
        alistair.francis@wdc.com, connojdavis@gmail.com,
        baptiste.le-duc@vates.tech, community.manager@xenproject.org,
        andrew.cooper3@citrix.com, anthony.perard@vates.tech,
        michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
        roger@xenproject.org, sstabellini@kernel.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH] xen/riscv: add support for riscv,isa-extensions
 devicetree property
Message-ID: <av8uF5DrTmmDDFuP@kraken>
References: <20261119154807.80195-1-cristian.andrei1423@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119154807.80195-1-cristian.andrei1423@gmail.com>
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190068
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A894:EE_|LV8PR16MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 23386792-bbdb-49ad-29f3-08df46605c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|18002099003|22082099003|6133799003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261102124527099003|261021121427099003|261022075727099003|261021123027099003|261022105027099003|261021135927099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RU27S/VYlgGk1kUNTCY0GUZKEs+eEgNatAARVjs769bSS2qGjAAnbzs6UrKEBmjnjcUaIqqV7tcnP29eOHdBr16GBu25bvEWkYTPtSLNoWYSgexhoX9VeefLcB020XAFbjZ59wWMvdkO9ysZqDwGw7e2rbEtE2SbB6nYn1tzAhefOZPgFbMKtqIEfS01EzAGiojhTC5VtCk+PznNDF0Wq9UIpqloLF6GXWktvRlsB2NEuJrTj5vdwrU51eHzqbP29z5qG3BW8fC9XgiUaghFpKVSldDY4F3bBlGc0WhIX7WwFOq3R57mJ3goJflrzhB6LUoziLxHVyPKPtsS7Rvm3IdQlhRDma3EEhhLKWHVa2SuOYsQyDaw+H5bWig5C87sqe1TelS/CkOf27V36Ut/rLgX58RoEpMWk5F3S7zq5lBQVWwXA0brr6mDYkZVm46YlHgkN1RO8ynRELDwIJekK/goK5i1TbPVQuiDOIqmPG3sCInhSCwLRRiRr15Vd8Uel0QC0UIMrDpll7utrJ/HgNCMrKEHj7oOlq9E/iyplRvL8sIWjsAceRolDGoYrt6eMznEmYjg+uy0SHWogfb9ytmeTH/bi00YIEcyh7LWr4pSNzezaOzQtjMZdMRXKd78oHtCrn2BVjxUleNczHwjuQ==
X-Forefront-Antispam-Report:
	CIP:148.163.138.245;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0b-00498f04.pphosted.com;PTR:mx0b-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261102124527099003)(261021121427099003)(261022075727099003)(261021123027099003)(261022105027099003)(261021135927099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b7+PctDn4YFAdY1N5Us8WPQSGwGb2iYvyBh9WD+RQm7oL/SuXVCKkiB478l3eZ/te9NwjujMm46bPvORa+v7u94qbQpCiF5UePgp0vA7PcyRKLAxSk9uLlEEZkE4OaJ/yS+VmZPYjVN/qJsy+Bdkwp2gWvzf06t2+eu3TBM5zSYiWjYeaxisEFmF2KEBerywckLZpwgkWGpr8akx/momqg5zfcC0XlSriQnW/dXP/0I4GuTPAM4nrbACOOIosMlA70GJJ4FbGRwnwUmd5RxCTQ/qu0Q01YbTXBBf+2UTYM2k6WBoyiJQbCm/S6RHS82kOQDZOoVjzLtK/Os+IaT2LRQ9duuyufCA8DMOMw4Er1OY1i7+XL7q8coLf4/u/7HWbxtMhjKOO/+dQZPLjrv3+KBVO2BRAsSj86B2S/MK+Y8o5NqyjvJp71P6QoYrxMVc
X-Exchange-RoutingPolicyChecked:
	xGV3mqvKmEFHeWJ9+J2NbEhLiknfLX2CppfLrdpDDFG/8Q/WVTV0WRVx/dWUNqDxl3u4MEGaeJD4tEXH3SMTmhE/D9aLbdC0B5gtONAQ4So/WYoy6M+iv7o6fQXhuyO4pOGLOl5hXJaH1odkE6Vg5HmdFy+y6j2kUCPTLb6HUNgf5SJc2kT0TlKB9NoCJxKeqVk4AU58kd1Sa5Q2zdTEOiIj56mRHJkLnniVLWrGDXjsLiPQkLwYAAuclmf+lw6K6QKijUV/N57x9is4YyR/WPueiM3gOSBskYnByfoAys4RVTmWHDZxXnRqXtmYWCtz5H1jVPQdnEu1EfD8X6jcjw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0NgXH/hYxWY/mNZYexzWeR1Cr9l6WJjuIvpBYjaxGYCgmnWi3fyZNM7fdvHZUe91SFinIdndq/+Ha4ur/vphkqdNA1SiRMvE5l8JRJ7S98AixxA2SMkXX3hT4wmLqtItUonQNrA8J4pjoCidkoSVtPLMviJeGfVkLB1x/ja93akbC+AnTG8Yp8+yeYcOEii5gpWRTQP3ItOUacLOR1NW4KyLwEYT4Gpzn5RuQ6OTUupxoENp2D0Z9+44qQcLYsdmn+UJ1CmrbcdsnN5A92owID7pwbPQxgt0EGrVDYpLBsIi5oOD5smbabd+j47ceysab8pgsLM9oU/ZgTFnTFJenqLXtI/XYQlHB28Op+c0paeUyUdEjcclvLPZzRAeRSqijtC6RX4f/kidrmGlBEMgIiasn06YFxRat8rGhtO2pHLNsfb1KkVWyE4Qa5CQLq64UWBOQHsizygUwjoIzPrCn2Et1kWMKvDW4mk/0Hyjz6I/55c8MQOF3yymy2sEDQOubKmZn2+FiyVvVCDFEsFxA2z4DKbEp3sN1LNAR5FehwRwqpZV7NUK3A5NbfRaqvJo+VkBazW+Pu5j9ZiPgW8mXxMByGtOG6vuo1U8cELKwdwUb4+jVJbl+eCovKcFxB5uwoIbqx0Ice8zEIk2ID9l2Q==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:12:59.1594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23386792-bbdb-49ad-29f3-08df46605c80
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[148.163.138.245];Helo=[mx0b-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A894.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR16MB6185
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2OCBTYWx0ZWRfX0Y0TWJ/iUnXu
 1Ph0UvqF9sMDVixcCOhtWUK3TK2LcC+MXIEFS7JkOMqTV9tA3V7vcIuV8K9Eua0S3kKQ9t9vGaf
 dIJ5Wemq0JIf92fVmLS+HYrjloM9R5TERR8FMZtFOjUVts3c2zm2dcV1p6r4g8flzi4OpKaTKBk
 Y7mYyx+R24RHT++bM6iH4rlK0AxN1Zbjv0zH1YdT3b9oIxcx+8psySuX6NjM2EpFry1L5h3u5rO
 97ARv33I5vuuu1y30094cdVYQgQ0mzn831+Qr4mroFvcGD9B2h7VJl2DI7zzt+vw8a+YDGXo4LR
 gFnVWSJEhj4piTCCMRZUlYqaQBl2esvRSAwyJo3enUIgS7tbrcRMhWRj/HJQKCC6C6i0HCuV/on
 kzRTiQDzU96g1KDY+uZwPaN4+dSTTfp55WUEfUBB1i32IPyVnt8YdMCTD+cX6mRzMY5USoG2enW
 5l6UX2KntVRgRPo9Vuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2OCBTYWx0ZWRfX4cjhxNQLvpSP
 hKKjVamTb97n+xqhzWyf8H4WntdgIXHgl7bIxta0UE92R/KoZCGBKUuSDApGofHjzQ0BxVLuD+8
 LffZgqzre4+1oKfF/qIvv0ZY03kzV1MQEWURRRvcp88juDYEXiuj
X-Authority-Analysis: v=2.4 cv=KJzPn1Fo c=1 sm=1 tr=0 ts=6aff2e1e cx=c_pps
 a=mZF0Hyin10M6g94br3+Ulw==:117 a=b7IhknPlfT0FN1EembXvig==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=3PXLN80vpJUA:10 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P_n1zlmtWsCQbjROFjcg:22 a=vnUQfov-gS4s1L7hHvr-:22
 a=IUhvlq-UAAAA:8 a=pGLkceISAAAA:8 a=cbNQJ9GKAAAA:8 a=-_GrUI4xWKaU9rKVuDcA:9
 a=CjuIK1q_8ugA:10 a=3whSkbs7g9Me0DR5EJEX:22 a=WmVTiCyuxqgg3mnwYu6p:22
 a=HAt3PS7web1Nm6r8Pb4Y:22
X-Proofpoint-ORIG-GUID: 2FHQD1JbaTxVzymGvz8BsJwBgKGu6GWi
X-Proofpoint-GUID: 2FHQD1JbaTxVzymGvz8BsJwBgKGu6GWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190068
X-purgate-ID: tlsNG-c201ff/1795108385-F5EA92A1-627BC8DB/0/0
X-purgate-type: clean
X-purgate-size: 14221
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 05:48:07PM +0200, cristian.andrei1423@gmail.com wrote:
> Xen panics when a CPU only has the riscv,isa-extensions property in
> the device tree. It only accepts the deprecated riscv,isa property,
> which forces users to use legacy devicetrees.
> 
> Use riscv,isa-extensions if present, otherwise the legacy riscv,isa.
> If the new property is used, riscv,isa-extensions and riscv,isa-base
> must both be present and riscv,isa-base must exactly match the build
> string. Make a new shared helper riscv_isa_ext_check() which returns
> the exact state of the property: whether both are present or to use
> the legacy property. This helper makes both cpufeature.c and smpboot.c
> agree on which property a CPU uses.
> 
> A CPU with neither property is skipped with a message. Make it now
> an error because a skipped CPU is left out of the intersection, so
> Xen could use extensions that CPU lacks.
> 
> Add a per-CPU fallback so that any mix of new and legacy CPUs works.
> This deviates from Linux, which skips CPUs without riscv,isa-extensions
> and could assume extensions those CPUs lack.
> 
> Add a first-CPU flag because with the new riscv,isa-extensions, a CPU's
> set can now be empty, which would make a later CPU appear as the first
> one. This couldn't happen with riscv,isa, where 'i' is always set.
> 
> Use the new property in dt_processor_hartid(), with the legacy
> fallback, which also only used the legacy riscv,isa during
> interrupt-controller setup.
> 
> Suggested-by: Denis Mukhin <dmukhin@ford.com>

This should be Oleksii's credentials, as Oleksii suggested that task.

With that updated, the code looks good to me:

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 


> Signed-off-by: Cristian Andrei <cristian.andrei1423@gmail.com>
> ---
> Tested on QEMU (virt, aia=aplic-imsic, -cpu rv64,svpbmt=on),
> -smp 1/2: default DT, only-new, only-legacy, mixed (CPU 0 new,
> CPU 1 legacy, showing CPU 1 falling back) boot.
> CPU 1 base "rv32i" -> panic.
> CPU 1 with only one of the new pair (either one) -> panic.
> Neither property: untestable in QEMU as OpenSBI stops first.
> 
>  CHANGELOG.md                            |   3 +
>  docs/misc/riscv/booting.txt             |   3 +-
>  xen/arch/riscv/cpufeature.c             | 135 ++++++++++++++----------
>  xen/arch/riscv/include/asm/cpufeature.h |   2 +
>  xen/arch/riscv/smpboot.c                |  26 ++++-
>  5 files changed, 109 insertions(+), 60 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 225397f128..6bacd64f49 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>       afterwards.
>  
>  ### Added
> + - On RISC-V:
> +   - Support for riscv,isa-extensions devicetree cpu property, alongside
> +     the legacy riscv,isa.
>  
>  ### Removed
>   - On Arm:
> diff --git a/docs/misc/riscv/booting.txt b/docs/misc/riscv/booting.txt
> index 14212ed62f..1505ae8c87 100644
> --- a/docs/misc/riscv/booting.txt
> +++ b/docs/misc/riscv/booting.txt
> @@ -2,7 +2,8 @@ System requirements
>  ===================
>  
>  The following extensions are required by Xen. Xen panics at boot if any of
> -them is missing from the riscv,isa property of the CPU nodes:
> +them is missing from the riscv,isa or riscv,isa-extensions property of the
> +CPU nodes:
>  - I, M, A, Zicsr, Zifencei:
>    Base ISA Xen is compiled for.
>  - C:
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index b1c614867c..844269df70 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -42,10 +42,11 @@ struct riscv_isa_ext_data {
>   *
>   * These flags express Xen's policy, not the ISA's rules: extensions which
>   * are architecturally tied to one XLEN (Zilsd on RV32, say) need no special
> - * treatment here, as they can only ever appear in the "riscv,isa" of a host
> - * of that XLEN, and guest_isa is masked against the host ISA bitmap anyway.
> - * They are only of use for extensions Xen chooses not to expose to guests of
> - * a given width despite the hardware implementing them.
> + * treatment here, as they can only ever appear in the "riscv,isa" or
> + * "riscv,isa-extensions" of a host of that XLEN, and guest_isa is masked
> + * against the host ISA bitmap anyway. They are only of use for extensions
> + * Xen chooses not to expose to guests of a given width despite the hardware
> + * implementing them.
>   */
>  #define RISCV_ISA_EXT_GUEST_NONE 0
>  #define RISCV_ISA_EXT_GUEST_RV32 (1U << 0)
> @@ -455,10 +456,41 @@ static int __init riscv_isa_parse_string(const char *isa,
>      return -EINVAL;
>  }
>  
> -static void __init riscv_fill_hwcap_from_isa_string(void)
> +int riscv_isa_ext_check(const struct dt_device_node *cpu)
> +{
> +    const char *base;
> +    const char *expected_base = IS_ENABLED(CONFIG_RISCV_64) ? "rv64i" : "rv32i";
> +    const char *node_name = dt_node_full_name(cpu);
> +    bool isa_ext_exists = dt_property_read_bool(cpu, "riscv,isa-extensions");
> +    bool isa_base_exists = !dt_property_read_string(cpu, "riscv,isa-base",
> +                                                    &base);
> +
> +    if ( isa_ext_exists && isa_base_exists )
> +    {
> +        if ( !strcmp(base, expected_base) )
> +            return 0;
> +        else
> +        {
> +            printk("%s: riscv,isa-base \"%s\" doesn't match %s\n",
> +                   node_name, base, expected_base);
> +            return -EINVAL;
> +        }
> +    }
> +    else if ( isa_ext_exists || isa_base_exists )
> +    {
> +        printk("%s: need both riscv,isa-extensions and riscv,isa-base\n",
> +               node_name);
> +        return -EINVAL;
> +    }
> +    else
> +        return -ENOENT;
> +}
> +
> +static void __init riscv_fill_hwcap_from_dt(void)
>  {
>      const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
>      const struct dt_device_node *cpu;
> +    bool first_cpu = true;
>  
>      if ( !cpus )
>      {
> @@ -471,6 +503,7 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
>          DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>          const char *isa;
>          unsigned long cpuid;
> +        int ret;
>  
>          bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
>  
> @@ -483,57 +516,48 @@ static void __init riscv_fill_hwcap_from_isa_string(void)
>          if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
>              continue;
>  
> -        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
> +        ret = riscv_isa_ext_check(cpu);
> +
> +        /* Try riscv,isa-extensions, fall back to the deprecated riscv,isa */
> +        if ( !ret )
>          {
> -            printk("Unable to find \"riscv,isa\" devicetree entry "
> -                   "for DT's cpu%ld node\n", cpuid);
> -            continue;
> +            for ( unsigned int i = 0; i < ARRAY_SIZE(riscv_isa_ext); i++ )
> +                if ( dt_property_match_string(cpu, "riscv,isa-extensions",
> +                                              riscv_isa_ext[i].name) >= 0 )
> +                    __set_bit(riscv_isa_ext[i].id, this_isa);
>          }
> +        else if ( ret == -ENOENT &&
> +                  !dt_property_read_string(cpu, "riscv,isa", &isa) )
> +        {
> +            for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
> +                if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
> +                    panic("DT binding: riscv,isa must be lowercase\n");
>  
> -        for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
> -            if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
> -                panic("According to DT binding riscv,isa must be lowercase\n");
> -
> -        if ( riscv_isa_parse_string(isa, this_isa) )
> -            panic("Check riscv,isa in dts file\n");
> +            if ( riscv_isa_parse_string(isa, this_isa) )
> +                panic("cpu%lu: riscv,isa failed to parse \"%s\"\n",
> +                      cpuid, isa);
> +        }
> +        else if ( ret == -EINVAL )
> +            panic("cpu%lu: invalid riscv,isa-base/riscv,isa-extensions\n",
> +                  cpuid);
> +        else
> +            panic("Unable to find \"riscv,isa\" or \"riscv,isa-extensions\" "
> +                  "devicetree entry for DT's cpu%lu node\n", cpuid);
>  
> -        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
> +        /*
> +         * The intersection may legitimately become empty, so don't use
> +         * bitmap_empty(riscv_isa) to detect the first CPU.
> +         */
> +        if ( first_cpu )
> +        {
>              bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +            first_cpu = false;
> +        }
>          else
>              bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>      }
>  }
>  
> -static bool __init has_isa_extensions_property(void)
> -{
> -    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
> -    const struct dt_device_node *cpu;
> -
> -    if ( !cpus )
> -    {
> -        printk("Missing /cpus node in the device tree?\n");
> -        return false;
> -    }
> -
> -    dt_for_each_child_node(cpus, cpu)
> -    {
> -        const char *isa;
> -
> -        if ( !dt_device_type_is_equal(cpu, "cpu") )
> -            continue;
> -
> -        if ( !dt_device_is_available(cpu) )
> -            continue;
> -
> -        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
> -            continue;
> -
> -        return true;
> -    }
> -
> -    return false;
> -}
> -
>  bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>                                     enum riscv_isa_ext_id id)
>  {
> @@ -690,16 +714,10 @@ void __init riscv_fill_hwcap(void)
>      bool all_extns_available = true;
>      unsigned long tmp;
>  
> -    riscv_fill_hwcap_from_isa_string();
> +    riscv_fill_hwcap_from_dt();
>  
>      if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
> -    {
> -        const char *failure_msg = has_isa_extensions_property() ?
> -                                  "\"riscv,isa-extension\" isn't supported" :
> -                                  "\"riscv,isa\" parsing failed";
> -
> -        panic("HW capabilities parsing failed: %s\n", failure_msg);
> -    }
> +        panic("HW cap: no usable CPU node or extension found\n");
>  
>      if ( csr_read_safe(CSR_STIMECMP, &tmp) )
>      {
> @@ -707,9 +725,10 @@ void __init riscv_fill_hwcap(void)
>                  "SSTC detected; supported for Xen use, but not for guests\n");
>  
>          /*
> -         * As there is no any guarantee that SSTC will be added to riscv,isa
> -         * property by OpenSBI(it doesn't add it now) or whatever ran before
> -         * Xen, it is needed to set this bit manually.
> +         * As there is no any guarantee that SSTC will be added to
> +         * riscv,isa or riscv,isa-extensions property by OpenSBI
> +         * (it doesn't add it now) or whatever ran before Xen,
> +         * it is needed to set this bit manually.
>           *
>           * Guest isolation is maintained by not setting ENVCFG_STCE in henvcfg.
>           */
> @@ -745,7 +764,7 @@ void __init riscv_fill_hwcap(void)
>          __set_bit(hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
>                    riscv_isa);
>          printk(XENLOG_WARNING
> -               "Svade/Svadu missing from \"riscv,isa\" - probed as %s\n",
> +               "Svade/Svadu missing from \"riscv,isa\" or \"riscv,isa-extensions\" - probed as %s\n",
>                 hw_update ? "svadu" : "svade");
>      }
>  
> diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
> index d42189e8eb..ef1d0e4889 100644
> --- a/xen/arch/riscv/include/asm/cpufeature.h
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -47,6 +47,7 @@ enum riscv_isa_ext_id {
>  };
>  
>  struct domain;
> +struct dt_device_node;
>  
>  void riscv_fill_hwcap(void);
>  void init_guest_isa(struct domain *d);
> @@ -54,6 +55,7 @@ const char *get_guest_isa_str(void);
>  
>  bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
>                                     enum riscv_isa_ext_id id);
> +int riscv_isa_ext_check(const struct dt_device_node *cpu);
>  
>  #endif /* __ASSEMBLER__ */
>  
> diff --git a/xen/arch/riscv/smpboot.c b/xen/arch/riscv/smpboot.c
> index 3b8bf98e20..95c4d650ac 100644
> --- a/xen/arch/riscv/smpboot.c
> +++ b/xen/arch/riscv/smpboot.c
> @@ -7,6 +7,7 @@
>  #include <xen/types.h>
>  
>  #include <asm/current.h>
> +#include <asm/cpufeature.h>
>  
>  cpumask_t __read_mostly cpu_online_map;
>  cpumask_t __ro_after_init cpu_possible_map;
> @@ -77,9 +78,32 @@ int dt_processor_hartid(const struct dt_device_node *node,
>          return -ENODEV;
>      }
>  
> +    if ( (ret = riscv_isa_ext_check(node)) == -ENOENT )
> +    {
> +        printk(XENLOG_DEBUG "CPU with hartid=%#lx has no riscv,isa-base, "
> +               "falling back to legacy riscv,isa\n", *hartid);
> +        goto fallback_to_riscv_isa;
> +    }
> +
> +    if ( ret )
> +        return -ENODEV;
> +
> +    if ( dt_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> +         dt_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> +         dt_property_match_string(node, "riscv,isa-extensions", "a") < 0 )
> +    {
> +        printk("CPU with hartid=%#lx does not support ima\n", *hartid);
> +        return -ENODEV;
> +    }
> +
> +    return 0;
> +
> + fallback_to_riscv_isa:
> +
>      if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
>      {
> -        printk("CPU with hartid=%#lx has no \"riscv,isa\" property\n", *hartid);
> +        printk("CPU with hartid=%#lx has no \"riscv,isa-base\" or "
> +               "\"riscv,isa\" property\n", *hartid);
>          return ret;
>      }
>  
> -- 
> 2.56.0
> 
> 

