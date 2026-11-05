Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1EA606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=qsKjfjki;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=YMj2dIw6;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=nJrdlw2x;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=MVpnv9W5
Received: from list by lists.xenproject.org with outflank-mailman.1473546.1681261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRi-0006Fb-1m; Thu, 05 Nov 2026 01:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473546.1681261; Thu, 05 Nov 2026 01:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmRh-0006FS-QA; Thu, 05 Nov 2026 01:39:17 +0000
Received: by outflank-mailman (input) for mailman id 1473546;
 Thu, 05 Nov 2026 01:39:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmRg-00065k-JM
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:39:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmRf-00G70N-W7
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:39:16 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde3c-e002-0a2a0a5209dd-0a2a45099ad6-8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:15 +0100
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebde42-be1a-0a2a45090019-94a3921718c2-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:39:15 +0100
Received: from pps.filterd (m0482517.ppops.net [127.0.0.1])
 by m0482517.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A50nImt1645808
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 17:39:13 -0800
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
 by m0482517.ppops.net (PPS) with ESMTPS id 4hra2g3bcu-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 17:39:13 -0800 (PST)
Received: from MW4PR02CA0008.namprd02.prod.outlook.com (2603:10b6:303:16d::27)
 by SJ0PR16MB4205.namprd16.prod.outlook.com (2603:10b6:a03:31b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:39:08 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::1d) by MW4PR02CA0008.outlook.office365.com
 (2603:10b6:303:16d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:39:07 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:39:07 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mitN2969554
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:39:07 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrrs-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:39:06 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmRTxkNaH7GL1OmRUxfG2e; Thu, 05 Nov 2026 01:39:06 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=o9Z
	Yc4v+PWcDcI6hzGhrBFkRY7QkqkSCRaiH8rIbRQ8=; b=qsKjfjkiX5yPpRf74FV
	wou3dHR93d/mYutJ3Xio18fZGmw1BqE//p0QuFjNnXFW9uuPEuI4cxf6lIpwJ1RB
	0+vbvkVXW9l2xVymB8TQM93zFgGpV/ahXcYntl5hjEVCLbeBF0rpUODPvEl1lnAW
	izuo9PpM5NUSEj09mtRws87l6Yy8lGbMq1WMzTi710l3plOXnV+KAX5UFMAxzR2K
	1dKVl1LEAh4cZu0LFhYrGj6K3xtJ37cVc57A7JYW7S74QYi5exAeCdIg1zk06muA
	ashdMraJ4geMO5sh+0DwwSUeQFC/ryOphL3J1jEqyeLbEBe/KnqMgFnUn6ntKNpM
	63g==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n82vU5AwZKDYSJPqlRO8S82X1vrgmSl2ul7pup5Wifaz0qhsMFppoFc9NoqQSX6svTYpL9tkmQKE4IwvIukLo8kNZzlxr7NlkabnSNkqRPKR8kG0nIm918nBxoUpoV2k+Ji9D9P/T8umAyOq21rDQW1l5192wULPaAEqavDOMBVXsitjZvLWZdeR9eW2LFz80BuG/lqTe+F/FWOTU+uZa7Wf4r/RCzEGJ+pwp1MQiGLAdyN/L8rBgNGE6t4Slu1uNobX/CsnwkPMFtaZZ+KYj7W9IWuQb/vCPfQdIS16U4ptwbKVe3YodHX1bMhjuA7+Lo21NW9zKoFsH1BJ8tBygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9ZYc4v+PWcDcI6hzGhrBFkRY7QkqkSCRaiH8rIbRQ8=;
 b=Q6BhdLWrkr532Na6Ia0hnWmwaVOlvkjKbU+0l4+blX5p1Ha2CqxOAu/4VXx5PwJsVkfDmpAesUtip3d7NV5H+f5KTzAiIYnpvgPwdDyJrNSGOcWlwrOoV7Hb/Ic14I95cFGaGw5/6Jan9EDxXWtWQ22mdCsuKTS1c0PgK6OH7VmsyC4qVZ0j6UGLL3BverDz7O8jsltIEfY8lVd/YkmSgQMkygOpVyLbz8Q3lTasJQK30z/G3qKsZmypLFA8ylrGc7Pae6ScpGRANZqB/TPL3puaUjF4pcjLeldHVn4euU0w7wI+1jsCm9liudYMFMGOySngJBK1o/W5MdF/8cEonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9ZYc4v+PWcDcI6hzGhrBFkRY7QkqkSCRaiH8rIbRQ8=;
 b=YMj2dIw6gsM/RRs67vDDHokEKsYvYxsJs1SJJ6uHu4VfLS8/MqgQarc269AIBSjM31dhAa18blShr1wIyLX9PripOc9c9A8Lo122Ca63XZfALd4d2wSLRm+EawHR4MsmoeqxFOStUGyxE7ADiAshsH1sMC5GHFesQZqAbFxFpX4=
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
	ppserprodsaar; bh=o9ZYc4v+PWcDcI6hzGhrBFkRY7QkqkSCRaiH8rIbRQ8=; b=
	nJrdlw2xrC5fLnF57rnX69hBDQpmHbplMOsCULdl6Hr09MCbb4r16NuTzRCaKhtF
	+wPCUbBmCTTFFHGBahPzVRAG7bbjvv1gjaGzgS2aHAePQR5SFB+JNjnRO9H0+jph
	ahRz5hmBbtrJTAS88s9eNahX7+nN4oslyJcWBFphmCTMnd7xpsfvMxLWwCWwm81o
	kRvi5K3pgcR1KZHBksLU85ZUdhms+1qTf/UzZI8O2eal9IPS149bn5/j6138Aa0T
	KC3J2LyOVQOREWBOlFtOcrn7qELEuxihj8N9iJosYK9JNk6Ejs+xxQ3pV86j5n3D
	66yK9Dq8WhjQiWpmkdbDRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=o9ZYc4v
	+PWcDcI6hzGhrBFkRY7QkqkSCRaiH8rIbRQ8=; b=MVpnv9W5PYGMjXY64PYqtHL
	8orLI0g3p5YBOIkzAKImoklEqG/D/b1Ac6kEg7zWewEiV6zYJ/Xsb1GtL4lNcrft
	fmbRuSNYcKYBYYJ0zSvk1h5T8X4uVGuVTJKIALTuPA8gAwfSptnbyzq8ZdDRLuWD
	b2yNRHnx5sLQJAqboMO0B5J2mAL4lnyl04PGFuMcRpI0/tEOUdGRteZouSXSCtxC
	fBhDFZ+ft8a6Mq4lfZxjvYNTvMAtANCk0hgoGm7OM9BY8+IkKcEamq66uVmabapW
	8yta7oAWCHfYF2Mu4ehnQPJSAQlA08RTNxFuTXrPQx4UzXD9CswcPw0LenBspIQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmRTxkNaH7GL1OmRUxfG2e
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
        sstabellini@kernel.org, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [XTF PATCH v1 15/15] x86: add interrupt latency test (hvm64)
Date: Wed,  4 Nov 2026 17:38:17 -0800
Message-ID: <20261105013817.719823-16-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|SJ0PR16MB4205:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 057d6e16-7411-4a0f-9cdf-08df3add9523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|30052699003|1800799024|82310400026|36860700016|261102130727099003|11063799006|5023799004|261021123027099003|261021121427099003|56012099006|261026121527099003|261022105027099003|261022075727099003|261028144727099003|261102123227099003|261009223027099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	OdNjX0qC+wrIu6NTLmJvTr6Hv9y417/VoZZUVb0ro8zlmoqLSxcgVNKqZGpTejL1THWQBtu7WGrOs23asvEKdvY7mBj+IkTB6KG5guiPG1Sg/o6C8QQjl+yXLzPrtT2wXpF7qJA+YBmwMFML1I+qbPCMxmohHONM7xUmMZ+52al3+h17aVzhFH5QqAfiL/eMfs2wAbg2DB1FUb6Lg0BxH+MXKk/ALhZNkk+CbmDRcra4Y3aZEKMCeWQeTou0gGFzHwaoswYYd2ZkkmJe+alOhASLM7etLKksvF8INppOGYgRJmc/Zi9tpj1VopPueZXq/Lq5PckI4C7W9j/im2NVvGAvNAykHPrN/nWa+JBJrEpm2LR8iYQNZXQcC7XAzO+nlWcCTIR4hP7w5ech7ih83YE546ueO5iYgo50gWyMdkZaN3qO/WdTS6jVwzF2P/UgDC+0Ay2/tB/2EQg2UMpsoxH7xOqF9vZhjJZChcBxzkTVZNlCfnaHKC6RMgFS8+4fyWGayDbSWIV5z4rWGoW02PX5nEjUhIGQ/9VSxPuK/q5lHTxO7DW7SVOemHpT29ULq/X/ORDWKtT28WFBZm99Mb1tA+6O25riydA88aS01naFhemQF6dT/9My+1LhRIS2lDwEEoti9N9hgDxf/liF3FRusrtvxpZheLzQnfSVTW3grCTWgJUidRbdDLHB8bJMmq8tYrS/IQRuEqxugGXGeQ==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(30052699003)(1800799024)(82310400026)(36860700016)(261102130727099003)(11063799006)(5023799004)(261021123027099003)(261021121427099003)(56012099006)(261026121527099003)(261022105027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261009223027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/Xunv9mZvr/0NF1JJHynGt2svZAEoeLoRa3TzGP/JCLbTIa4fflOszDjgMAgXbZQ10+cAqoniiKwt2/0qNjHNYm4ByZkPKmukbbhYrlops2znT7qBOQjXqJKwsnxPYZrgEkATkkQCrvtbPMAaiv+MinbQB/tPoD1S0BafdC7GbF1biMrHB+UHFjpBn9g679PSwkEnW76SGtetLPltluB2/O9ZmZFRR2RC5WHblB2O4HPcLcha8VThdIFfTUPTDV9GhgMlUNGzBo8H3y+jzRZnOGVnYGRjMHX2mte3zB4HsyXJz0CQe98WbTSDbWSob1/qaXLmWF7MdkKWHuxi03vhGXmq+BBmFS57nAH5w3TW50/qi6N6j3G/RHiQP/vHt1ozUUxDjl9prW//7rNPmXVIZLuvFnM39/8XrWlqAWtvuceWwFuTYAvK8J2C5EbPAM4
X-Exchange-RoutingPolicyChecked:
	0s/MojbgnC3OvsXRx1VHcBD3r6x1e4qs/7p0kf0jEJ62YsrwWB89DjLj4vhAGqQX/Tz+9hoE58n/2esYHLriRdZHFQ52gc/bH62V36otVUeVdOXejgaw2aRcPfFoxhBbi3+Sxg7umfoIbSqNYkiaosYoPQKVOEOVI1iobEdwXmV6dETyDvyDCcxN8KNjtlxfJqlhE/8foCg+rryqlrP+xB14Mn2NA81m1YWz7GQYoT8hqHoVqnYQzDt1ygR8kRpZN58gTN7Gr7x9l8XJAECz7L8CDwlfdvNTgT67gL5Yty8MvopNEDk3IQCsYJxkgPZ0UfExyHWt3lP++wDYIPBwJA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vJBg6ryy4xWd5jhHIxJRB6tL/mcOzsHRhs2r53xKpVPoDh4nqEc5b4yLZzR1psNAvz6zHxVK5wuBSucuN7h6nHwPd1PJWmz5ifDq2v47iWh8K+2ExaR6YfssJZXb4EhcfR+7mVyI6IG74auw5inpPn5PkAOG51K8LvN8orNTsSACz1e9Zx4GrFZCl7vAhD1q3rbRsFbLJbwMJgV3F9FI7mbMDJBHTHC31vjbFMhJPuOm5bzZ0x3NraHsAyHu835K8DrayMaQ1Q/qsqJUHtrMwBrauVnrdXyw4JNdJvxsJ1IrawQbcbQ8C0YODtjcqAYhzuuS7fVe8+durdupa/dj7PLS2S7LrkVQlYv/kMPRVLOsl09ymwMvZOl3aGylG2KWH+yJnQqpr48rJcCnQT227J3vKRyWtYsQJHA5BISOQPqrrEwSc9a7LT3q9ybXxPHj+UKBhMVnDHoeAnQUunfrwLRC2HG7Obgmr3pjCGwdNfMWlxM8/QZnKTWPJhxV6ZVEp4bH8v1iAJIIyiI0e10c2ElVfGVFWUFWg3yqN+uc/qNDkYc1/XbNQ0a85/S9d5G4/udSo1ASRvmBWJ+oTu7sGE3XHLcTWBXBbD2C1veesaeu0w8+ysH6zkFIUhgNkvyllTUp2W+Y/R64lWeKORn5VA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:39:07.3743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 057d6e16-7411-4a0f-9cdf-08df3add9523
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB4205
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6aebde41 cx=c_pps
 a=uej8S9duoQdrJ4czObxKNw==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=MLwXIh1eZMowsRZfVxRb:22 a=cbNQJ9GKAAAA:8
 a=LXXH8h5DU--Z2YSLYwQA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfX3s2QwczfEVbU
 yuYB116vhNDWiroKNbTLLH17sHzEBNgqdBZRIIw2rb8kSfcVAFoaeoEu05K5Pz6v7KhaBOQsQ8G
 xiRC9qejn52sMVn0yeAQKhxKQqTuOoaVhsc3sV/hJnPuq9kW+J8uuVTvOKD2iEAIXiS/HFcD8Kc
 hAsqDrkkTiF1H2ubWW07WlutHxTTdu/6PS6uq4ZihlspgsQQvUcddgMh6RLajQ/dqVirV9eHs17
 DK0CUvMpzbK2O2qTJ+duTVW4yDO50C11FCrK/sP/S2hpvJxlKct53Kquab1krpIoZmExss7DuA1
 lR6mgp+ozmdbQR4p06teH7C0iNYHx5XtPlBIAPfrvsq+pVJA+BvG6/imeOibcWzF+qoz6w6Cr1f
 XAEDXpjuVeIPHKXgvc50O0+ROFHYTrXjSjUThN/qCq3zSZ4P0O9KWpu0k6P+nyx86OLaCZdjRvi
 1quhMBsRUnIZzbpFpYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNiBTYWx0ZWRfXyoC7ARf/4IKV
 ajafgDMo6hUxQg/e+iZN0ucuwMlUWsO4Cu+zlqo8NyLyLewAysO/ARnSQCai+RzGYUwNfxgc211
 2qru1bc3UoIBZHxsvivRH9lJvO9fUHxZCud2O5gLhtQBzrHyG+zI
X-Proofpoint-ORIG-GUID: f-rbkOIWaWaZpTA9PclLfZbUB38eUNoK
X-Proofpoint-GUID: f-rbkOIWaWaZpTA9PclLfZbUB38eUNoK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050006
X-purgate-ID: tlsNG-bad1c0/1793842755-BFCD7034-FFE3EF77/0/0
X-purgate-type: clean
X-purgate-size: 28042
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

Introduce new test to measure IPI/posted interrupts latencies.

The test uses 2 vCPUs.

vCPU#0 (BSP) issues IPI vector 0x21 to vCPU#1 (AP) in a loop, then performs
data accounting. vCPU#1 runs some noisy code which keeps trashing the CPU
cache.

vCPU#1 (AP) is brought up via minimal framework which is frankenstained
from xsa-472-3. It just starts AP in hvm64 flat mode. Xen conveniently
provides a way to skip INIT/SIPI steps by using VCPUOP_{initialise,up}
hypercalls, which simplified solution.

Had to plumb minimal GDT setup and re-initialize APIC into xAPIC mode.

Also, I was lucky with Xen exposing TSC frequency via CPUID.

Exported and used domctl hypercalls, specifically so it is possible to use
XEN_DOMCTL_DEBUG_OP_POSTED_INTR.

Added missing evtchn hypercall to EVTCHNOP_bind_ipi/EVTCHNOP_unmask test
vector.

There are several measurements done.

    vCPU0                                     vCPU1
                                       executes some workload
 +-> t0
 |   |
 |   write ICR2 [*]
 r   write ICR
 e   |---------------- interrupt -----------> t0' = recv_tsc
 p   return from APIC emulation [*']          ISR
 e   |                                        t1' = handler_tsc
 a   t1
 t   |
 |   sync against ISR
 |   |
 +---+
    vCPU0                                     vCPU1

IRQ delivery latency : t0' - t0
IRQ issue latency    : t1  - t0
IRQ handler latency  : t1' - t0'

[*]  For event channel that is EVTCHNOP_send hypercall.
[*'] For event channel that is return from the EVTCHNOP_send hypercall.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tests/interrupt-latency/Makefile     |  11 +
 tests/interrupt-latency/ap-asm.S     |  50 ++
 tests/interrupt-latency/ap-main.c    | 164 +++++++
 tests/interrupt-latency/ap.h         |  12 +
 tests/interrupt-latency/bootargs.in  |   1 +
 tests/interrupt-latency/extra.cfg.in |   1 +
 tests/interrupt-latency/main.c       | 706 +++++++++++++++++++++++++++
 7 files changed, 945 insertions(+)
 create mode 100644 tests/interrupt-latency/Makefile
 create mode 100644 tests/interrupt-latency/ap-asm.S
 create mode 100644 tests/interrupt-latency/ap-main.c
 create mode 100644 tests/interrupt-latency/ap.h
 create mode 100644 tests/interrupt-latency/bootargs.in
 create mode 100644 tests/interrupt-latency/extra.cfg.in
 create mode 100644 tests/interrupt-latency/main.c

diff --git a/tests/interrupt-latency/Makefile b/tests/interrupt-latency/Makefile
new file mode 100644
index 000000000000..43f2a3c69a62
--- /dev/null
+++ b/tests/interrupt-latency/Makefile
@@ -0,0 +1,11 @@
+include $(ROOT)/build/common.mk
+
+NAME      := interrupt-latency
+CATEGORY  := functional
+TEST-ENVS := hvm64
+
+TEST-EXTRA-CFG := extra.cfg.in
+
+obj-perenv += main.o ap-main.o ap-asm.o
+
+include $(ROOT)/build/gen.mk
diff --git a/tests/interrupt-latency/ap-asm.S b/tests/interrupt-latency/ap-asm.S
new file mode 100644
index 000000000000..60587c803ac2
--- /dev/null
+++ b/tests/interrupt-latency/ap-asm.S
@@ -0,0 +1,50 @@
+#include <arch/segment.h>
+
+    .text
+
+    .globl ap_load_gdt
+    .type ap_load_gdt, @function
+ap_load_gdt:
+    lgdt    gdt_ptr(%rip)
+    pushq   $__KERN_CS
+    leaq    1f(%rip), %rax
+    pushq   %rax
+    lretq
+1:
+    ret
+    .size ap_load_gdt, . - ap_load_gdt
+
+    .globl x86_vec_avail_entry
+    .type x86_vec_avail_entry, @function
+x86_vec_avail_entry:
+    pushq %rax
+    pushq %rcx
+    pushq %rdx
+    pushq %rsi
+    pushq %rdi
+    pushq %r8
+    pushq %r9
+    pushq %r10
+    pushq %r11
+    pushq %r12
+
+    movq %rsp, %r12
+    andq $-16, %rsp
+
+    call ap_irq_handler
+
+    movq %r12, %rsp
+
+    popq  %r12
+    popq  %r11
+    popq  %r10
+    popq  %r9
+    popq  %r8
+    popq  %rdi
+    popq  %rsi
+    popq  %rdx
+    popq  %rcx
+    popq  %rax
+
+    iretq
+    .size x86_vec_avail_entry, . - x86_vec_avail_entry
diff --git a/tests/interrupt-latency/ap-main.c b/tests/interrupt-latency/ap-main.c
new file mode 100644
index 000000000000..af781232df40
--- /dev/null
+++ b/tests/interrupt-latency/ap-main.c
@@ -0,0 +1,164 @@
+/**
+ * IPI latency test.
+ */
+
+#include <arch/apic.h>
+#include <arch/desc.h>
+#include <arch/system.h>
+
+#include <xtf/framework.h>
+#include <xtf/time.h>
+#include <xtf.h>
+
+#include "ap.h"
+
+#if !defined(NR_APS)
+#error NR_APS is not defined!
+#endif
+
+struct ap_percpu {
+    unsigned int apic_id;
+    unsigned int cpu;
+};
+
+static struct ap_percpu ap_cpu[NR_APS] __page_aligned_bss;
+
+static uint8_t ap_stack[NR_APS][PAGE_SIZE] __page_aligned_bss;
+
+/* See ap-asm.S */
+extern void ap_load_gdt(void);
+extern void x86_vec_avail_entry(void);
+
+static const struct xtf_idte x86_vec_avail_idte = {
+    .addr = _u(x86_vec_avail_entry),
+    .cs   = __KERN_CS,
+    .dpl  = 0,
+};
+
+int ap_set_irq(unsigned int apic_id, unsigned int vector)
+{
+    apic_write(APIC_ICR2, SET_xAPIC_ID(apic_id));
+    apic_write(APIC_ICR,  vector | APIC_DM_FIXED);
+
+    return 0;
+}
+
+static int ap_ipi_init(void)
+{
+    int rc;
+
+    xtf_load_idt();
+
+    xtf_set_idte(X86_VEC_AVAIL + 0, &x86_vec_avail_idte);
+    xtf_set_idte(X86_VEC_AVAIL + 1, &x86_vec_avail_idte);
+
+    rc = apic_init(APIC_MODE_XAPIC);
+    if ( rc )
+        return rc;
+
+    apic_write(APIC_TPR, 0);
+
+    return 0;
+}
+
+static struct ap_percpu *ap_percpu_ptr(unsigned int cpu)
+{
+    if ( !cpu || cpu > NR_APS )
+        return NULL;
+
+    return &ap_cpu[cpu - 1];
+}
+
+static void ap_main(struct ap_percpu *percpu, void (* thread)(void))
+{
+    unsigned int apic_id;
+
+    xtf_irq_disable();
+
+    ap_load_gdt();
+
+    if ( ap_ipi_init() )
+        goto fail;
+
+    apic_id = get_apic_id();
+    ACCESS_ONCE(percpu->apic_id) = apic_id;
+
+    while ( !ACCESS_ONCE(percpu->cpu) )
+        cpu_relax();
+
+    thread();
+
+ fail:
+    arch_crash_hard();
+}
+
+int ap_start(unsigned int cpu, void (* thread)(void))
+{
+    struct xen_vcpu_hvm_context ap_ctx = { 0 };
+    struct ap_percpu *percpu = ap_percpu_ptr(cpu);
+    int rc;
+
+    if ( cpu == 0 )
+        /* Nothing to do. */
+        return 0;
+
+    /*
+     * Setup vCPU context.
+     */
+
+    ap_ctx.mode                     = VCPU_HVM_MODE_64B;
+
+    ap_ctx.cpu_regs.x86_64.rdi      = _u(percpu);
+    ap_ctx.cpu_regs.x86_64.rsi      = _u(thread);
+    ap_ctx.cpu_regs.x86_64.rip      = _u(ap_main);
+    /* Stack grows backwards and keep canary. */
+    ap_ctx.cpu_regs.x86_64.rsp      = _u(&ap_stack[cpu - 1][PAGE_SIZE]) - 8;
+
+    ap_ctx.cpu_regs.x86_64.rflags   = X86_EFLAGS_MBS;
+
+    /* Same execution environment as BSP. */
+    ap_ctx.cpu_regs.x86_64.cr0      = read_cr0();
+    ap_ctx.cpu_regs.x86_64.cr3      = read_cr3();
+    ap_ctx.cpu_regs.x86_64.cr4      = read_cr4();
+    ap_ctx.cpu_regs.x86_64.efer     = rdmsr(MSR_EFER);
+
+    rc = hypercall_vcpu_op(VCPUOP_initialise, cpu, &ap_ctx);
+    if ( rc )
+    {
+        xtf_error("BSP: unable to init CPU%u: %d\n", cpu, rc);
+        return rc;
+    }
+
+    /*
+     * Start the vCPU execution.
+     */
+
+    rc = hypercall_vcpu_op(VCPUOP_up, cpu, NULL);
+    if ( rc )
+    {
+        xtf_error("BSP: unable to start CPU%u: %d\n", cpu, rc);
+        return rc;
+    }
+
+    /*
+     * Synchronize the AP thread execution.
+     */
+
+    while ( !ACCESS_ONCE(percpu->apic_id) )
+        cpu_relax();
+
+    ACCESS_ONCE(percpu->cpu) = cpu;
+    smp_mb();
+
+    return 0;
+}
+
+unsigned int ap_apic_id(unsigned int cpu)
+{
+    struct ap_percpu *percpu = ap_percpu_ptr(cpu);
+
+    if ( percpu )
+        return percpu->apic_id;
+
+    return get_apic_id();
+}
diff --git a/tests/interrupt-latency/ap.h b/tests/interrupt-latency/ap.h
new file mode 100644
index 000000000000..02a214af8fea
--- /dev/null
+++ b/tests/interrupt-latency/ap.h
@@ -0,0 +1,12 @@
+#ifndef __AP_H_
+#define __AP_H_
+
+#define NR_APS  1
+
+int ap_start(unsigned int cpu, void (* thread)(void));
+
+int ap_set_irq(unsigned int apic_id, unsigned int vector);
+
+unsigned int ap_apic_id(unsigned int cpu);
+
+#endif /* __AP_H_ */
diff --git a/tests/interrupt-latency/bootargs.in b/tests/interrupt-latency/bootargs.in
new file mode 100644
index 000000000000..c56ba76658e1
--- /dev/null
+++ b/tests/interrupt-latency/bootargs.in
@@ -0,0 +1 @@
+sched=null dom0_max_vcpus=2 dom0_vcpus_pin smt=0 cpuidle=0 cpufreq=xen:performance watchdog=0 bootscrub=0 svm_avic=1 -- samples=20000000
diff --git a/tests/interrupt-latency/extra.cfg.in b/tests/interrupt-latency/extra.cfg.in
new file mode 100644
index 000000000000..95c6aa2abaa9
--- /dev/null
+++ b/tests/interrupt-latency/extra.cfg.in
@@ -0,0 +1 @@
+vcpus = 2
diff --git a/tests/interrupt-latency/main.c b/tests/interrupt-latency/main.c
new file mode 100644
index 000000000000..907bad7752ec
--- /dev/null
+++ b/tests/interrupt-latency/main.c
@@ -0,0 +1,706 @@
+/**
+ * Interrupt latency test:
+ * - IPI
+ * - Syntheric interrupts (evtchn)
+ */
+
+#include <arch/system.h>
+
+#include <xtf/statistics.h>
+#include <xtf/time.h>
+#include <xtf.h>
+
+#include "ap.h"
+
+const char test_title[] = "Interrupt latency test";
+
+#define DEST_CPU_ID         1
+#define NOISE_PAGE_SIZE     KB(256)
+
+/* Interrupt acceleration control operations. */
+enum {
+    POSTED_INTR_DISABLE     = 0,
+    POSTED_INTR_ENABLE      = 1,
+    POSTED_INTR_DUMP_STATS  = 2,
+};
+
+/* Collected statistics. */
+enum stats_id {
+    STAT_IRQ_SEND           = 0,
+    STAT_IRQ_DELIVERY       = 1,
+    STAT_IRQ_HANDLER        = 2,
+    NR_STATS,
+};
+
+enum metric_id {
+    METRIC_MINIMUM          = 0,
+    METRIC_MAXIMUM          = 1,
+    METRIC_AVERAGE          = 2,
+    METRIC_P99              = 3,
+    METRIC_ELAPSED_TIME     = 4,
+    NR_METRICS,
+};
+
+enum workload_id {
+    WORKLOAD_IPI_NOACCEL    = 0,
+    WORKLOAD_IPI_ACCEL      = 1,
+    WORKLOAD_EVTCHN_NOACCEL = 2,
+    WORKLOAD_EVTCHN_ACCEL   = 3,
+    NR_WORKLOADS,
+};
+
+enum group_id {
+    TEST_IPI                = 0,
+    TEST_EVTCHN             = 1,
+    NR_TESTS,
+};
+
+struct event {
+    union {
+        evtchn_port_t evtchn;
+        struct {
+            unsigned int apic_id;
+            unsigned int vector;
+        } ipi;
+    } u;
+};
+
+struct workload {
+    const char *name;
+    unsigned int intr_vector;
+    unsigned int init_debug_op;
+    unsigned int done_debug_op;
+    struct event event;
+    struct statistics stats[NR_STATS];
+    int (*setup)(unsigned int idx, unsigned int cpu, unsigned int vector);
+    int (*send)(struct event *);
+    void (*ack)(struct event *);
+    void (*teardown)(unsigned int idx);
+};
+
+struct test_group {
+    const char *name;
+    enum workload_id noaccel;
+    enum workload_id accel;
+    enum stats_id stats;
+    enum metric_id metric;
+};
+
+struct shared_stats {
+    uint64_t t_handler_start;
+    uint64_t t_handler_end;
+    uint64_t t_elapsed;
+    unsigned int seq;
+    unsigned int isr_fail_cnt;
+    unsigned int irr_fail_cnt;
+    unsigned int t_skew_cnt;
+};
+
+static int ipi_setup(unsigned int idx, unsigned int cpu, unsigned int vector);
+static int ipi_send(struct event *e);
+static void ipi_teardown(unsigned int idx);
+
+static int evtchn_setup(unsigned int idx, unsigned int cpu, unsigned int vector);
+static int evtchn_send(struct event *e);
+static void evtchn_ack(struct event *e);
+static void evtchn_teardown(unsigned int idx);
+
+static struct workload workload[NR_WORKLOADS] = {
+    [WORKLOAD_IPI_NOACCEL] = {
+        .name = "IPI noaccel",
+        .intr_vector = X86_VEC_AVAIL,
+        .init_debug_op = POSTED_INTR_DISABLE,
+        .done_debug_op = POSTED_INTR_DUMP_STATS,
+        .setup = ipi_setup,
+        .send = ipi_send,
+        .teardown = ipi_teardown,
+        .stats = {
+            [STAT_IRQ_SEND] = {
+                .name = "noaccel: IPI send latency (VCPU#0)",
+                .min = ~0ULL,
+            },
+            [STAT_IRQ_DELIVERY] = {
+                .name = "noaccel: IPI delivery latency (VCPU#0 -> VCPU#1)",
+                .min = ~0ULL,
+            },
+            [STAT_IRQ_HANDLER] = {
+                .name = "noaccel: IPI handler latency (VCPU#1)",
+                .min = ~0ULL,
+            },
+        },
+    },
+
+    [WORKLOAD_IPI_ACCEL] = {
+        .name = "IPI accel",
+        .intr_vector = X86_VEC_AVAIL,
+        .init_debug_op = POSTED_INTR_ENABLE,
+        .done_debug_op = POSTED_INTR_DUMP_STATS,
+        .setup = ipi_setup,
+        .send = ipi_send,
+        .teardown = ipi_teardown,
+        .stats = {
+            [STAT_IRQ_SEND] = {
+                .name = "accel: IPI send latency (VCPU#0)",
+                .min = ~0ULL,
+            },
+            [STAT_IRQ_DELIVERY] = {
+                .name = "accel: IPI delivery latency (VCPU#0 -> VCPU#1)",
+                .min = ~0ULL,
+            },
+            [STAT_IRQ_HANDLER] = {
+                .name = "accel: IPI handler latency (VCPU#1)",
+                .min = ~0ULL,
+            },
+        },
+    },
+
+    [WORKLOAD_EVTCHN_NOACCEL] = {
+        .name = "evtchn noaccel",
+        .intr_vector = X86_VEC_AVAIL + 1,
+        .init_debug_op = POSTED_INTR_DISABLE,
+        .done_debug_op = POSTED_INTR_DUMP_STATS,
+        .setup = evtchn_setup,
+        .send = evtchn_send,
+        .ack = evtchn_ack,
+        .teardown = evtchn_teardown,
+        .stats = {
+            [STAT_IRQ_SEND] = {
+                .name = "noaccel: evtchn send latency (VCPU#0)",
+                .min = ~0ULL,
+            },
+            [STAT_IRQ_DELIVERY] = {
+                .name = "noaccel: evtchn delivery latency (VCPU#0 -> VCPU#1)",
+                .min = ~0ULL,
+            },
+            [STAT_IRQ_HANDLER] = {
+                .name = "noaccel: evtchn handler latency (VCPU#1)",
+                .min = ~0ULL,
+            },
+        },
+    },
+
+    [WORKLOAD_EVTCHN_ACCEL] = {
+        .name = "evtchn accel",
+        .intr_vector = X86_VEC_AVAIL + 1,
+        .init_debug_op = POSTED_INTR_ENABLE,
+        .done_debug_op = POSTED_INTR_DUMP_STATS,
+        .setup = evtchn_setup,
+        .send = evtchn_send,
+        .ack = evtchn_ack,
+        .teardown = evtchn_teardown,
+        .stats = {
+            [STAT_IRQ_SEND] = {
+                .name = "accel: evtchn send latency (VCPU#0)",
+                .min = ~0ULL,
+            },
+            [STAT_IRQ_DELIVERY] = {
+                .name = "accel: evtchn delivery latency (VCPU#0 -> VCPU#1)",
+                .min = ~0ULL,
+            },
+            [STAT_IRQ_HANDLER] = {
+                .name = "accel: evtchn handler latency (VCPU#1)",
+                .min = ~0ULL,
+            },
+        },
+    },
+};
+
+static struct test_group groups[NR_TESTS] = {
+    [TEST_IPI] = {
+        .name = "IPI latency",
+        .noaccel = WORKLOAD_IPI_NOACCEL,
+        .accel = WORKLOAD_IPI_ACCEL,
+        .stats = STAT_IRQ_DELIVERY,
+        .metric = METRIC_ELAPSED_TIME,
+    },
+
+    [TEST_EVTCHN] = {
+        .name = "evtchn latency",
+        .noaccel = WORKLOAD_EVTCHN_NOACCEL,
+        .accel = WORKLOAD_EVTCHN_ACCEL,
+        .stats = STAT_IRQ_DELIVERY,
+        .metric = METRIC_ELAPSED_TIME,
+    },
+};
+
+static struct shared_stats shared_stats[NR_WORKLOADS] __page_aligned_bss;
+
+static uint8_t noise_page[NOISE_PAGE_SIZE] __page_aligned_bss;
+
+static unsigned int current_workload = WORKLOAD_IPI_NOACCEL;
+static unsigned int opt_samples_measure;
+static unsigned int opt_samples_warmup;
+static unsigned int noisy_neighbour_seq;
+static domid_t domid;
+
+static int ipi_setup(unsigned int idx, unsigned int cpu, unsigned int vector)
+{
+    struct workload *w = &workload[idx];
+
+    w->event.u.ipi.apic_id = ap_apic_id(cpu);
+    w->event.u.ipi.vector = vector;
+
+    return 0;
+}
+
+static int ipi_send(struct event *e)
+{
+    return ap_set_irq(e->u.ipi.apic_id, e->u.ipi.vector);
+}
+
+static void ipi_teardown(unsigned int idx)
+{
+    struct workload *w = &workload[idx];
+
+    w->event.u.ipi.apic_id = 0;
+    w->event.u.ipi.vector = 0;
+}
+
+static int evtchn_setup(unsigned int idx, unsigned int cpu, unsigned int vector)
+{
+    struct workload *w = &workload[idx];
+    struct evtchn_bind_ipi bind = {
+        .vcpu = cpu,
+    };
+    int rc;
+
+    rc = hypercall_set_evtchn_upcall_vector(cpu, vector);
+    if ( rc )
+        return rc;
+
+    rc = hypercall_evtchn_bind_ipi(&bind);
+    if ( rc )
+        return rc;
+
+    rc = hypercall_evtchn_unmask(bind.port);
+    if ( rc )
+        return rc;
+
+    w->event.u.evtchn = bind.port;
+
+    return 0;
+}
+
+static int evtchn_send(struct event *e)
+{
+    return hypercall_evtchn_send(e->u.evtchn);
+}
+
+static void evtchn_ack(struct event *e)
+{
+    struct vcpu_info *vi = &shared_info.vcpu_info[DEST_CPU_ID];
+
+    if ( !test_and_clear_bit(e->u.evtchn, shared_info.evtchn_pending) )
+        (void)vi;
+
+    ACCESS_ONCE(vi->evtchn_upcall_pending) = 0;
+    ACCESS_ONCE(vi->evtchn_pending_sel) = 0;
+}
+
+static void evtchn_teardown(unsigned int idx)
+{
+    struct workload *w = &workload[idx];
+
+    (void)hypercall_evtchn_close(w->event.u.evtchn);
+    w->event.u.evtchn = 0;
+}
+
+static int hvm_debug_posted_intr(unsigned int arg)
+{
+    struct xen_domctl domctl = { 0 };
+
+    domctl.domain = domid;
+    domctl.cmd = XEN_DOMCTL_debug_op;
+    domctl.interface_version = XEN_DOMCTL_INTERFACE_VERSION;
+    domctl.u.debug_op = (struct xen_domctl_debug_op){
+        .op = XEN_DOMCTL_DEBUG_OP_POSTED_INTR,
+        .vcpu = ~0U,
+        .arg = arg,
+    };
+
+    return hypercall_domctl(&domctl);
+}
+
+void ap_irq_handler(void)
+{
+    unsigned int idx = ACCESS_ONCE(current_workload);
+    struct workload *w = &workload[idx];
+    struct shared_stats *s = &shared_stats[idx];
+    uint64_t start, end;
+
+    start = rdtsc_ordered();
+
+    if ( w->ack )
+        w->ack(&w->event);
+
+    if ( !apic_isr_read(w->intr_vector) )
+        ACCESS_ONCE(s->isr_fail_cnt)++;
+
+    if ( apic_irr_read(w->intr_vector) )
+        ACCESS_ONCE(s->irr_fail_cnt)++;
+
+    apic_write(APIC_EOI, APIC_EOI_ACK);
+
+    end = rdtsc_ordered();
+
+    ACCESS_ONCE(s->t_handler_start) = start;
+    ACCESS_ONCE(s->t_handler_end) = end;
+
+    smp_wmb();
+    ACCESS_ONCE(s->seq)++;
+}
+
+static void do_noisy_neighbour(void)
+{
+    unsigned int nr = NOISE_PAGE_SIZE / sizeof(uint64_t);
+    unsigned int i;
+    uint64_t *noise = (uint64_t *)noise_page;
+    uint64_t sum = 0;
+
+    xtf_irq_enable();
+
+    for ( i = 0; i < nr; i++)
+        noise[i] = i;
+
+    while ( !xtf_status_reported() )
+    {
+        ACCESS_ONCE(noisy_neighbour_seq)++;
+
+        for ( i = 0; i < nr; i++ )
+        {
+            sum += ACCESS_ONCE(noise[i]);
+            ACCESS_ONCE(noise[i]) = sum;
+        }
+    }
+}
+
+static void do_workload_on_noisy_neighbour(enum workload_id idx, unsigned int cpu)
+{
+    struct workload *w = &workload[idx];
+    struct statistics *stats = w->stats;
+    struct shared_stats *s = &shared_stats[idx];
+    unsigned int i;
+    int rc;
+
+    rc = w->setup(idx, cpu, w->intr_vector);
+    if ( rc )
+        return xtf_error("BSP: cannot ->init(%d): %d\n", idx, rc);
+
+    i = 0;
+    while ( i < opt_samples_warmup + opt_samples_measure )
+    {
+        unsigned int seq;
+        uint64_t t_send_start, t_send_end;
+        uint64_t t_handler_start, t_handler_end;
+
+        seq = ACCESS_ONCE(s->seq);
+
+        t_send_start = rdtsc_ordered();
+
+        rc = w->send(&w->event);
+
+        t_send_end = rdtsc_ordered();
+
+        if ( rc )
+            return xtf_error("BSP: cannot ->send(%u): %d\n", idx, rc);
+
+        while ( ACCESS_ONCE(s->seq) == seq )
+            cpu_relax();
+
+        smp_rmb();
+
+        t_handler_start = ACCESS_ONCE(s->t_handler_start);
+        t_handler_end = ACCESS_ONCE(s->t_handler_end);
+
+        /*
+         * Mitigate for inter-core TSC skew, looks like vCPU#1 can
+         * report TSC values from the past; drop such samples.
+         */
+        if ( t_send_start > t_handler_start )
+        {
+            s->t_skew_cnt++;
+            /* Do not update stats with unstable time, retry the sample. */
+            continue;
+        }
+
+        if ( i++ < opt_samples_warmup )
+            continue;
+
+        xtf_add_sample(&stats[STAT_IRQ_DELIVERY],
+                       t_handler_start - t_send_start);
+
+        xtf_add_sample(&stats[STAT_IRQ_SEND],
+                       t_send_end - t_send_start);
+
+        xtf_add_sample(&stats[STAT_IRQ_HANDLER],
+                       t_handler_end - t_handler_start);
+    }
+
+    w->teardown(idx);
+}
+
+static void test_parse_cmdline(void)
+{
+    const char *optname = "samples=";
+    char *s;
+    size_t optname_len;
+
+    if ( !IS_DEFINED(CONFIG_HVM) )
+        return xtf_skip("N/A\n");
+
+    s = (char *)(uintptr_t)pvh_start_info->cmdline_paddr;
+    optname_len = strlen(optname);
+
+    /* samples=1000 */
+    while ( *s && *s == ' ' )
+        s++;
+
+    if ( !strncmp(s, optname, optname_len) )
+        opt_samples_measure = atou(s + optname_len);
+    else
+        opt_samples_measure = 1000u;
+
+    /* Drop 0.01% of samples at the beginning of the workload. */
+    opt_samples_warmup = opt_samples_measure / 10000u;
+    if ( opt_samples_warmup == 0 )
+        opt_samples_warmup = 100u;
+}
+
+void test_setup(void)
+{
+    unsigned i;
+    int rc;
+
+    if ( !IS_DEFINED(CONFIG_64BIT) )
+        return xtf_skip("BSP: need CONFIG_64BIT\n");
+
+    rc = xtf_get_domid();
+    if ( rc < 0 )
+        return xtf_error("BSP: cannot retrieve domain ID\n");
+    domid = (domid_t)rc;
+
+    test_parse_cmdline();
+
+    rc = apic_init(APIC_MODE_XAPIC);
+    if ( rc )
+        return xtf_error("BSP: cannot enable xAPIC: %d\n", rc);
+
+    xtf_init_time();
+
+    if ( ap_start(DEST_CPU_ID, do_noisy_neighbour) )
+        return xtf_error("vCPU#%u: failed to start\n", DEST_CPU_ID);
+
+    for ( i = 0; i <= NR_APS; i++ )
+        printk("vCPU#%u: APIC ID 0x%x\n", i, ap_apic_id(i));
+}
+
+static void run_workload(enum workload_id idx)
+{
+    struct workload *w = &workload[idx];
+    struct shared_stats *s = &shared_stats[idx];
+    struct statistics *stats = w->stats;
+    uint64_t t0, t1;
+    unsigned int apic_id = ap_apic_id(DEST_CPU_ID);
+    unsigned int seq;
+    unsigned int i;
+    int rc;
+
+    printk("\n");
+    printk("BSP: %s: workload %u vector 0x%x APIC ID 0x%0x warmup %u samples %u\n",
+           workload[idx].name,
+           idx,
+           w->intr_vector,
+           apic_id,
+           opt_samples_warmup,
+           opt_samples_measure);
+
+    rc = hvm_debug_posted_intr(w->init_debug_op);
+    if ( rc < 0 )
+        return xtf_error("BSP: failed hvm_debug_posted_intr(%u): %d\n",
+                         workload[idx].init_debug_op, rc);
+
+    /*
+     * Serialize against the noisy neighbour so that interrupt workload
+     * will not lead to VMEXIT w/ AVIC_IPI_FAILURE_TARGET_NOT_RUNNING
+     * reason.
+     */
+    seq = ACCESS_ONCE(noisy_neighbour_seq);
+    while ( ACCESS_ONCE(noisy_neighbour_seq) == seq )
+        cpu_relax();
+
+    ACCESS_ONCE(current_workload) = idx;
+
+    smp_rmb();
+
+    t0 = rdtsc_ordered();
+
+    do_workload_on_noisy_neighbour(idx, DEST_CPU_ID);
+
+    t1 = rdtsc_ordered();
+
+    ACCESS_ONCE(s->t_elapsed) = t1 - t0;
+
+    rc = hvm_debug_posted_intr(workload[idx].done_debug_op);
+    if ( rc < 0 )
+        return xtf_error("BSP: failed hvm_debug_posted_intr(%u): %d\n",
+                        workload[idx].done_debug_op, rc);
+
+    for ( i = 0; i < NR_STATS; i++ )
+    {
+        xtf_finalize_statistics(&stats[i]);
+        xtf_print_metrics(&stats[i], NULL);
+        xtf_print_histogram(&stats[i]);
+    }
+
+    printk("TSC skew %u times\n",
+           s->t_skew_cnt);
+    printk("ISR[%x] %u IRR[%x] %u\n",
+           w->intr_vector, s->isr_fail_cnt,
+           w->intr_vector, s->irr_fail_cnt);
+    printk("Elapsed time %"PRIu64" ms\n",
+           cycles_to_ms(s->t_elapsed));
+    printk("\n");
+}
+
+/* Some rough criteria for success. */
+static bool check_critetia(struct test_group *tg)
+{
+    struct workload *wa = &workload[tg->noaccel];
+    struct workload *wb = &workload[tg->accel];
+    struct statistics *sa = &wa->stats[tg->stats];
+    struct statistics *sb = &wb->stats[tg->stats];
+    struct shared_stats *sha = &shared_stats[tg->noaccel];
+    struct shared_stats *shb = &shared_stats[tg->accel];
+    const char *name, *sign = "", *units;
+    uint64_t x, y, t;
+    int64_t delta;
+    unsigned int i;
+    bool pass;
+
+    switch ( tg->metric ) {
+    case METRIC_MINIMUM:
+        name = "min";
+        x = sa->min;
+        y = sb->min;
+        break;
+
+    case METRIC_MAXIMUM:
+        name = "max";
+        x = sa->max;
+        y = sb->max;
+        break;
+
+    case METRIC_AVERAGE:
+        name = "avg";
+        x = sa->sum / sa->count;
+        y = sb->sum / sb->count;
+        break;
+
+    case METRIC_P99:
+        name = "p99";
+        x = sa->p99;
+        y = sb->p99;
+        break;
+
+    case METRIC_ELAPSED_TIME:
+        name = "elapsed";
+        x = sha->t_elapsed;
+        y = shb->t_elapsed;
+        break;
+
+    default:
+        xtf_error("unsupported metric '%u'\n", tg->metric);
+        return false;
+    }
+
+    if ( x < y )
+    {
+        delta = y - x;
+        sign = "-";
+    }
+    else
+    {
+        delta = x - y;
+    }
+
+    if ( delta >= 1000000 )
+    {
+        units = "ms";
+        t = cycles_to_ms(delta);
+    }
+    else if ( delta >= 1000 )
+    {
+        units = "us";
+        t = cycles_to_us(delta);
+    }
+    else
+    {
+        units = "ns";
+        t = cycles_to_ns(delta);
+    }
+
+    pass = y <= x / 2;
+
+    printk("%s(%s) delta = %s(%s) - %s(%s) = %s%"PRIu64" (%s%"PRIu64"%s): %s\n",
+           name, tg->name,
+           name, wa->name,
+           name, wb->name,
+           sign, delta,
+           sign, t, units,
+           pass ? "PASS" : "FAIL");
+
+    for ( i = 0; i < NR_STATS; i++ )
+        xtf_print_metrics(&wa->stats[i], &wb->stats[i]);
+
+    return pass;
+}
+
+static bool test_passed(void)
+{
+    bool passed = true;
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(groups); i++ )
+        if ( !check_critetia(&groups[i]) )
+          return false;
+
+    return passed;
+}
+
+void test_main(void)
+{
+    uint64_t t0, t1;
+    unsigned int idx;
+
+    if ( xtf_status_reported() )
+        return;
+
+    t0 = rdtsc_ordered();
+
+    /* Execute all necessary workloads. */
+    for ( idx = 0; idx < NR_WORKLOADS; idx++ )
+        run_workload(idx);
+
+    /* Signal noisy neighbour to stop. */
+    xtf_success(NULL);
+    smp_mb();
+
+    if ( !test_passed() )
+        xtf_failure("Interrupt acceleration does not work!\n");
+
+    t1 = rdtsc_ordered();
+
+    printk("\n");
+    printk("Total elapsed time %"PRIu64" ms\n",
+           cycles_to_ms(t1 - t0));
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
-- 
2.55.0


