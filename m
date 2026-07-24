Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA00C531F9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 08:32:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369888.1618363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnBKl-0000cx-NJ; Fri, 24 Jul 2026 08:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369888.1618363; Fri, 24 Jul 2026 08:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnBKl-0000cq-KZ; Fri, 24 Jul 2026 08:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1369888;
 Fri, 24 Jul 2026 08:32:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <b-padhi@ti.com>) id 1wnBKk-0000ck-7k
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 08:32:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnBKj-00BDLL-GY
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 10:32:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <b-padhi@ti.com>)
 id 6a632325-bab6-0a2a0a5309dd-0a2a4501aa9c-6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 10:32:40 +0200
Received: from [148.163.154.28] (helo=mx0b-0002e601.pphosted.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <b-padhi@ti.com>)
 id 6a632326-5984-0a2a45010019-94a39a1c7dd2-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 10:32:39 +0200
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66O4lIS7408453; Fri, 24 Jul 2026 03:32:37 -0500
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7hmej-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2026 03:32:37 -0500 (CDT)
Received: from DS7P220CA0097.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25a::6) by
 DS7PR10MB5087.namprd10.prod.outlook.com (2603:10b6:5:3b0::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.11; Fri, 24 Jul 2026 08:32:27 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:8:25a:cafe::4d) by DS7P220CA0097.outlook.office365.com
 (2603:10b6:8:25a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 08:32:27 +0000
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Fri, 24 Jul 2026 08:32:26 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 03:32:26 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 03:32:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 03:32:25 -0500
Received: from [172.24.22.69] (ltpw09g66v.dhcp.ti.com [172.24.22.69])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66O8WOSb2859949;
 Fri, 24 Jul 2026 03:32:25 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=proofpoint-05-2026 header.d=ti.com header.i="@ti.com" header.h="Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=selector1 header.d=ti.com header.i="@ti.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hn4uvu6xUHqmPN17z9JfBf/PvTCha8Eab+twlmEpd
	eA=; b=My61sY8UR9mdhQekqjmh37JcKxFLBFR6RptYybSlntistNKw+wLR5fLMM
	ZTAyFH0zSwj0g9okhCqYz5ANegO7K5eXTgPGwGmMnUq2/CZ0g309xqFSza7fR0fL
	F2zjf7odO25WtuyDrVhl15e/cU3MgG1I6x4KPUVbIJuWrg0GItV3nJD7apc0RT2s
	FVVVj3qMZi5uIRfp/wNkNNdbP3I8mOWdHvDISsF+/FulFE4/xzx8uKRqgPE1zJur
	Xevxc4YbOOXs4qyPMxEQjfbLC/hyQ6J362hnQ9Idw8RkjejzoyL9nPSfdIHi4SJh
	6OHt2e3PC+lLgyoi/gjqJSgMwLHKw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YalrudPRN2tTA9y7waWzphZgf10hQ7I9s7NRMmVtsJK+uvHOfHneX80bVFS/EeahouKJ1fQ8yffJnnG4LWKTSEuJiJi0c5yWgeXdKFXBZfRB4tHUNBuVAGlXSzEvOkBJ36dw4h0jxTAySyFFGO79CpgOTWffQsAXD4YbTiJXCy5aIZBVs+f+3UV1MHPsUz1FEdOA+iIJXjAmny2sRXEt2PJIibqoUloc1z3be9NAFBZdN7P+c6Ut0LRH/4Q2yXB9jCmiYnq3TdxfntqUEH8X6S9WkZX5SCL383E7lkERmxpBZNmuJ+StJuwLDXT27SohlKoyMK+QH54VCVDUkcrpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hn4uvu6xUHqmPN17z9JfBf/PvTCha8Eab+twlmEpdeA=;
 b=vXhIDmkLB/BNB3qMvGcgLaLRRHa3fuQFNcpECfzJKBWVpzha4gGpXHV63D/l9dfVUHHrmfyXE0hpknlkcJJGa5RDJNXzpzgP8gV3bC+VGsG2hiRhwOCeoAOIo7c8wFXrlOTbqzaRU8QU2FKLBl4eQ3piQOcVbBB9RfG6FIEGS8h86e7yShxl4wsqV9vKy+FsFoghrnF+7bDlOVdAl9Y5vZ0ocDOLdbGn8V9m1wJvNHNmfvFIhyL1Vtx1biVq5ASZlRKwAp7XCiWDr7dNE9zLef0IFFTISOg93Zu/8TpHsX60U6ZzPdDhvbDT6NF7JTolIVXY6E4b4df1OdJeD5Ynzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hn4uvu6xUHqmPN17z9JfBf/PvTCha8Eab+twlmEpdeA=;
 b=RsWqasr4vx2pbR9qADi4VmJ9C0Oswi78DpBshjp/mReYwy58PSHrTUAphr9ooV6mz+z5QgNSXLKbqf9js6jBcx5Gg3MMBn1q9wk37q1zbxZ5YozoXFr/8gl/D1MTuuoF/17oNjM7a+/67hI/Kg9iL+r2n60J7vEc0X6ahajv4J8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Message-ID: <92ad79d5-ad28-4b17-ae13-174135d565fe@ti.com>
Date: Fri, 24 Jul 2026 14:02:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Query] Unable to probe reserved-memory carveouts in DomU with
 Xen
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
References: <ba100bd7-5cc0-4f87-af3c-dca887963d44@ti.com>
 <c042c42e-89a6-4d9e-8b9e-3f6ceb259467@amd.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <c042c42e-89a6-4d9e-8b9e-3f6ceb259467@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DS7PR10MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d68fffd-1f3a-4a4b-1e50-08dee95e17b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|22082099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Cv/NkF7j0T4CohOBSJ/g3gHn8ed+jce814kvZIGJ/hRCMWyh0FZL++yXn11KXBIEAQiwRyh9SKPoSj4FUTIaDlQAKpOV9BB2ArvM9RZ3EI96YJ/AAWhNvbCZOiHviw35GRuocQAxRJDowacIJrvJP6XHwmAths2iLLkZaBOqbNc6ZeJB6i7t0WSNiNiKC2vBLXnlQuutztSm+SlSoD+x/c1XchrSxT53q9t/PkWA7aFO4YmbdH/rgTse7FmAryLOk/kbECLNVrPmNFV7s5R3M9oIpojUJdKHd5k3c6KIPUIkuliIgqF/MtWw0Y6V23aA3ehmBN2r/FsDYcYkSBlWaKNYBztCMErvQHg89T3BYGUIqtPNBx78VX9xVyHefk6RETxrolxzbT6qgbp2UlAnL70Bzba7FHWsazZsAuKGUdMj32JK2D1CUz5rEO8l8dqf4UjE8wEvzzVA2gCWmn/3WxAjDyFrtcdS60rCiC7NbcpsePjf1jMhWTs/Tg9Y9aB6tVg2PFIZIG+DHOVOp3RYDJnEkhU4oMkOMsavEgN58tgul5XDv2r9kgoRa2aIfGUuH7+HiJkHBTm/GAtklsNVwRsy/g5SX5qBNyW4Z8LQFteT4q8s5x+sl+EBimRyfO74tW9U29ehI12KGrjpMCsg5ZOIkwRtrN1egXWClEU4QTNFWE9tFE3qkkxOgMpcagVKTXsWk1/UtHMdEj6YEcvDMw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZuRSQXgwsZjr4BCb4yDA6UhIb+SUwlFgzlY5G3fzgBI/t10wwdjOqowZ4W0Eg6LBQwIiz0r3++XwRN2ewx279EGHY6F8v+CwLvns3VWDorjRHtxZTeaPRP9e+iRWbr4kT1ZzyCPRuAtyg++SdJj8i7HgGX6CZTaSCVuYqDAJT7mi67mOXl/dc5UC7356yD7OwgFohrobsi/pDik888tKIvmt0qIYiX3j6x1FY7saDcHWzUDJXZ6JzmZFzc33ithuj6L6PXR1f8tqH1GT+k8oe9vg1bNsJHwRTJg52dOZY0iitVmbRd3smsP9p/MpJPcAfB20YM/Wb4UMmq55l4r6bzGNFr872lqYSrKeKiYRIsiCM1oFoGOjvT/ldPRA72fVthtBcYpV2XvtwWySDl6PQbm5IJdsd4ISb4yv7qo8YHtoKWAip4aCgwDN0g1Mse4D
