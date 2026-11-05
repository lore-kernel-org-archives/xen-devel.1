Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AAF606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=EQo0xY9Y;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=YOSAD94E;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=UpGYwRaa;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=lw9DVe+x
Received: from list by lists.xenproject.org with outflank-mailman.1473481.1681153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmR7-0000Th-Gi; Thu, 05 Nov 2026 01:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473481.1681153; Thu, 05 Nov 2026 01:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmR7-0000TX-CP; Thu, 05 Nov 2026 01:38:41 +0000
Received: by outflank-mailman (input) for mailman id 1473481;
 Thu, 05 Nov 2026 01:38:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmR6-0000NC-2z
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:38:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmR5-00E0eP-Fj
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:38:39 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebddb2-2eae-0a2a0a5409dd-0a2a450cae26-46
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:39 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde1d-f479-0a2a450c0019-94a392179e10-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:38:38 +0100
Received: from pps.filterd (m0384718.ppops.net [127.0.0.1])
 by mx0a-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50moFX966677
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:38:36 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com
 (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
 by mx0a-00498f03.pphosted.com (PPS) with ESMTPS id 4hrc5ghvrb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:38:36 +0000 (GMT)
Received: from CY5PR19CA0075.namprd19.prod.outlook.com (2603:10b6:930:69::19)
 by SJ2PR16MB5540.namprd16.prod.outlook.com (2603:10b6:a03:547::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:38:32 +0000
Received: from CY7PEPF000000F5.namprd05.prod.outlook.com
 (2603:10b6:930:69:cafe::5b) by CY5PR19CA0075.outlook.office365.com
 (2603:10b6:930:69::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:38:32 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 CY7PEPF000000F5.mail.protection.outlook.com (10.167.247.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:38:32 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mctD2969098
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:38:31 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-use.ser.proofpoint.com
 [3.215.31.156])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrqv-3
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:38:31 -0500 (EST)
Received: from localhost ([19.12.76.222]) by cmsmtp with ESMTPSA
 id OmQvxwqHuDnFpOmQwx5u65; Thu, 05 Nov 2026 01:38:31 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=p1h
	Rhj/Ub8yOyNTkQn1HHcuh/Gv58YB72bl1ZifmJn0=; b=EQo0xY9YUIq0omHjObx
	+EwLjWbvAS9c8s8aJXBcVlzQqKkfivEnQhMflg/zZoQe8zoLroXB9SfPFCUE6kBq
	wfesetOLRMeqPNOsrgsztILPLsyoNFYkSsmFloBEwfjiby1h0q5qPUiIqBTYp99h
	sHv3Xj9Rp+tmzeD6tJbuhTzAwP27+6S3wr7xCpGKo3G6IMEfZ1LLoYKhFuQrmo1J
	4RIs3xNKqPXY+9csPWj+cXMo79cdMchfa3jW+gk7oJcLc1Ff4dzguK8kDL1EeqMD
	OECbdG3QOhrPi9CPmsknajX59SolAccybUFqaB7VkjbONFifb+24dNLXJQOuyYu/
	rtg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vESKsS62LR8FFrd4xbv7NzqKWKePFB2Vae9K62d//Y6vc6w9m8I19XCd1zrbcByBhtvnkZmO9K2RrEya6UI3rZ4+SPV4Ff5IPYIORJa6PCPybTDzdvDUlNO0C//408H6c1mqJ9nwJd6K5cWXj9mBuWAJ7ZRyq01aVzo3T8LbGSkenYqlvlP9vVA/TDckgWoN9+IMUU5u2kgz0UFNa/IPx9Mnpb3cow5svWz7LSu+i/zTiBL1RvJLfH66i7HR/8VA+lqmx/tcl27763cSPFv2IXoHn3+ooEzVIGA9OYy1EC/k7H3h4nlbAFnfLXhgiAlt5NG4UbiciZ/5XjMZrj1z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1hRhj/Ub8yOyNTkQn1HHcuh/Gv58YB72bl1ZifmJn0=;
 b=gfLRiijsOOI3WOmVk3RoaIav/BEtH2nxdfyRYnTvKpF4rJl7kiWpVPS5eS5cCm5498UnMkXx+F86eCSCJgxW5UJFUuBWA//RRYHqM96F8jCaT3G8tnQXnBQz2yJKyDgM1F36Q0+dgU1xin5spn+7wpfwFeKqWrGCVCmN6Y3/Fs91GO2SWhSA8bsmG5AQo5xqhtzxRkWOSkhe+Pgb5ddhadGn/JsqIEwfu796lxTPa3GHt48yDxqhiLbN4AcOyI+QhJPWTDllQdPi52RIbuKnyQlAulnoRU5jRaTnn4GGpg/LEUQ5PjgyZa03ENDQwIZHAmqHAfsxngLf8qNRBcRC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1hRhj/Ub8yOyNTkQn1HHcuh/Gv58YB72bl1ZifmJn0=;
 b=YOSAD94Es4QJUSryBFmyFYn6RzqLI7DVQTv3Jh7CDfDmq1L5C7PKjVoiklikdgDblnzASNPFkJ2vTJFQgLBLwkh0J0ihNFc3Eef5gWR0Z/hHWqCcCavjij3y3qeiMt7itfvz1/l94M3A+x5sFTxTltIbaGyQdpoPKZWCBh0FXOs=
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
	ppserprodsaar; bh=p1hRhj/Ub8yOyNTkQn1HHcuh/Gv58YB72bl1ZifmJn0=; b=
	UpGYwRaaPlnLK6tut9El4+sBs6Pt8uG5QrvebOzM5f+e8fODuPu5s+H07RSpGqxb
	+tPQ/MGK5yuSqLit33M/XkxTSVAAfj/vUSuFo94CUyMYsU0PjqYC8YcSMZhFE9JZ
	a3JHNag21i1qAtZDKy3AvyzfXVhezA7U0yffDeq93YhG2hZJWTnAgw7RSUa+yD1Y
	rpOY/iEhTCerP5pQmskUlurn6HMob5VJlNqG4ilQ0yECItFcmc4o1SgPWkXe+zJi
	DIE4WLqmfqG1UqourkN5qjjkqzCGXBbyMTrVOTHUaPsnScwQiRJcPWjt8bbcamJq
	LOH1nO8/FU4jNmHGUbFMqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=p1hRhj/
	Ub8yOyNTkQn1HHcuh/Gv58YB72bl1ZifmJn0=; b=lw9DVe+xUQ2yzw2BrRbBAAe
	l9+HKTCFPwU6fKnvb65/d9lS1/RVRN7vx8x8Sa9pCxkWf9eRO+Xig44Cd9tjUwdS
	9Movu6P+uB0tdYoO63lUF0xPN+ftwoDwtw4b/5f7ovw4+JMK9i34pwpc84mVUCJS
	HBVuHE+RRW7qDwahD4CDEZQf7px8hh0ofF5Jqp+wWP65LMtSA3nwzmr6NMqCDt98
	ACC3r3JZxJJn26lYHFdxRV7QtRduYwH3+3sgPf9nJbzefRfeFBd4IHglu8mCwoEQ
	Z0ml9UB4kPpGJFppKCgc1JG7JeHLRL24lZivAEug+M2QPdztcyiuK3gtKnF2Xfw=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmQvxwqHuDnFpOmQwx5u65
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 03/15] argo: export hypervisor command line for test
Date: Wed,  4 Nov 2026 17:38:05 -0800
Message-ID: <20261105013817.719823-4-dmukhin@ford.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105013817.719823-1-dmukhin@ford.com>
References: <20261105013817.719823-1-dmukhin@ford.com>
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
 definitions=main-2611050006
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F5:EE_|SJ2PR16MB5540:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f34cc0f8-5c50-40ad-c271-08df3add804e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261102123227099003|11063799006|56012099006|261021121427099003|261102130727099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DrQgdCE1/ikyLEj0JU7w2PynZmh8WT/hXP7zHXFtTwnhGitInq55Z8H2tsBCVorVy8JNROnXNM7fu689LSnHTfTY84mixQvsYSUM05iIKqa6vMnUa+sOdHMIFRHAWrKD9A0Sk5KARc7GYqkIB1MEe7FWSA//C3MLs1cDlxu0UQf0fwIS3o6vYdqWO9/uCEMAJ7v4WGMiBQCpm/gy4pKdJYEMVpLiO0ooynp7Vl0BfzLAQlLJkShJ6tqb/rPd95Fg3mfNfqTnGdpebNOhiPEDWHCvjHNzYwPog+uVwUiGVW7smM5xHY8asREeBiszuJY6JW5ip93TBBa0N1JF0B6Bhr9W3n1hvpa5QFwmjG47Zzcm0yGm93t2NdBfFvdaBBBz7UkvByRMjv+WztzYjzxw19nyXjMP5lYavUanZGS3q8gmMUqqJFGiSS4Bugxz3lff6mCf/cAx5ltBnsv1Ypn+FbqEX0jnuhjG8SY38HbFR9y4w3Dy7XqSP6CAFN8TQ9xfpwban0sL2hVP/wfRIOW4gUkORyNMHB8dRAw2/I+qbc1xK8dI6GK9migC9rpCE8RWDjNpwWbm1dMrkOVt3Nn+CBg2YK+/luiKz9fL6662VmgYu52sHbwHyliCDEuNgFQvvZ/iQ5gVYarh1nxuT+NOMNrHeypAZDiHmsCXxo2I6Eb7cWJyEJu1BMdQk8p/lTo+ucO/8Uy127XHNCViTwiNeg==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261102123227099003)(11063799006)(56012099006)(261021121427099003)(261102130727099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CQjHuQy3BrPK62OugUyvjB0K5OaT/sBqOGvFGL1+BE3ctRGtM0gLbJ8nmsJAUdxtWfyOYDFMOsPrJbFbxm65E01VHO0w5hwDhhrzgGh+TIU/Bq8WoSe9OF6T0xpEgFXhw5N3t6CBJ0MX/kYMmTQ3NbeeAn9pzia1C8Vo1GD2c3uNKGKTSlU5FfFs0QcbLxhV2lHBkSLjoeeqcEas3DRKZ2KRWpVICU7AaL5yiwFWLSTxbjcJAg0j1JaU+I5CcqWOB1jP5fnDM5oco7Vwpp/7mUqovOA8MvCg7dt4r01XCXP+lSZIo/Stfg0U9HV1x9FqiUpJDYVYIbjvBG4XbbKFs05Vvl7ld9y7sVzPFefISJlRd2ePJtMawLjiyigMY1blm8FEHiMqvs81ecUUFzG9d/x58TUZjjoWBtaVYazSvXVThyv8A2aRKGLSdxEOqyIZ
X-Exchange-RoutingPolicyChecked:
	jDOHOXqlN6QOl5NKxWQc2lyMX3280wB2jrBiUvXxUqwMriWITf6dHaY5nZp+9TGx5MK2zhE4MsO+cbaTLcDtmMrlWq1OqGR12wmo7r1u7p8B5EtDhKw10I4nk8TVR3u90jsBsnT0sRcnERB5Ey2Gh4uCZeWHw3LK6XUX/XNX1hFZZgbT5wqrSux+/1XrTVjPgfhBhBhjyNlgC9J8umXjczTM1FrJk3smN8g3d95rCUJbXDgI5NzY37MvkF/POUGY71w0lpSLQJHDbYcPYA353wpIpG1VFfzQgN96J5KlcCJzZFM24NKAqDUptS6trEx2LC2JBzFqE8xbCa7BPhkmEA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EyFKQgYboOl6t8NZmDeppaAy0ml4dQ6Ycj/7gxVPHL+L5KIC7Dkn8qr+304Unt1Gy0gqXix6vkgHchD10xOZ0X+eLm8MpkXKuoJLiZkRZTnGljSCn9WJ3IGKsxbostTTTu21CEXoR7sZvo1UcvjaOpHIPbCZvhveFSeEdJUSYtLR7spBkXYV2GfslbehTJHDO2L6O48DfewvROCiUfUCHSQXvMIns6EbffUmYue1b/hpqrejMU+4mQOc2wgMmbzOQ0SnI8bqh1T0Xw9/Hm79BODcL/pTDSDgibOqNWReEame/CcFDlNPMq7KsrZsoqRI8FuM83BByH33ZhX7/matdVJqsaAX0+eGfTEkPwKlfpbEclo9cZRmF0GY7KOoRPPXBXpG/TFIx6UlwIen4/nxE56gRZgCwRKz6nHJLLprn/0K7AJcizB4l7FkKx4XvNH4MviNrgOjbGvnkRyYW9YxwNQQS8RJ1df8HoFzqVCP3gc0krYCNuax3ggQaW62ve1zzLimD8RDVqyQIlKxWky+9sxkGlpviskiJSWNYvqG3ucv8xdzKojltxqP+vycLmkxeKtlTUL8tb+GgtI/NTfDy4zuP7LVs7WaCOGPRpTtzh984cTYkEQcYH2OuYcQVMFmBGujE2lcF7OmfZ2Wxkg9tw==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:38:32.3255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f34cc0f8-5c50-40ad-c271-08df3add804e
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR16MB5540
X-Authority-Analysis: v=2.4 cv=JawpPkKV c=1 sm=1 tr=0 ts=6aebde1c cx=c_pps
 a=QjrP5IPIVlaYm/X31SuGbg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=ARvDHhclS48edyKYUbLB:22 a=cbNQJ9GKAAAA:8
 a=lxmSaIH9oWjhjDVrdmUA:9 a=G69WFyCBNqGPyalROSdv:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX8stQpIJVxxZ2
 7r6s2GL9LHpYYUJ/8v6kzbW/HZHwLDf0lLz2pzJGXbPjvFMxOE8xEqDlUGgKmB0yrpxAxq0LGUm
 msToUzSkgjDtacrX7EoiM9SMbEI+7bdwwczIXu1UU0aqynU7zPv8J3M2PPPoYwzu7f2TETBMdeg
 CtiX5XhGqifeX+4PGpzuOQLLf4xc5SUQzi49kzQHwScFXgv+A0F/4f1uR0oBWMf6TJrZplT+9KN
 5smmiMXjkCbFjhxJBlbqs/Ne0xinvfRGb2Xz6oXF4pLyAhgW05qPXq+ONoNvxfDycFLWQa28F03
 EFgHz3IucsUhnuWIN6n1Cc6lcBFBmBbgSmigKkpIsyMIia0ALGXyueroepjrdocxykIUvt4CplB
 rARr50Ss+k0Jpo5PR+mvOyXnm74tuugRduhHAQvzHDq07GHoWnx0gyg4QdUgawDPkrr3jTe4F0x
 Yc+uXs9oUbP7jcp7L9Q==
X-Proofpoint-ORIG-GUID: 5po11N2PL5Vy7mn203FWOrb665jAVxxE
X-Proofpoint-GUID: 5po11N2PL5Vy7mn203FWOrb665jAVxxE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX9/EdjVxYmNZ1
 XOX399y5eQrJkgG5Kp2Gv8XKxzqW+auRdFtj/xLGazBtvO27tkr86pO48xitKqm0avsk0ZNr77S
 HZpaB1jxtuPCIzfmquNahdcO/2/6lYPGEFAvPW+CJQKovzDzCj5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050006
X-purgate-ID: tlsNG-d25034/1793842718-51538A5B-E60BE365/0/0
X-purgate-type: clean
X-purgate-size: 495
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Add bootargs.in for exporting hypervisor command line via
info.json

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tests/argo/bootargs.in | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 tests/argo/bootargs.in

diff --git a/tests/argo/bootargs.in b/tests/argo/bootargs.in
new file mode 100644
index 000000000000..f586be4de9fe
--- /dev/null
+++ b/tests/argo/bootargs.in
@@ -0,0 +1 @@
+argo=1,mac-permissive=1
-- 
2.55.0


