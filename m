Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2052606A336
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 01:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppford header.b=mgAFM4Nz;
	dkim=pass (1024-bit key, unprotected) header.d=azureford.onmicrosoft.com header.i=@azureford.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-azureford-onmicrosoft-com header.b=eM97GlhW;
	dkim=pass (2048-bit key, unprotected) header.d=saarlouis.ford.com header.i=@saarlouis.ford.com header.a=rsa-sha256 header.s=ppserprodsaar header.b=HvJTvcVW;
	dkim=neutral header.d=ford.com header.i=@ford.com header.a=rsa-sha256 header.s=ppfserpocford header.b=VayVIzJF
Received: from list by lists.xenproject.org with outflank-mailman.1473241.1680926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNm-0001Zu-NA; Thu, 05 Nov 2026 01:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473241.1680926; Thu, 05 Nov 2026 01:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOmNm-0001YL-Bf; Thu, 05 Nov 2026 01:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1473241;
 Thu, 05 Nov 2026 01:35:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1xOmNk-0001Eg-Hr
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:35:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOmNj-001x47-Uw
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 02:35:11 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd28-bab6-0a2a0a5309dd-0a2a450c8a0c-32
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:11 +0100
Received: from [148.163.143.241] (helo=mx0b-00498f03.pphosted.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmukhin@ford.com>)
 id 6aebdd4e-f479-0a2a450c0019-94a38ff12e06-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 02:35:11 +0100
Received: from pps.filterd (m0367127.ppops.net [127.0.0.1])
 by mx0b-00498f03.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50nAqt227538
 for <xen-devel@lists.xenproject.org>; Thu, 5 Nov 2026 01:35:10 GMT