X-Exchange-RoutingPolicyChecked:
	UrJJh790AgYoA99JqRSE+dQHuyj2XR63CBhmNEfex6ME8xqP1KnUamuli1lSZtvjIS72Eu4xaqCFqjvnEokWYUixGPvBwRif+SO9a80VlLc9dBwtow45aA6QEBBsvqA5HHRps23gZoDXBx90v0tPvDJhs4txvZsS+YX2yk8cnMlXrduf+JIJcYO1EK43ztJlY2xn0yLiaxw5ixWr6xBWavOlrCUYLaxNGiDymvSY498XDyJOOkugnFkRarJVN7Spiinl9ceuN9ehB5bDv36QztJmZrSq7UdkIjeixGDRxl7+NCemvOiUKYYojI9nQ3yGF/ZLecrgHAI1TctBOFpTcg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:32:26.5935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d68fffd-1f3a-4a4b-1e50-08dee95e17b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5087
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a632325 cx=c_pps
 a=0CigaX/e8+d28YZ4T1vruA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=-pY1gOhbICEf3BRWbVsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA3NiBTYWx0ZWRfXxhRD/SegIMhy
 5xtOIvLRYhcBBVYtDSakBFnSS3dnEUfW2lyR9sPS1f46/NYlW6YTG2nO0Vg7j3y48fxumdrRUjV
 vh8PD8JSzVoAr+1PfvQ0kbovlJHFR8k=
