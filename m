Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F99C531F9
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 10:59:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372370.1619726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wofWi-0000vL-8v; Tue, 28 Jul 2026 10:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372370.1619726; Tue, 28 Jul 2026 10:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wofWi-0000vE-5p; Tue, 28 Jul 2026 10:59:12 +0000
Received: by outflank-mailman (input) for mailman id 1372370;
 Tue, 28 Jul 2026 10:59:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <a-kumar2@ti.com>) id 1wofWg-0000u3-OW
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 10:59:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wofWg-00B1il-5H
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 12:59:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <a-kumar2@ti.com>)
 id 6a688b6b-5cb7-0a2a0a5109dd-0a2a450bd25a-26
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 12:59:08 +0200
Received: from [148.163.154.28] (helo=mx0b-0002e601.pphosted.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <a-kumar2@ti.com>)
 id 6a688b7a-b7e8-0a2a450b0019-94a39a1cacfe-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 12:59:07 +0200
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66SAfqT23461992; Tue, 28 Jul 2026 05:58:58 -0500
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010067.outbound.protection.outlook.com
 [40.93.198.67])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseg8g2n-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 05:58:58 -0500 (CDT)
Received: from SJ2PR07CA0020.namprd07.prod.outlook.com (2603:10b6:a03:505::19)
 by PH0PR10MB997617.namprd10.prod.outlook.com (2603:10b6:510:383::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 10:58:55 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::92) by SJ2PR07CA0020.outlook.office365.com
 (2603:10b6:a03:505::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 10:58:55 +0000
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 10:58:54 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 05:58:53 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 05:58:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 05:58:53 -0500
Received: from [10.24.50.243] (uda0543015.dhcp.ti.com [10.24.50.243])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SAwnwd3174665;
 Tue, 28 Jul 2026 05:58:50 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=proofpoint-05-2026 header.d=ti.com header.i="@ti.com" header.h="CC:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector1 header.d=ti.com header.i="@ti.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TibgPS++9FfXpZf9mM3lLS9tHvMhA0yWBeGVgpWpB
	xQ=; b=iOMH4qlKPTxixSaYqf/eniZiselrJbh5BFybcNEk1FrHhjAvQsYxfWhaO
	F/YsC8pabjVOwhYmvzTpXwA0faBNwNCr5ksMgtj2ZPknsUPhaFtSqVgQP4xjjAWw
	3NIe/6gVXT9sXGZeKDiOL6vhsFKgLhWTC3gLniIOxSujdBMKe+3xJcUGeT9ty3Xz
	+x+e4NHphWUxZcSCeyft5lzBEy+RkZtykWjXmeh0bDifRcM/2P8BX8jxenmEzhHf
	sN5HOSQTagdMWBhfQjCxsoxwLd6DHlsbm5uyIb4FJM6MS9Smaiiq9fVMe4txuXwz
	aOBhvRj8XiY96Akd+TEt4pzHMzgGQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8Z9iUNUJluFH7Tec6jJv12GdR/kRI5oeoBS6YUi10pmznrf+fC10efG5J5dCRbEduE06kletbGnDyFw0pHRCTHpIBnWWJFnGSlN2q6la88UIb1U2lwCT/+IYwFg6Kne6Pw4QDN9Akuf3nDFU1II/6gf2en9X6c0TVevLcuarbcWWI5kTD1eJibHaQwSMWgy3nQVX1Y/w75NXVmeOVlf/pTe0+UzG5KC1GrnX1CM9irD5VCGPYJX8XDQwMi1ePX1+TFMM0faVVfpORHR+6rHmVOfJq6kT2UVXgBBFJC5lxiTXWCxspj8fDqvNc8q907QzR3jRsTOsW7HBiGGJLhZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TibgPS++9FfXpZf9mM3lLS9tHvMhA0yWBeGVgpWpBxQ=;
 b=Xh4/gl7mmJF9agXlh8691C3bekEwBk1ptwxmkUycXzsugAEa1bnsTrO+UPtN7uCRMAqAHrRcqe/8G/HBVXOO4xJzcxDFI6IgBhmrRDEqciIEn1IqIPXnjkuogIFxLodHk0aC0HZpNag3A7IOErkymYB2slBarED4KUwVtg0XcQ9SwXuw1fbI0A//+wNa5JBoJrOZ6YM+dCOxfksvba26UpvmIACAPIu6iUNoySHbCtQZiTFpQBKXBLRm8JqzjMsGuL+opk/8k0rlHGoFovWwngPKr5EcdEMQ6lKTQ65E0K+Q26dKVLiKf+GKLLYtt4YRFFPVNc2g+1aIy5aQNWKMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TibgPS++9FfXpZf9mM3lLS9tHvMhA0yWBeGVgpWpBxQ=;
 b=vtzKFbroMaybv7QAXu2YQacyANW35qbgzRNhldWQ15sMNuLvIQnUprM7iYiRvQxVkPMoez9nb4izFZjsJdLpgEm++ulU2qefVUwcrl7454Su06GBPutqWDRB7XJkG/cY4DtWXnZjt3SIMbrDKcs/clf+x8QbIRufk3dHvvJe9oA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Message-ID: <5681cfaf-abfd-43ad-982f-dec63882c478@ti.com>
Date: Tue, 28 Jul 2026 16:28:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/23] doc/arm: vIOMMU design document
To: Milan Djokic <milan_djokic@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD
	<anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <06d3f9dd178c40b9b2360c24cc2ed55f9559eba6.1774918270.git.milan_djokic@epam.com>