Received: from byapr05cu005.outbound.protection.outlook.com
 (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
 by mx0b-00498f03.pphosted.com (PPS) with ESMTPS id 4hrfaurbwd-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:35:10 +0000 (GMT)
Received: from PH8P222CA0019.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::21)
 by SJ0PR16MB5148.namprd16.prod.outlook.com (2603:10b6:a03:4e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:35:03 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:510:2d7:cafe::82) by PH8P222CA0019.outlook.office365.com
 (2603:10b6:510:2d7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 01:35:02 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5
 via Frontend Transport; Thu, 5 Nov 2026 01:35:02 +0000
Received: from pps.filterd (m0426318.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A50mce42969017
 for <xen-devel@lists.xenproject.org>; Wed, 4 Nov 2026 20:35:02 -0500
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [50.112.124.217])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4hnxs4nrm5-2
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 20:35:02 -0500 (EST)
Received: from localhost ([19.12.92.222]) by cmsmtp with ESMTPSA
 id OmNXxjT51f5COOmNYxlO9j; Thu, 05 Nov 2026 01:35:02 +0000
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
	:message-id:mime-version:references:subject:to; s=ppford; bh=yfW
	zWSdEQkaEo9tnDH8JrNq7bLBhhcFF+YBxmutS6Ek=; b=mgAFM4Nziv7RqIbelwf
	dUmwxOjeu08xwP+X+7W8EffOVUicAk5zsjWA1b/dGrUh+N5oou912e0UAgA49ATD
	VmTaZOBdXeS6gc/59ZNR6CNlXiygUMK7yGyS+h4FaNjBReN1VHxcYEjfWCPfX4Ds
	+4ctvG/mAZl3bF9dHNFnfPOKh3alUhNLwi9wkIXzY8OT0qjSx88oWCUM4kK2ZwGS
	R/NlAc7TyjA5s1kXemzU/PzwjnrX+eh/cnY2k7/hC0o1KW9At8GIvHgf9WDhMjzf
	f4IKhZeRFwzu1cumMuDQMxJjVbZfhiLtQLrEopk6QLmioCN9LmNKyDtYEbuXL+hB
	FWA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiSpvNlMnVwqUrVNfvoHduFz9O1fOaXAUUHlJvbNDUPrajIH2dAGKOPqpPqzT8mqraG59UbnyflUac6+7+S/bq62PWBTzogS4OYLx1b3V2hmhUHp+TY8YDa/GjU3qllENV3c8yq5cPvxV+j9IXngCWIcALvpnT5B7haDXKIai8yvPU+OWdToFh9XrR2gMHLueMRiWH7I4hdk2Za7a7LnMHoZwjFECQx5h0Ndad2Ai2w218TUqyNVcNvCiKRMgR+oLXyjoriRj8VwpPiYMMn+UfdbuoDt2flcGxGARVeupI6bwUK9v9/WHdBdwV4p+fzvom/FW1TvlifDWOUBWqWaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfWzWSdEQkaEo9tnDH8JrNq7bLBhhcFF+YBxmutS6Ek=;
 b=tIuuZYXW8veKg8vIZnXJH9kSXncCyIkhObEAawhiKKt+lzYprylFuY6ER8p5u64ux7mmGViRYxDxDsC2gAjx1ud4cm1p5kbSMOeSZ1YHQ0UjzGZIpqDvIh8nRqxGEGRlwKOaduCrkC2BhIOtmTI7JxVS2TjtqgkOoKdX+NUpimJPAWBBWFRNbAt0rY3qVaX1p4e/uWfbUvPLyV08v6wn5u7+JbYlIlER7WY2UGeLjewU+S73dt5m5a/f1C7LNRQI/a5B00xnw0jpQhdZ2D8k4vuv5CdFPX9/b2o1TdUKpN++1Huv3XkPhL40skZZrKL3E1gPKENExAee2xJiHH7KkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfWzWSdEQkaEo9tnDH8JrNq7bLBhhcFF+YBxmutS6Ek=;
 b=eM97GlhWKtiFztJsVbx60RrZpXQB8iZZWtr0yTyXy56fws5kqgzuWSqBsylodtBpYSLRvwgD8CeJicVvzbCscJ8XSmkb0NyVW6WH9RluFdKwZFsOBzoDNz7e6ygB1H471mzRKnStkoYhmS96wkcfLL/LVkHivjd2lg49+UlNBLo=
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
	ppserprodsaar; bh=yfWzWSdEQkaEo9tnDH8JrNq7bLBhhcFF+YBxmutS6Ek=; b=
	HvJTvcVWyPjxEwGJIYTLwiD4t5LRUZKKCQTpLxxhqDodJ1dDZh0PvqgwFIzokjrM
	gXncB7UFuyRk/ZHkvSFheLiT9VD6ur4Dy7DxScnmsmnpEZyKSa+QAlxqLHehY2iJ
	kP59Aq1jz/rfW+FyVrSk4OMPGIIMD1bLZW3qeelTjoLoDHRn4gI5Hlumz4uaXlEA
	PPbo9QMYe0g+7lbIVRaE+xd+1XluK+ZPrh+8Bpq/uufVt7bd4xhbqsTxfo4cWpmH
	vJAxpkSPnxV/b9cyVmlSa9ajMdyu+ZOmZ4+PIcqgPd8/fdMhDSFTZwuYniNlY1YU
	jVCmBrz2zSYOP/Sz3gShiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=ppfserpocford; bh=yfWzWSd
	EQkaEo9tnDH8JrNq7bLBhhcFF+YBxmutS6Ek=; b=VayVIzJFQ1BgrjoGgIHP2vT
	9Ba3U8OZZu4wIb3JdxnzfWUAYb2tEVz3OvaEAJLwV08KMpTJL6Q3pP+8OH3lfKwC
	A3nBXzDDvhU/dJNog4KQfI+4BuCo3Am+7xcYbZd0hNHdNpO6gt/lLBxlTUUzZ5Kd
	JXc1ziS3mD6DbDluXQxueOv2acsYLMTzyDvsw1VHS7XI6MYpi/8oJMM51czOxZpA
	kiZbBskstS7n868VrZGz0eUBZi9pPSmSRmqdA0U2UCAPJl9L+Q5HjtDbDm6A83bq
	mu79wRyUHVM4Z5lud+FPaG0vMTDnvE0qVC49zVYoRGHcvFnUPuHzEClJgDYL6aQ=
	=
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: OmNXxjT51f5COOmNYxlO9j
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
        roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org,
        Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 22/28] x86/hvm: avic: ensure SVM AVIC supports xAPIC operation only