X-Proofpoint-ORIG-GUID: nP8c9XhaC7wvaj0zyi77ofa4aR8Jiw5o
X-Proofpoint-GUID: nP8c9XhaC7wvaj0zyi77ofa4aR8Jiw5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA3NiBTYWx0ZWRfX6jCI+43DAqdC
 5BuZiJXhTsBFJHi0Bxe7NLLc9Hdb4WKchfvtez2E0s1ov2vYdYeI5u+ojwhuDeQkW5++MGKuSmS
 OFv0oMDvoyFVa9E66DPog3ONA1hnc+qsSbXGlmNO+B1eS4G+q34iFdDenGhnOKS7FXQhMpFH1C4
 QbKIjyrxQ7ufruMH2XS9yAIGz2lAI1r8EZ5e4IJR0RhkmOltEN6OE8poVCPtCBvivDUAMHZLtAj
 qQbRVvzuMhK7ZHU7rXe7sScNniEBklb26z0HPmZ2Kq8AKC8wHxUB3LfPZouWDymAZRRe4y/41JP
 wd3FoBlWFVtdSfg67c6Lcegu1hiI/DOzunE9+JEDytsYRbopnhpkBAEL/h83RTIVgDtHlrQA08A
 aTIt3cTl/FG+mydUqIjQyGisUUMJVzXj/NWKNIrn3Bn3bjstbXWq9Bh1IQF/iZVEE+F+sem2e1W
 NDzLWrcrbwyn40FmwjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240076
X-purgate-ID: tlsNG-d62444/1784881960-1FE68757-86D0A507/0/0
X-purgate-type: clean
X-purgate-size: 5931

Hello,

Thanks for the response! I see, this would solve the cma problem. But 
there are usecases
when we want to use the reserved-memory node; one example is the 
firmware for
remote processors. In that case, how do we passthrough reserved-memory 
nodes to
DomUs?

Example:
  60
  61                 mcu_r52_0_fw_memory_region: memory@a1000000 {
  62                         compatible = "shared-dma-pool";
  63                         reg = <0x00 0xa1000000 0x00 0x100000>;
  64                         no-map;
  65                 };

Thanks,
Beleswar