Content-Language: en-US
From: abhash <a-kumar2@ti.com>
In-Reply-To: <06d3f9dd178c40b9b2360c24cc2ed55f9559eba6.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|PH0PR10MB997617:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1654e9-c0df-4e25-50e4-08deec973764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003|43062017;
X-Microsoft-Antispam-Message-Info:
	95U+BwOnMsxIFOyK7lsSgV6m3kmAH1yl2gXbo8uftwhY8XAr3rZXvsD2dDHpEpEbEw9k0LCvGj4XJkeFy0KjI1E7z+bRtScdDcwqBHbdu3WJK6EFPNUnLvBtkEM00aRU1h+98YgaowCzdHYcE36vienG3eCpftyU75fwfIkQrOCX5aETzpmXZrjN0c3EzVvlu4E9qhDdlg8nIqto1xmbQsICVN+z2Z8MJ1Wr2WtxGSDWPRuPmtxEmbFK1/ct0Zq2/wMuAHwmukTRGDG1XoDNyPy7FeumI0gpt12iY59kluZskvBqawF4SgXaE/tx4+GOqcqRJ0NXS4MQP/2xDDVeIINtdnXp/dbypALGNH+rFJmG+IsteC51pWDC4jXiAuaaX6RzY7O0/oydVu0iIkeLtXLntWdMbBh5pkfxT7fMhSDk/vrUzs0XRFBQpC5s2xvbfUnRXW/zFvtk0iGM57btMxT8LxHhS/JJRlic53zQGCHFUKg0g248OK3gcbfZtfiLEWICWNaXFddG6KIxb3126qdZ6wXTMssgpgFxYUuvS4cSWs+mTyA5+usCDAfMCsFHA4TjZ3/ouiyTmd7TbAhxUA0oMTcDi7e1HdHkJENEK4mGJNQ8EPWlqqyYeGMGkg0/GG0mcJwps6qHIdMWXvh4wOvLBEZzKPLWrf9KgXhUx44p7RjS5k4gO3ZwCoctBFf2Qg+In7R08EuWmrwxAtJHBIKoJbj/y9cl4eUmaxnJYIPsqZN5RSF+LRJDy1F0tWYy
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/INhg+88RBY7qU6Pb7a/D+d1sEf5KcayXFYWibc3fgg70r6cvkjyA+K6OX0V5TjE7XR64GM9ZS4aHmTfa0111/OrabH+5bjOdWAs478pFVsQIlSID0cmeSLrglY5urVBRHCF7oRUJpAa57r3+ZXBywqsFaAMBLIxBdxgsOdankTBSvW36qHvJC+hpJ3DDzQ8YOq5XEvhkgjOtwn2T3CBbiK4CyRcKPDGwBRuVuDGpsTDdlecoaQtNf2DEMlFZzNroL9Gd2bWriECPhLxtkNDfFyw2E21q2W2MZlcfTcYiqdt7XPrbOT9pi303T+/lV2Fwy1GwF5OtFWWxXJkGn9YSUbIrtpdVq7SSgfTMPXm69FZgk3aF364TirCMqeRIWfPwITYuV9t0WkGr0qabl6ckNEF4IYK+c+/JH9Y19V040unQeoBhZsQ0Ii0wNBgQ0/R
X-Exchange-RoutingPolicyChecked:
	VxL59uN385qqRkXurbW5BZUn8L7wfBiA5qdwytYquiujL7ky8ll9eoM/NHuj96CJHxzA7YAxPNlMktd4s/KUkP+2Ho62U3ggoQ+clDMIJYtwfVZOmIpxUI+ZyC/LjTg1VnplLi3+VPoMcHFcuT8OWjebKuTN+b32Ydl+OTox8jQa1B8UKf5fspvK41V5wLp8YJBw0nUB06TCUYXPM+H1IVnl5ACxVmLF5cgF2N+8dFKV7l7jTK/baaM/673XIGPkbpaN7X+tQ6i6pPJ3ihIgu/0vORzfFOp4Ed4b/4XMP4LG7C3HmNYltkywO8r69vZedmkVYjOu5FQJAZzhchF2Iw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 10:58:54.5459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1654e9-c0df-4e25-50e4-08deec973764
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997617
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NiBTYWx0ZWRfX/KIEJjRS46OR
 HLrV+CM7BnuM7/TDHTP4Im/aJk7FK7pmls1x9z6TmpGYz/BH4wWh9do1CEaPqRKAqqzXmx71XVA
 WsRRLfL8oJl6fvntuqkP5c/fd2lKZ6Y=
