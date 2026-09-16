Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0789BC88E77
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 04:37:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422294.1647748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6hOV-0006Wr-Mv; Wed, 16 Sep 2026 04:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422294.1647748; Wed, 16 Sep 2026 04:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6hOV-0006Wk-KH; Wed, 16 Sep 2026 04:37:15 +0000
Received: by outflank-mailman (input) for mailman id 1422294;
 Wed, 16 Sep 2026 04:37:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <b-padhi@ti.com>) id 1x6hOU-0006WI-Bp
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 04:37:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6hOS-0013Lg-22; Wed, 16 Sep 2026 06:37:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <b-padhi@ti.com>)
 id 6aaa1ccc-e002-0a2a0a5209dd-0a2a4507a094-30
 for <multiple-recipients>; Wed, 16 Sep 2026 06:37:10 +0200
Received: from [148.163.154.28] (helo=mx0b-0002e601.pphosted.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <b-padhi@ti.com>)
 id 6aaa1cf4-b4ea-0a2a45070019-94a39a1c29d8-3
 for <multiple-recipients>; Wed, 16 Sep 2026 06:37:09 +0200
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68G3pb4p1476939; Tue, 15 Sep 2026 23:36:55 -0500
Received: from sn4pr0501cu005.outbound.protection.outlook.com
 (mail-southcentralusazon11011059.outbound.protection.outlook.com
 [40.93.194.59])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gqc4paqph-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2026 23:36:55 -0500 (CDT)
