Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4459BC531F9
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 11:01:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372381.1619735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wofYz-0002cT-Mz; Tue, 28 Jul 2026 11:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372381.1619735; Tue, 28 Jul 2026 11:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wofYz-0002cM-KN; Tue, 28 Jul 2026 11:01:33 +0000
Received: by outflank-mailman (input) for mailman id 1372381;
 Tue, 28 Jul 2026 11:01:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <a-kumar2@ti.com>) id 1wofYy-0002cD-5H
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 11:01:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wofYx-006kul-Hz; Tue, 28 Jul 2026 13:01:31 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <a-kumar2@ti.com>)
 id 6a688c04-e002-0a2a0a5209dd-0a2a45068a40-38
 for <multiple-recipients>; Tue, 28 Jul 2026 13:01:31 +0200
Received: from [148.163.154.28] (helo=mx0b-0002e601.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <a-kumar2@ti.com>)
 id 6a688c0a-195a-0a2a45060019-94a39a1c812e-3
 for <multiple-recipients>; Tue, 28 Jul 2026 13:01:31 +0200
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66SAfxo53789008; Tue, 28 Jul 2026 06:01:18 -0500
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013016.outbound.protection.outlook.com
 [40.93.196.16])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb0g1k-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 06:01:18 -0500 (CDT)
Received: from BN0PR10CA0029.namprd10.prod.outlook.com (2603:10b6:408:143::7)
 by DM3PR10MB7972.namprd10.prod.outlook.com (2603:10b6:0:43::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.12; Tue, 28 Jul 2026 11:01:14 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::76) by BN0PR10CA0029.outlook.office365.com
 (2603:10b6:408:143::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 11:01:14 +0000
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 11:01:14 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 06:01:11 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 06:01:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 06:01:11 -0500
Received: from [10.24.50.243] (uda0543015.dhcp.ti.com [10.24.50.243])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66SB18cq2545145;
 Tue, 28 Jul 2026 06:01:08 -0500
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
	proofpoint-05-2026; bh=IoyeHsoIdyoRGfYFuEUfgAUK6J0sRslzkFq1xLXTo
	R4=; b=eAgwG1mXku54q7LkQernOh2qQ69bGsAy03GKHDt+CS4VyaU/+xkFTFGz1
	giwtbCQUFxgGYycEAPdND8q3kqOJkjWO32iV6T0zb+DHFulQ1SYzHZRVdx8Iu2ke
	WPXlhFhTFK9f/0BnMhopvi4VmHtJWu7b44PviNC482lPkcq8fFyYYUk/GIvsHBC3
	gIwuvpr1WUarodPJPQU0FVgWjgjrh3bdV6qatwmsGEdftcD02xQQLTtA36OW9Z+l
	8jBG9SWruCkTQWr63tzdPv7Qk9bxmBBULVuPRSxKaBpC3DInPqJO7vUZ+FU6eTHt
	7DJ9QT24Hn4KELdNNqLknIOHFoQJg==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ap3l8dRrlNIQNJYuQKZ+4m1XpAJVZGswm1qHOqQIU6aGFUm+9WUM5UnGMgzOFFz9FIbUwbaFsOYlDRjnEWOBLmUWAzkAteDFll4VTzHrtT+8PonfT4UvqwIFLSnwlXkiXdu8GfODeAv1VTN+L1FIfMAzbESGX34mq/9LQTlWUpTTR7RHI21bOJ6uxmRV61T7OEtPztfF9BkWIN9pul6M5rI/qB5pfhrhcDQPPi4wghXfbFrIixZL6lT5PytP5wi9xKF861lQZB1wZ1Env7Njgv+/c32SfeEoZJJOwPEQIl8NqJHGfNGKa0j0FVPfKlibDODSZ/i/Q/HlHm5pezS+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoyeHsoIdyoRGfYFuEUfgAUK6J0sRslzkFq1xLXToR4=;
 b=CBgDZJC/ebai16hEjaGXeIFyCewguuarZ3FaoD5RPpYQCBvptRE6rGaaZTfFvH2ZpibSbJzcTGGGnQ/abtNcgiZ9x2fi1iYZ/VI8mrEGH4EtuMNN2+dAoHF8zoujA/xIvlmSJnyx4yoUDobpAM+rEVO+laxXR83wdj2elSboxzHc7Y9lkPOw7bv/+6AhvPwOnT34nNI+zs3V9sRioWKN88JQGNLM5+/3Xc5C9E/2vjNBtdys4kLBiIZdSTSaLPYagp90/yy7Vx/ZbmCKfXvMdf4+oy2dDNPJLLQ+ELTXTFB79DSp8gsv5NWqln96DlOBGpqgwATFvvhtfWadZFrdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=epam.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoyeHsoIdyoRGfYFuEUfgAUK6J0sRslzkFq1xLXToR4=;
 b=sp/wzLHpvXX64rGeTtmDwV54Ccbt8tU4RZ5uMOkt/C0V5XXWKxqxce4dj/nA9xo8gFQBm8mGDO69lbDl7fEod93EYyd6tdT7om8XFf2juh7YBUjOSGRd9KH6WKKl3EqJrTcSTwa9MyH2cpcJs4lSdo1TudXcV9Y0CmvoalUo1YQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Message-ID: <b1ef59c0-5331-4bfa-aa50-ea7b809d4539@ti.com>
Date: Tue, 28 Jul 2026 16:31:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/23] xen/arm: vsmmuv3: Add support for registers
 emulation