X-Proofpoint-GUID: xIdc2uKxFpGfQHGZjy9kXNpNZ7A5PjUY
X-Authority-Analysis: v=2.4 cv=Iu4utr/g c=1 sm=1 tr=0 ts=6a688b72 cx=c_pps
 a=wCygq6uL5kGpubmeL3zaNA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=tOTIRDCx1H2e1NstFlYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xIdc2uKxFpGfQHGZjy9kXNpNZ7A5PjUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NiBTYWx0ZWRfXxT0ggkCCjuUT
 5lGEuOFHfxLbvVKVo1d4xvnX823zxhEvJrFazl113uEQJxXy4zgIjHM50Z+uIiuuJ3TtBl2mwjH
 rGcuTcBLT4c20diGoL92vgXZAW2CtXX2MgEaO7ova3nq+mRsRjdjNkpz23LcmBgp86moQqag2Ha
 Lr2GPFWsOi5DKIEXDF/g2QsdlbZ2OrPF3Y6p1+DMt/gpz8WSYcTeyOUM1XzLXPEbtLCHcSU2ZMu
 FuhTzVhndWR6wVeDWtUhtBRJoIfoIcibj8VqpjxxINoZZ12FGYs6B7GO541TAQ74aHm1VTuXQfq
 C51n5YcH6PnOUKg4mKNzG4/E1Ng4OMpJeflAgqoOn5wPhWf5oNPLJsITVVFvYgzXulgYI4EV7Td
 1zHCxgXvikMMzH6Z08cK1+emFDUMqAwOuX+a0yBzKdVf2waSXFS7xuVi+Qoi8rsv3GwWPLkvZQC
 K3DJLLaylwmktJC2sXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280096
X-purgate-ID: tlsNG-42698a/1785236348-AB8D19EA-167E118C/0/0
X-purgate-type: clean
X-purgate-size: 1704

> +Performance Impact
> +==================
> +
> +With iommu stage-1 and nested translation inclusion, performance
> +overhead is introduced comparing to existing,
> +stage-2 only usage in Xen. Once mappings are established, translations
> +should not introduce significant overhead.
> +Emulated paths may introduce moderate overhead, primarily affecting
> +device initialization and event/command handling.
> +Testing is performed on Renesas R-Car platform.

Hi Milan,

I tested this series on a TI platform. I was not able to get the DMA 
test inside a DOM1 guest

to work with nested virtualization.


On the top level, my changes are:

- Enabled CONFIG_VIRTUAL_IOMMU and CONFIG_VIRTUAL_ARM_SMMU_V3 in Xen

- Added viommu=true in xen-bootargs

- Added a "smmu" node in my DOM1 passthrough node, so that it can be 
replaced by the viommu.

- Added "iommus" for my DMA controller.


I can see that the smmuv3 is probed successfully inside of DOM1 and my 
dma-controller is added to the iommu group.

""

[    0.161594] arm-smmu-v3 4040000.iommu: probing device
[    0.162067] arm-smmu-v3 4040000.iommu: ias 48-bit, oas 48-bit 
(features 0x0000020d)
[    0.162993] arm-smmu-v3 4040000.iommu: allocated 65536 entries for cmdq
[    0.163730] arm-smmu-v3 4040000.iommu: allocated 32768 entries for evtq
[    0.164281] arm_smmu_device_reset
[    0.164559] ARM_SMMU_GBPA reg = 0
[    0.164924] smmu->evtq.q.q_base = 45a0000f
[    0.165609] platform 30100000.dma-controller: Adding to iommu group 0

""


Did you have any changes in the kernel tree as well?

Could you provide the testing setup that you used?


Best Regards,

Abhash