Received: from BN9PR03CA0264.namprd03.prod.outlook.com (2603:10b6:408:ff::29)
 by SJ2PR10MB7618.namprd10.prod.outlook.com (2603:10b6:a03:548::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 04:36:48 +0000
Received: from BN3PEPF00022BBB.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::5c) by BN9PR03CA0264.outlook.office365.com
 (2603:10b6:408:ff::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Wed,
 16 Sep 2026 04:36:47 +0000
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BBB.mail.protection.outlook.com (10.167.248.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 04:36:46 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 23:36:24 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 23:36:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 23:36:24 -0500
Received: from [10.24.50.162] (uda0510294.dhcp.ti.com [10.24.50.162])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68G4aLPl1287894;
 Tue, 15 Sep 2026 23:36:22 -0500
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
	proofpoint-05-2026; bh=amnGjW9G+3T7Nm5fmWbwKZWX0vAJQUWA3Hp30qjnN
	NQ=; b=D5CwfYEs2qF50Ugeqq8mM0RFiBiOPwjA0c5kLYBKsdHOjyR0ySya2LMcg
	9FNrS8//GcTi9dG6roVUgTMU4VIRkOqom+xFIdrEWuHAAMF24QehFYgOsoznHbnD
	1e/xhepNNSUKrg27yrHpLUqdrbYs0Dsh/mA0jr21ksVb1CUROH2pfnEWehlMuPHh
	cUtGmaQrkVIbYUCH1HsK21XXuEvN3EriRwKf1c9xEEDqNh+fsI+GzDVLYjECCcnA
	F3/TtZ+jYIhCL2q4lXkXU3bVdh85eJzKk4l9WDWGjQE/2fVL0niytcbwf70d4kVg
	JNNOnvNbL0omANBfvj9ENp42qLztw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMbnjLFlql3aAQMJx6KG8vOLacUs5DTbSSyKNxlkHR7tRc0E6ZFoV0zX+0MK6ZKIL2shBF3WNC7/v1FLRkHVTyyD2w7Q7SF/raoD+kPvRskGJPMzClcMG2PiYM4xCZEWqMHEfwW7jgWB5bl2GsoVCcQHC48pZESc06BesrzXtWIA8/ijGysiaJyD2khfqYOnswGYdJKdOxgpSqbhwZtWCKKqncRww9w9A4RkB27Aeyv8sVUMZTFS++0o7+nJsROWdPp12DvPJUieH1LDfyLM28cPqPPzZPvVpCa/eV1vJPmf+kQ4xRDAmxfxmdO4gea0HLE++PnB/waEnMpYADiWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amnGjW9G+3T7Nm5fmWbwKZWX0vAJQUWA3Hp30qjnNNQ=;
 b=eWusskmxV71b/JQ089CDvwXl62vJC6tGYtvgjoptYOM8EUgI2sGjnppQrYFgU5q4O+WxbSWqaB8bGk74+5b4qlQD/pcChmb5pIssO4a2aqE2i92b7HI3AlNAYBm7HkCQGx6QgtngD3kPHoyGJ1Qy6jrJloV+Nqx378MROZ7F1wQATyVdv6gMcnEjOIdktun0nL8TYDHpkYMng6W5ex4oRx81eW3S+AFqCVLwKokCBg8c4BgKaZJowOBRMemqDvojlrpK8Gd4AGjZCHExbLX8uOjHP/P2B+js/nD/kKWHi5OHQBeCBHFbiIuAZDHQubfXFn0L1LMp0mI2pYG0q4Uclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amnGjW9G+3T7Nm5fmWbwKZWX0vAJQUWA3Hp30qjnNNQ=;
 b=bZnO8//5+wJ/smqy/BrDTBSzE2Du2TLSG44TvtWXOFj9wxOKXrm4oO5eDELoyrnSvOjkTSRYKstn0OUvjVRfw2nG7nGAjjR1J8JjGQOQ0nKtshqJHHMBBP5X/YatbQDzBzoPfXnxDGk/oVSJq1As/6dr/dH/maucq/ireKsalnY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Message-ID: <1f9617a8-1e34-4708-af44-5c1a0432e5d2@ti.com>
Date: Wed, 16 Sep 2026 10:06:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Add support to passthrough reserved memory carveouts
 to DomU
To: "Orzel, Michal" <michal.orzel@amd.com>, <sstabellini@kernel.org>,
        <julien@xen.org>, <bertrand.marquis@arm.com>
CC: <u-kumar1@ti.com>, <detheridge@ti.com>, <jbergsagel@ti.com>,
        <xen-devel@lists.xenproject.org>
References: <20260915082824.2180692-1-b-padhi@ti.com>
 <cd1be7dd-5262-42d8-a935-a8461d18e18c@amd.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <cd1be7dd-5262-42d8-a935-a8461d18e18c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBB:EE_|SJ2PR10MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: bf3efa02-6a59-4c17-2a3c-08df13ac1d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|4143699003|6133799003|18002099003|22082099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	a+sjoX7Re7btLqWGGCw5AuEN81aFEcscp3dLbyiLFeN8rf5L1LAuPMhAvudNVALhEfptPtrOdcg8ofXA8EhxDsBfCFmhNJSgRHR3425s2YNTYmPlrX01VrVHFoDR7dQ8sOW2deT5+TqF1A3CgEEa4XpBdVYPQV2N2gLvJlobePRuV+OXZa6E6ulosd3QBnUNnRI7UZjZynnVLSP69YNOtOI3LhDFIyMCTGqffORG+HtI6DKDsTNgCCxoNvPhtWzr4Fp/7WkcJVPtpBU+GTlaL783p1YQfQjzXVQwapJVkMJJlCDo7PYSkvWxmvS14dOxvV1oK1hTq+RbHpvmA02yPiUlXg917rpPp3nnQhdjQTUjg8/NVLJviRJECHQrTqK/ZnE3H4Nb+zHLIvdtMf2YuJuxolqYY/PeqdNHVtQfvTsTyZ1kvktVqK9tGmljrDa1YYOMBast1v9rwA7P26c1Jma0T+6ecatJJdimbwB54t1C9q1s6YsUqjGxcXjIUB3Pddv2xCwWrFy8SVWs3gh28NSqmgpP9Euix15ypJ/UNmt5Jh7pLeMAyuPXjicZr0CvRtJdlyvatptWcPHxUeI8Lq5iiHAMss9IFsx0PJLlWBfaVVtM0qqRmjVod2XhrncdFC8PNVFRfMe6Nf5iy9GlzJzGKJSEQeC3kIutQvy2zKv8YQJyBUrWI2RS1gomylYDSKVoTAx2YlFxTfSAqpLUjQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r/nrBkCkXZjBlGngjyByZBIN35szW0OrtSMoxMIbZPwEqMzwhc/0ekcqMxezC6ieZ3XnZ7/UaVl/rfDFDTTiymzETB0coVl1mBTt1ACL4jEq0jANdXoB764qY3MyEgBWrmY+IMS2pHhrCMMSSSNpxclLrkvOx/Wnos5CNxlfPlE85LPwga9bRkR8+FdzJXm6xIPqC8WwlBeJ17f58MJrCD6B5JwXzjN5rLcqCrxlegXm6ZAzthcTwfY7GvbkTm41OzPFc39XkJpkr3wFKKzjdqBKgNYlFJl3stFokyANOAvtk5fw4J0dyMNI3ZVJZJYZLwjg+R+lt1aynsIRoNCxMXTAbvOWwudHcnUs+/EhwU9bK+oo8swJwn/CN9WoKqQmKy9xBcFPoRT9oa+Aryyc6z3MaVKZcxkGpX8t9UjwYQ9YW9TDArW7e/KaNkfSd24H
X-Exchange-RoutingPolicyChecked:
	0/CZoscfYpHVrFRNjLeVvAWdpXkjjdaYQt6fLbHjvdjGR9KDmEtflyQyeqcXQ5hRo43P0IA/txxUJT+4GuO2EgAUT+1ko6I4xiMZrQIX31kZ13yA+Jq3sDZDDsCUzTlkRdrqF0AQ4vh8WnZJ/+AmxHmEzEptM5D5z3wCA416LjWnSu4ytalTQXEsJuSKXiv1RYF0XRnIS9A7gh1t9eTC/tMZwKiu+Aeqlo2Nf89voTLu0wlpwSNpiXSy8lPvLsy5V+Rt8Nxb6nXaUGuTu4H2/Frf1nZ1MCh9S3QuQzLECRyl+parNIbncuuqWhuQJkgcB057I75i5vLjk+y/LAx/ig==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 04:36:46.0441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3efa02-6a59-4c17-2a3c-08df13ac1d97
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7618
X-Authority-Analysis: v=2.4 cv=HP9WhYtv c=1 sm=1 tr=0 ts=6aaa1ce7 cx=c_pps
 a=jMLRuqkCa9WS4sFRI2wrKA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=V-GNSYgToPBOHEKkF1IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zolDfeCL-Cxrti9fwdDQiQcLNREWIl30
X-Proofpoint-ORIG-GUID: zolDfeCL-Cxrti9fwdDQiQcLNREWIl30
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA1NyBTYWx0ZWRfXwl4FVqj5UhMe
 JGadcZyHw5BUbkkOCeplPPHlNE0ukCPXWo5h4WHW5FnlpDe7bMOFU/mXmGlDMFxABYOukiF2FmC
 0t5cM58NFgGSV6PUN+/hhEPvQs4aZJY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA1NyBTYWx0ZWRfX8fnoJgW4gRT8
 YQ7sz56rGmarh/vbT6JT8hnchfMjcnh2ljvEcvqTnucWhjExzehESfBw2GWeeas3CqgKbBv0cug
 2I1jgZ8M6QysEA6jACrb3A4+ZU0qdznErSxbztkFU+Nfjvi8KNigHM36+mLW0FLHFc7QGfWnDk1
 1S8vwUCml9SRD10DEdfjOfslI5eYnLOwuld/EN7FMe/cXNGKOJougGwbYszfpoge0/hFZZMXj+q
 rOE+cXNmzlFPWHfA9242E0NQg2n6XDp1JQxN8wSznLOiDz5LRBaAfR+Y7PyiEAyITd6i3JSXxZb
 MeQwkPEYOe+V9rFxGkuknO3fxVyKCIf/v3MkxS3eeeo8Y6mji4cE/Danj5vqo61b3OlPIDrKVzP
 /Vh3ykyQQSUaTy+rXCfOm8FVSxeeC3xzrLRuKrk4nJm9Ia3rniuixHe51FVm+iREMjWMNBpjO48
 aG4Mr3H69X4aDvLQrcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160057
X-purgate-ID: tlsNG-ef75cf/1789533430-37CD7AE4-E820470C/0/0
X-purgate-type: clean
X-purgate-size: 8366

Hello,

On 15/09/26 15:28, Orzel, Michal wrote:
> Hi,
>
> On 15-Sep-26 10:28, Beleswar Padhi wrote:
>> Currently Xen only looks for /passthrough and /aliases nodes. Add
>> support to parse the /reserved-memory node and pass it through as
>> requested to DomUs. This is useful to enable many usecases in DomUs
>> like Remoteproc firmware carveouts, CMA carveouts etc.
>>
>> If Xen's static shared memory carveout is found, it is placed as child
>> nodes under the top level /reserved-memory node as also done in commit
>> 51a2b3f10918 ("xen/arm: fix duplicate /reserved-memory node in Dom0").
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> I'm afraid adding support for passthroughing /reserved-memory nodes like this
> patch does is unfortunately not enough to help with the common use cases these
> days. /reserved-memory nodes got complex from Xen PoV mainly because of the
> "reusable" property that lets OS (say Linux) use such memory for whatever it
> wants until device asks for it. The common use case is "shared-dma-pool" and CMA
> buffers. They specify "reusable" (hence no "no-map"). This causes a few issues:
> 1) Xen maps memory for passthroughed regions for domUs as device memory (keep in
> mind the rules from Arm ARM for joining stage 1 and stage 2 memory attributes -
> device type is the most stringent one and wins) but for shared memory it should
> be normal memory.
>
> 2) Linux can use such reserved memory region as normal RAM and hence use it for
> Xen shared buffers (e.g. hypercall buffers, shared memory, etc.). As per
> arch-arm.h any memory shared between guest and Xen needs to be of normal type.
>
> 3) Xen does not give reserved memory to the allocators and does not have backing
> page_info structs for such pages. If such memory ends up being used with Xen
> (e.g. to map foreign pages) such access will fail because Xen will not be able
> to get pages for such region.
>
> Problem 3) exists today also for hwdom. Problems 1) and 2) are gone because Xen
> maps memory of passthroughed nodes for hwdom in a more relaxed way so guest
> attributes win.
>
> This is high on my TODO list because there is a real need from customers to add
> a proper support but I don't have any bandwidth this year to do any work.
>
> I guess your solution would only work for the simplest use case which is for
> /reserved-memory nodes with only "no-map" property present. We could limit the
> support for only such nodes (check if it contains "reusable" property and if so,
> bail out) as a temporary solution if this helps.