Date: Wed,  4 Nov 2026 17:33:39 -0800
Message-ID: <20261105013347.719392-23-dmukhin@ford.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|SJ0PR16MB5148:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c42e024b-40c9-416e-df22-08df3add0361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|11063799006|261026121527099003|261022105027099003|261102123227099003|261026140227099003|261009223027099003|261021121427099003|261021123027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	nDBT/mGnLp9RYIX3RoEL5F8tTJ0i+QeP4Bvh/BC6WYT5pAl0pk6y9aWyUniDljttp7XCIaaS/aeMsptzYEqqfzEIYNL5OpWgTLOljW8c9Y3Et+jvKDU2/q4/brEovJpyIez2So4zOKfatw2hqJw9bYLCytjbZy1Nuz2hJMZO1j+WwL4oDD5fSrZ0fZuSrliLy2UM3KGHN9ehmiUQK0if4BS0vtYEZns2KxVyYPWBnOpe5amRzkTK/3eOclc9FJvfId6sr9spHw0W+/TibQFE2vQty7ZxgQMI1fmPW1u6FNgMi8yzANXL4r1Mq4lrs8aeGLuHxtka5sUxxYk8WXeYm1Y2U9cdSr2EULVTlnhv5khrDRj54VvEga7Vpo4gxdr8hI6slBqDRumEgXwBlDKEHEthXIOIhNrdJ4I9zAI6T7XDwlZy44wZy/EcfbZ2Lhn6kre4lChH2vcPprQCEjAqi9mya1dBgZ2yrmbqoHqJuDpA8l3xQGJt4lyObJzEvon/SnbNM3FVj0bqVhFtd0tSECDbaYx5yic7Hm07yuWLsFS3vAoOMlPzcdAa5BGCs7aK1WbDEACEYzG+pBcgLpG1fcQDewq8ErHc6MTFsLg/wRIYagPcFBdSe++NQhSn1RVvehpiuBLfFhY1tapjbXiAkrTjpMd6zhMv76Z+WR1PXiN6WLHIHMZCEWKCa72FHo3JObMgEzXQok9iDuzSCSXhyA==
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261026121527099003)(261022105027099003)(261102123227099003)(261026140227099003)(261009223027099003)(261021121427099003)(261021123027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ielA725XeTWFy1okZi+UCWU0zODmWXEIAwkjmmBrIxR6t/Cwuzsv+Pik68bZmyYfxes78ElRwRakUZ4afh2yMz3w5A7fieTOFRYVy/Cu5cWQm27QC6VUNLfDR8J71W9DMzKHOotSjhfqY/lY/KW7TKiRIuHuUiXPxrdd1kbuJo6BfbGcM5wvo+6IajagzdzSVY6k7vnrhTvROTa04cSC9pHRFEQELzeuhDhx5u3jqF4BQYKjNObRJZTs0i3oIS/fndImtiDYDcSORxCgSKKNEiNc0WDUQIIrMjErEdhNAJRLwLcYx/9mMkudJdWpYNrM04bzORFJSvBpJPbIYC6Q6W5cT186l6MpbCBFVtTO+/DaZks7ZUEaFIEexvQQvQ33OEnZlOC0P3TH+Gss45V+S2w38eROwztfTLATBCmd1kliV2gn5w/WjbhFYD129d8N
X-Exchange-RoutingPolicyChecked:
	TUTkd+MCStKhnjdyw0/cEkCSRrXUYfIQ6u5L4ugrKmFvFCg18MpUSRT6TZTl4p5CaL5RBDWAPhwToBMt7/+ukA6ddmUEWrXdohTfPhPrvmiYqBqQv/W5X+S3w19XFmaSFNFtIIz9uk22L55YPYzLa1ZHvJbMAuk3SOMvE4y3m+xNMfYkph1YixWRyxoX4JGXYED/yhvMkQReyJ6rPtH1vTCgY3xDuAotzSPcs3xhUEr3DZ0aU0UWiTrY3besz9D2UvQbj/1GW1E9713GkgngCRGxmAcs14QC4ZEq3nFM1Fq7HKO7EJxpYM7MAR2o3/h41mu9Z74rZXUt/6IRsG1+Gw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GnzUxfseW3QwIYu1ghoWgdDmjqnoMk0dvb7VbuIbxbWpApWirv4ZuQ2NVIhfwZixHDZ6XXkgpqK7nY8E3SRNBLiFVa0WGlfyhFuE5bZ7Q2IGkLOcFHpSoORxYUf5xmd6GpHgrUqvSFHOM3CYpVI8DidiQ53Uyd5kvqMf34TxcJEA7pTGBcL2zt/yaAdm1Le0JYSb6BwOs93H//NQepnY9EgnAfztpJr3aJ+ARe0ZCbAVNne8UQfyRPyiY2hOkzegmOZg71RPMIMAk11zaRgq4KEjJfrmffWKmwym+Kf1zgsUYrmZlhZZl553dgknOem+bmbh2TtQpt7bAav8wAGd+/2lvF8jcI2Lf+gh0teraeG1u1UXTSWDIDtrfFj3RtOeYADDj+rJWAII6OoGcCyQHyHKNuL7G+yXJhkr7pQHWi4Dm7n0MClJ5bBoCo3bcx5Kwph15HwIb3BULr+UUxEtrftoUJkEev33t5P3MSgZBRZpL5/L7TJyvenfI/lK+VgWaYUqYtbtW1kX6GD3h6HPIA63g1IIt3KB8mkisEmVzowjKq/wQQuewHP77eXp5qE4X7/44IAFAld/+OcSbxH5url1ZSv68HnTCV+dhx+CkPjLU3Chs5OUq56tTpEFv9WHYGqDRPGuFXtC9Rayk2solA==
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:35:02.8289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c42e024b-40c9-416e-df22-08df3add0361
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR16MB5148
X-Proofpoint-GUID: J6ZRyGUP1vELyGhrdDTCBjOiwCO6I8Hz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfXzRZ93667s//X
 rqwbtKBeV8vZatxC6jGStcHl2IXjOXvN8BDnFmeQoXEKfuIjlRrNeQUvToaeoiVefKqE4F8q+/n
 cQmQKtNXP6CzNViq1XY25g/xFPjKFCsMT6KXiXBVMjom1VKiDL96
X-Proofpoint-ORIG-GUID: J6ZRyGUP1vELyGhrdDTCBjOiwCO6I8Hz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwNSBTYWx0ZWRfX4gFQIJzJnrTH
 SWYuWTorTb3EH1sWHGFEZ+1o6GN/Axisj81Otl91PajCMhIM8yn9Rh4fPcJCy0BgCCkSFKzDIcp
 Ry4qapH36IfibUvSNTNLzg0i2ZCIUlwRCIVgPnfsa35Q5+jURQmBd2WzCi9FEXqDxj6VUctEpeL
 eELQmJsctP9fJXGx3JgVk278K3E6BRP1NQCJjx+8LsdQV2y4ycty/OF2lVAkT4hGWn87YOVV43z
 qJr4YV1GZym+TdTjLHG+Ec6CkxrabfL3yLy5oa81K5Ft23ZRpuQeqhRr49ePDZJAsQn8lM9yMrB
 2vlZMoX3GjwuMaHTHxIIH8p9Pyq39BOAyZTih7AhU9KaZ50EwjQipdyKP2br+kHo7ijINImrR/t
 8wksIUw1FhLu6zD20qt6Nhv+Nq0uYUGX4fgyj2wjJdw5qhknvEuC9pMThL8VgIzPBpeAhD0y0LR
 SHFnV5yFGI4hwkD8EeQ==
X-Authority-Analysis: v=2.4 cv=ScVi5fRu c=1 sm=1 tr=0 ts=6aebdd4e cx=c_pps
 a=pHgAWWeLuDyFdJvI4ceQVA==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=dw5MciS7gY-znkhJuOLE:22 a=cbNQJ9GKAAAA:8
 a=yphJJbrcoA6tzcLAcZoA:9 a=DqJYxgmhk6moR-_7_KoZ:22 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050005
X-purgate-ID: tlsNG-d25034/1793842511-77AD4A5B-837078AF/0/0
X-purgate-type: clean
X-purgate-size: 3633
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Denis Mukhin <dmukhin@ford.com>

xAVIC does not support x2APIC operation (yet).

Until x2APIC mode is supported, don't advertise x2APIC to HVM
guests when SVM AVIC is enabled.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/x86/cpu-policy.c          |  3 ++-
 xen/arch/x86/hvm/svm/svm.c         | 12 ++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c         |  4 ++++
 xen/arch/x86/include/asm/hvm/hvm.h | 15 ++++++++++++++-
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 48a3185eed8d..ca9b1a523570 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -764,7 +764,8 @@ static void __init calculate_hvm_max_policy(void)
      * (x2)APIC isn't enabled.
      */
     __set_bit(X86_FEATURE_APIC, fs);
-    __set_bit(X86_FEATURE_X2APIC, fs);
+    if ( hvm_x2apic_supported() )
+        __set_bit(X86_FEATURE_X2APIC, fs);
 
     /*
      * We don't support EFER.LMSLE at all.  AMD has dropped the feature from
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f2eb01799c63..667e8b05eecc 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2478,6 +2478,10 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .tsc_scaling = {
         .max_ratio = ~TSC_RATIO_RSVD_BITS,
     },
+
+    .caps = {
+        .x2apic = true,
+    },
 };
 
 static void __init print_svm_features(void)
@@ -2523,6 +2527,14 @@ static void __init svm_avic_start(void)
     svm_function_table.debug_posted_intr = svm_avic_hvm_debug_posted_intr;
 
     svm_function_table.caps.virtual_intr_delivery = true;
+
+    /*
+     * xAVIC does not support x2APIC operation.
+     *
+     * Until x2AVIC/hybrid AVIC support is implemented, don't expose
+     * x2APIC to guests when SVM AVIC is enabled.
+     */
+    svm_function_table.caps.x2apic = false;
 }
 
 const struct hvm_function_table * __init start_svm(void)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 3c7374a9ff42..bad43b38efea 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2916,6 +2916,10 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