On 7/24/2026 1:52 PM, Orzel, Michal wrote:
> Hi,
>
> I'm afraid this will not work. The reason is that Xen only copies nodes from the
> passthrough DTB to final DTB that are placed under `/passthrough` node and
> `/aliases`. /reserved-memory needs to be under root node `/`, therefore it will
> not be copied. However, it seems like you are not using CMA node specifying a
> fixed memory region (using `reg`) but size. In that case you should be able to
> achieve the same using `cma=128M` kernel cmdline parameter.
>
> ~Michal
>
> On 24-Jul-26 08:55, Beleswar Prasad Padhi wrote:
>> Hi all,
>>
>> I have been trying to use reserved-memory carveouts in DomU, but failing constantly.
>>
>> This is the log from Dom1 boot:
>>
>> [    0.000000] earlycon: uart8250 at MMIO32 0x0000000053914000 (options '115200n
>> 8')
>> [    0.000000] printk: legacy bootconsole [uart8250] enabled
>> [    0.000000] Xen 4.21 support found
>> [    0.000000] efi: UEFI not found.
>> *[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT*
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000000040000000-0x0000000051ffffff]
>> [    0.000000]   DMA32    empty
>> [    0.000000]   Normal   empty
>> [    0.000000] Movable zone start for each node
>> [    0.000000] Early memory node ranges
>> [    0.000000]   node   0: [mem 0x0000000040000000-0x0000000051ffffff]
>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x0000000051ffffff]
>> [    0.000000] On node 0, zone DMA: 24576 pages in unavailable ranges
>> [    0.000000] cma: Reserved 32 MiB at 0x000000004f800000
>>
>> This is my passthrough.dts:
>>
>>      1 /*
>>      2 * This is a partial DT for passthrough node to DomU.
>>      3 */
>>      4 #include <dt-bindings/interrupt-controller/irq.h>
>>      5 #include <dt-bindings/interrupt-controller/arm-gic.h>
>>      6
>>      7 /dts-v1/;
>>      8
>>      9 / {
>>     10         #address-cells = <2>;
>>     11         #size-cells = <1>;
>>     12
>> ~  13         reserved-memory {
>> ~  14                 #address-cells = <2>;
>> ~  15                 #size-cells = <2>;
>> +  16                 ranges;
>> +  17
>> +  18                 /* CMA region for framebuffer allocation */
>> +  19                 linux,cma {
>> +  20                         compatible = "shared-dma-pool";
>> +  21                         reusable;
>> +  22                         size = <0x00 0x08000000>; /* 128MB CMA pool */
>> +  23                         linux,cma-default;
>> +  24                 };
>>     25         };
>>     26
>>     27         passthrough {
>>     28                 compatible = "simple-bus";
>>     29                 ranges;
>>     30                 #address-cells = <2>;
>>     31                 #size-cells = <1>;
>>     32
>>     33                 misc_clk: misc_clk {
>>     34                         #clock-cells = <0>;
>>     35                         clock-frequency = <100000000>;
>>     36                         compatible = "fixed-clock";
>>     37                 };
>>
>>     73                 uart@53914000 {
>>     74                         compatible = "ns16550a";
>>     75                         reg = <0x00 0x53914000 0x1000>;
>> ~_ 76                         interrupts = <0 302 4>;
>>     77                         reg-shift = <2>;
>>     78                         reg-io-width = <4>;
>>     79                         clocks = <&misc_clk>;
>>     80                         oversampling-rate = <16>;
>>     81                         programmable-char-timeout = <4>;
>>     82                         status = "okay";
>>     83                         xen,path = "/bus@100000/bus@22000000/uart@53914000";
>>     84                         xen,reg = <0x0 0x53914000 0x1000 0x0 0x53914000>;
>>     85                         xen,force-assign-without-iommu;
>>     86                 };
>>     87          };
>>
>>     88    };
>>
>>
>> And this is my dom1.cfg file:
>>
>>   1 name = "dom1"
>>   2 memory = 256
>>   3 vcpus = 4
>>   4
>>   5 kernel = "/boot/xen-dom1/Image"
>>   6 extra = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x53914000,115200n8 loglevel=8 root=/dev/xvda rw"
>>   7
>>   8 # UART1 (0x53914000) passthrough to Dom1 console
>>   9 iomem = ["0x53914,1"]
>> 11 irqs = [ 334 ]
>> 12 dtdev = [ "/bus@100000/bus@22000000/uart@53914000"]
>> 13 vif = ["script=vif-route"]
>> 14 device_tree = "/boot/xen-dom1/passthrough.dtb"
>> 15 #
>> 17 disk = ["phy:/dev/vda2,xvda,rw"]
>>
>>
>> Am I doing something wrong? Any help or debugging leads would be really appreciated...
>>
>> Thank you,
>> Beleswar
>>
>>