Thanks for the detailed feedback. Let me come back with more reading
to decide if I can implement passing through 'reusable' carveouts or we
can go with only 'no-map' temporarily.

Thanks,
Beleswar

>
> ~Michal
>  > ---
>> Hello all,
>>
>> Sending this patch as discussed in:
>> https://lore.kernel.org/all/0e556bb5-269d-47d7-9ae8-68f06eee9fc0@ti.com/
>>
>> Test Configurations & Logs:
>> https://gist.github.com/3V3RYONE/bef3bb51459f8b823605261b35494a7e
>>
>> Thanks,
>> Beleswar
>>
>>  xen/common/device-tree/dom0less-build.c | 45 +++++++++++++++++++------
>>  1 file changed, 34 insertions(+), 11 deletions(-)
>>
>> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
>> index fcbeb8adbd..e9581327ee 100644
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -334,7 +334,7 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>>  static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>>                                   int nodeoff,
>>                                   uint32_t address_cells, uint32_t size_cells,
>> -                                 bool scan_passthrough_prop)
>> +                                 bool scan_passthrough_prop, bool resv_mem_node)
>>  {
>>      int rc = 0;
>>      void *fdt = kinfo->fdt;
>> @@ -358,13 +358,20 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>>      while ( node_next > 0 )
>>      {
>>          rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
>> -                            scan_passthrough_prop);
>> +                            scan_passthrough_prop, false);
>>          if ( rc )
>>              return rc;
>>  
>>          node_next = fdt_next_subnode(pfdt, node_next);
>>      }
>>  
>> +    if ( resv_mem_node )
>> +    {
>> +        rc = make_shm_resv_memory_node(kinfo, address_cells, size_cells);
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>>      return fdt_end_node(fdt);
>>  }
>>  
>> @@ -389,7 +396,8 @@ static int __init check_partial_fdt(void *pfdt, size_t size)
>>  }
>>  
>>  static int __init domain_handle_dtb_boot_module(struct domain *d,
>> -                                                struct kernel_info *kinfo)
>> +                                                struct kernel_info *kinfo,
>> +                                                bool *found_reserved_mem_node)
>>  {
>>      void *pfdt;
>>      int res, node_next;
>> @@ -430,8 +438,8 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>>              continue;
>>  
>>          /*
>> -         * Only scan /$(interrupt_controller) /aliases /passthrough,
>> -         * ignore the rest.
>> +         * Only scan /$(interrupt_controller) /aliases /passthrough
>> +         * /reserved-memory, ignore the rest.
>>           * They don't have to be parsed in order.
>>           *
>>           * Take the interrupt controller phandle value from the special
>> @@ -445,7 +453,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>>              res = scan_pfdt_node(kinfo, pfdt, node_next,
>>                                   DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>>                                   DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> -                                 false);
>> +                                 false, false);
>>              if ( res )
>>                  goto out;
>>              continue;
>> @@ -455,11 +463,22 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>>              res = scan_pfdt_node(kinfo, pfdt, node_next,
>>                                   DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>>                                   DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> -                                 true);
>> +                                 true, false);
>>              if ( res )
>>                  goto out;
>>              continue;
>>          }
>> +        if ( dt_node_cmp(name, "reserved-memory") == 0 )
>> +        {
>> +            res = scan_pfdt_node(kinfo, pfdt, node_next,
>> +                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>> +                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
>> +                                 false, true);
>> +            if ( res )
>> +                goto out;
>> +            *found_reserved_mem_node = true;
>> +            continue;
>> +        }
>>      }
>>  
>>   out:
>> @@ -486,6 +505,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>  {
>>      int addrcells, sizecells;
>>      int ret, fdt_size = DOMU_DTB_SIZE;
>> +    bool found_reserved_mem_node = false;
>>  
>>      BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
>>  
>> @@ -538,7 +558,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>       */
>>      if ( kinfo->dtb )
>>      {
>> -        ret = domain_handle_dtb_boot_module(d, kinfo);
>> +        ret = domain_handle_dtb_boot_module(d, kinfo, &found_reserved_mem_node);
>>          if ( ret )
>>              goto err;
>>      }
>> @@ -556,9 +576,12 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>>      if ( ret )
>>          goto err;
>>  
>> -    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
>> -    if ( ret )
>> -        goto err;
>> +    if ( !found_reserved_mem_node )
>> +    {
>> +        ret = make_resv_memory_node(kinfo, addrcells, sizecells);
>> +        if ( ret )
>> +            goto err;
>> +    }
>>  
>>      ret = make_intc_domU_node(kinfo);
>>      if ( ret )