To: Milan Djokic <milan_djokic@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
Content-Language: en-US
From: abhash <a-kumar2@ti.com>
In-Reply-To: <25adb33c4be3932c2d946cf7757c933eb042476c.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DM3PR10MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f915d56-af38-4af6-0aa3-08deec978ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|18002099003|22082099003|56012099006|4143699003|10067099003|43062017;
X-Microsoft-Antispam-Message-Info:
	nKuClujGbMAanal/3hBFMwkrUoU9GO0rBCOAHpN0Lr4YzQXPn4ANfxtu8NCrXYLqD7NmLsHsqnb05RFGTF8FELqDb5ofqNnlRReNXBodVghuOwMfPLdQF5YUTyxPiknie628CZJ7raZsRUziEPUz8AYPl72ZBrOGK7/z7u4avCFgGqgzR/OW6FwjcYisO4Zf93eRH+cEVY4e6qDy/4k8GsLhtH6oTueUvjaV8zxh67OUhh54jPxfoiFOKrk7Gb/0NRPPep5ZTu7UzNQt/v+rqWYAvyNvxbHGCaqfswvczxNQ51yKm8mTcFm4hphZRBOo8QxqyEoZi0jFcZFhoBdCihFRnU5oFW6pwLpNX6Pxasbctjwv7RpesvHPPYkKWHFruhdbIUgGL4Pp8PIl1w1tgfVRKJ/f7tZlB1ws1kIFo4nXAetTSVXRqgQ0ErejpyypJpqAD9HLNjQnCAcuftDXD1b1eYEt/emuKnIbDJIoA26cNqiN7DeXOjZVnAKRPlVQxCZTrSTrjBlX/D/DcEn0l0ANFCtJFu2UKFdayq8aBJsC9V6H3CBTHSBfxx1HTarS5N3s1ar6WHA8n9Wr8xJ616mGd41vDtX2HnPOLOJEyYMmvqjy8GgLY88GUldkijVtXPizYhu0Q0MjGekGcT2HwzSEiyYFtk0fRX6I8/4DlklbvkEbJGK49RAUdAAGwdx4JXHlW7xqs/tsYrAVjKOWWo8A3Sd3iCKan3Cxh5akF/kZrzKrf8ForjAs3J7eRpEs
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(10067099003)(43062017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ef4mXVf/qzAJAqBQVQyHhFMv1aW4QE+1f/PWsBkIF0N7r/2E00Fh+/Cj1TW6fJMI8/Euv0g9octUeVYVQGgo4GMVAn6nmfnWsThOA9nIo4bdukek5Qk5ZS6dVoqrMc4MDFA9Yne7uwWzfGcQrzwRLw9S2+kGsDG7wDJSHz28m9zncNfAQLl7Nu1Ohcet2a9HCyonDd3J61iP4E+NVT470CPJDVAjdV5hJpFGYJhldMpbEBifYsCxJ2+nXsoljaNMaVX1peW5tDrf9SkD8Na9zh+8AaXg4yVzz+YsOgaEMvep1U2Pe5h+lp8hGzPXyU6bYdDKALMwqOU8XY7MSoDa07viuW3ZmSRP2vWhaj5qVm2NBBmsGLzmpcUOu4CeN9qerxMefiCUJHm6bEbfgn1gOyLa9JgvBe9ywHQgKx1PWrEHHe56C9RnU7Fd2qI0ajza
X-Exchange-RoutingPolicyChecked:
	szicvCSjcZStL8AyZxQlUtv1FHyP9iL7KFt3iSgX2Ux0q6mv4Ou9OKG+L2A6P7oLaP98lEttc+QhYhHJ8RWIERAjbKg/ebUSdU9GY5qRafMD36TnyBwd0V9umfeTpRoT+NEyPH2O/+kluw7DM2H5dAx4RUrhV4nCowSeIfYR+qJa4OwNH8ZcST9UOktizpetSZ+3Sy2BwHrOUU4Dac+QbTtrRBvYEhNs8oCqh1Uwmrq47RJk+Tt20BFOEyzx+2nW+xDVpQGHIXctzWdQLCcHbMLWE/6W55cEygzaIuaPrP56jLNH9Jh9wYekAR38XxPQkiuV2O5jF99rht02zge5xQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 11:01:14.4524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f915d56-af38-4af6-0aa3-08deec978ac7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7972
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a688bfe cx=c_pps
 a=26rO91Bbw6QoawbNyte6AQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=0RkM-CO9p0AhqfmbK5EA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: CVxRR_uVcN8oIqJndeBkI3pMvWyaxhRT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfX4JHSWFteyfDb
 /dzG+3KUHVExBDXEchLCEI2ppomWL7xEgWH7dGvAJnAyG1OZbpb9U03lN10eU3nwyVToYL9Wccf
 B6KPd7sw0BI6FQ3SwrYpd2nFQGkAXwo=
X-Proofpoint-GUID: CVxRR_uVcN8oIqJndeBkI3pMvWyaxhRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfX8gRW1cEKnzZP
 r5pWNVMx7dX5KjxsP2/S13zmq5vKXsS5sbhUBk6UG0mWjSpcE1wp42ufEEz1iVg3pwiLc7IFrhp
 xEr1CX0w7K/xjB9KZsfkAY6uMHcWLjbGBbQQL7lb806jdNdxrGI8wtwokiYXISndxaBJqwjMfqx
 wWR4X8QbuSWY0iAF5DZQYinpE7KXHpLpK3pXyr3whuJQ/ZNDYasz4Tb3czc3MrnSzMYjv1FYk3Q
 arHPz7mDmbh2c9x/5I5h+wXkPQWgrSkHtffF4/uBLjYLOzyJ8xZwukgzKKWgZvOMhroDWdZYXCw
 K9D7hKnPw0/m9ufjZ9zzBde2uhZV3Ka9U4niuzA+MBFvaDg2aP/2lq6+GiX9+bN3q1ZadE1sUDv
 E9t6jHRYDkhMDiy4cI1mPchgFP00uYJsgCLUdR8bDwUS8AiQtlXufBnJ1Scjg4Oh3xRK5iL1H06
 IVZo3/61FkXV1GKOcGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280097
X-purgate-ID: tlsNG-16d1c6/1785236491-F7ACA77B-91A6C971/0/0
X-purgate-type: clean
X-purgate-size: 699

>   struct virt_smmu {
>       struct      domain *d;
>       struct      list_head viommu_list;
> +    uint8_t     sid_split;
> +    uint32_t    features;
> +    uint32_t    cr[3];
> +    uint32_t    cr0ack;
> +    uint32_t    gerror;
> +    uint32_t    gerrorn;
> +    uint32_t    strtab_base_cfg;
> +    uint64_t    strtab_base;
> +    uint32_t    irq_ctrl;
> +    uint64_t    gerror_irq_cfg0;
> +    uint64_t    evtq_irq_cfg0;
> +    struct      arm_vsmmu_queue evtq, cmdq;
>   };
>   

Hi Rahul/Milan,


Any reason why the GBPA register emulation is not added?

When "arm_smmu_device_reset" would be called by the guest kernel, it 
would fail.


Thanks,

Abhash