+
+    .caps = {
+        .x2apic = true,
+    },
 };
 
 /* Handle VT-d posted-interrupt when VCPU is blocked. */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index d44f136fae8f..b701fc003ced 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -119,7 +119,9 @@ struct hvm_function_table {
              virtual_intr_delivery:1,
 
              /* Nested virt capabilities */
-             nested_virt:1;
+             nested_virt:1,
+
+             x2apic:1;
     } caps;
 
     /*
@@ -716,6 +718,11 @@ static inline bool hvm_nested_virt_supported(void)
     return hvm_funcs.caps.nested_virt;
 }
 
+static inline bool hvm_x2apic_supported(void)
+{
+    return hvm_funcs.caps.x2apic;
+}
+
 #ifdef CONFIG_ALTP2M
 /* updates the current hardware p2m */
 static inline void altp2m_vcpu_update_p2m(struct vcpu *v)
@@ -905,6 +912,12 @@ static inline bool hvm_nested_virt_supported(void)
     return false;
 }
 
+static inline bool hvm_x2apic_supported(void)
+{
+    ASSERT_UNREACHABLE();
+    return false;
+}
+
 static inline bool nhvm_vmcx_hap_enabled(const struct vcpu *v)
 {
     ASSERT_UNREACHABLE();
-- 
2.55.0


