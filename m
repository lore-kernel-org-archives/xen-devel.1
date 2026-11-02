Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4766660A261A
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4qtxj1yc
Received: from list by lists.xenproject.org with outflank-mailman.1468150.1677228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNqEy-0004lM-G7; Mon, 02 Nov 2026 11:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468150.1677228; Mon, 02 Nov 2026 11:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNqEy-0004lF-D8; Mon, 02 Nov 2026 11:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1468150;
 Mon, 02 Nov 2026 11:30:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xNqEx-0004l7-N1
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:30:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNqEx-004V1L-3U
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 12:30:15 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae87432-8faa-0a2a0a5109dd-0a2a450cb23a-46
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 12:30:14 +0100
Received: from [40.93.194.46]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae87444-f479-0a2a450c0019-285dc22e592b-4
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 12:30:14 +0100
Received: from BN0PR04CA0135.namprd04.prod.outlook.com (2603:10b6:408:ed::20)
 by SJ2PR12MB8978.namprd12.prod.outlook.com (2603:10b6:a03:545::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 11:30:09 +0000
Received: from BN6PEPF00000075.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::83) by BN0PR04CA0135.outlook.office365.com
 (2603:10b6:408:ed::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 11:30:08 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000075.mail.protection.outlook.com (10.167.248.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 11:30:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 05:30:08 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 05:30:08 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 2 Nov 2026 05:30:07 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8jep0f8n/jpDgyVxgpvkiXd1cRhA1rcLpLmcxt00ZZQudUt+AUdbCRAybhsRUVSZAVu5+eAIfXw9pw6TQuLeEKIpUo4llxVpEMAllR0uaHO2k+ZzZI1jG/R+kGLZS8atnIY9pLG4o6cU8Nuw6FK4fgcgX7/rpSciFVSSjIX9jHqvv7s0hR7XTKcjAyOTADYnxCKKeS4+r76NKeX0aF6LyWGxhgyY6pwTpB0hs+MHpxadQXGQPogCfPxrCSQCb1Q2stNIm2NlxUIdPl6QrdkAVb/0aE8KF9qZq8NwXUQYU6cPj8UVaSRU/GcDD3Z3hzNxBYKls3OMfwxdwvw0MeJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FteCfO8eTtVp63/F7EpCMBJ85Rlh1AXhEiwwPZ08owU=;
 b=LCd4b2bDuCBRX2C+CbD6fSdKsrMZCYFHuhb++tl39YHOH/MvG9Qq7vyiFFcvGqhpEIptcHYZ+LtMcQpmjOlXUSRBLCVcG3Ylzhgx2DpXFduPZOpxyrUNf6wnrACRt3ryEYLiLFndnk0LsHVZuSim1JTuZxai/2I1912mYYlndFkszWCBAXIq2OHXpvwM3OfsW6vMdP4eblEtURHZuIedkwKXL+mx11BzmYJYBzjQDv06uTYcPaO4Rad+Qfu0p0z82j/dTMamIySt6m4iF9Yn3pKHrWXYfgABYb6gGR1BNf7KZ3iAB69LcOeNUgGNSPqsNcD8CTUhGWSncRaH2ZPJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nxp.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FteCfO8eTtVp63/F7EpCMBJ85Rlh1AXhEiwwPZ08owU=;
 b=4qtxj1ycVsP+wVtsuew6Mj/h35QrVNsufIZqfNWHuH0poUuAVMRxSJSpikGzjB+3I8bhDcutoWwtUgtk4Xl0Jzk4g5w9M2fvX8achcSHyy6yxEG+JAcuJY40ooRREKdqf4fRCEXK8D4L1a/mXEIbzEpTQmp8sUluQL14bTDNGUw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <ab7aca14-e169-4899-bf71-3563ab792083@amd.com>
Date: Mon, 2 Nov 2026 12:30:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen decoding instruction 0xad400420 is not supported
To: Wujian Sun <wujian.sun_1@nxp.com>, Xianzhong Li <xianzhong.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <DB9PR04MB80894CBBF23E18E68E2A798DF56A2@DB9PR04MB8089.eurprd04.prod.outlook.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <DB9PR04MB80894CBBF23E18E68E2A798DF56A2@DB9PR04MB8089.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000075:EE_|SJ2PR12MB8978:EE_
X-MS-Office365-Filtering-Correlation-Id: 704a3b9e-ab6f-49c4-a0ea-08df38d4a670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|11063799006|56012099006|261009223027099003|261028144727099003|261026121527099003|261021121427099003|261026140227099003|261022105027099003|261022075727099003|10067099003|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	+ZzT6g2MzwMJ3XlAwl8/fMFSGGmy/Gom5Offx+XP1TMqtVH0vf7ofcFg3hTr3aqBySIl6c+ahiIZiPGDmsa+FJVF6cb7O6sq9hGxCBh3gnmXsQDnaNYkyVWIuNnsygUiiyo2+FzyjdoZSdAhEzdJ1JWU9B1f7UFWXaMNk6T5+DCU0/KEw8Rz3dCY8G6Md2xbY/xW4a70I4TFwC9GwG+toU/N0YLXQmKPQof3dVsRb7S+Qk1DfqN6no5LPutodjR9JMfSArmUVs1TMiRFOp5/6km9FlhRcCoXh2EH4xE/Ou8ICUYF3X0aFVeDWRvmk8soTHSaSHz6bBvgPUTYPJpKgnLF/KO19e31LShE8M1WhVyyhsmV8sCBlrJKAsUOA5l9wmXut6BfgD4b8R3ZZpow6avS7wBqEfivpUc3tHeRs1FiPofVf9y55u9cVi1pMroKV8W6JpfDzyXiiir2oI1igAEu9NQxi8ST31iq97sNgRII696OZejPi8DEKCIM23NqvYkCpSRmzZdvwn3p0JkeWTfZyTalWc3NIdvOgQ1q3gm72yqWCT8eC7J26FJdm1z2UVUGus4iUkf8guzg1FYG67DUkCdvZZ8fb7gBWt/YgP5A8CNWZb1nhw2Kvtx167HkZG/fduXIFIihTZORahMF7g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261021121427099003)(261026140227099003)(261022105027099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gFgv26W3pZ7qgwtDIIsaiEfF4WYtiYHYoJrt+5HVpaUySUl5CVDQww695gV0Y7jQMSrlsBYTZUdVMl05Ve+Cpf/GAR4hm6IqVXpBvUy/4nQDdgoz9s0FmkdHftO4JM2JW3tLUzB7fMyS++VkHKI8NiXb70yBFgn0gZGsCDkpZ5+9vwsGbV6KmNVAOP054STFxCMvkbynSyPhOCDvJbUYtT77X3wGqaCrNILQxjdtJhMJAZ1vnN4UzreFGCFGIufHkmcR51fy+D1kJIi1dRaJfmKIs9SdBq7n4svoxmd41F7TEhWDVhxv85pkYC9SIS5hFBTueCr/KXAA85r3J84ZhKMHWoKORjXVC1Xo0pabwBozlcV3p+9YEEYczrsrqs5Myb+RBTyUUmSZY7ti52Gpp+XPQHHovMOAgObzZ+F1AiaYKyHpTVMqFqczV/YN1JC3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 11:30:08.6136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 704a3b9e-ab6f-49c4-a0ea-08df38d4a670
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000075.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8978
X-purgate-ID: tlsNG-d25034/1793619014-020C1A5B-38186807/0/0
X-purgate-type: clean
X-purgate-size: 1241
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 02-Nov-26 02:43, Wujian Sun wrote:
> Hi everyone,
> 
> I am trying to enable virgl native drm context feature  on GPU Mali G310 with
> mesa panther driver.
> 
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1694
> <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1694>
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45055/commits
> <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/45055/commits>
> 
>  
> 
> I tried both xen 4.21 and 4.22, but both met the below issue.  Does anyone have
> any suggestion about the issue?
> 
> (XEN) d1v0 Decoding instruction 0xad400420 is not supported
> 
> (XEN) d1v0 unhandled Arm instruction 0xad400420
After decoding [1] it looks like there was a stage2 abort as a result of
executing LDP instruction for 128-bit SIMD&FP registers that Xen cannot decode.
Are you executing this instruction perhaps on an emulated MMIO region?

[1]
https://support.arm.com/documentation/ddi0602/2026-09/SIMD-FP-Instructions/LDP--SIMD-FP---Load-pair-of-SIMD-FP-registers-?lang=en

~Michal

> 
> (XEN) d1v0 Unable to decode instruction
> 
>  
> 
> Best Regards
> 
> Wujian
> 
> 
> NXP Confidential
> 


