Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB5AC61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 10:19:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403913.1637861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0z6q-0005Ra-Vf; Mon, 31 Aug 2026 10:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403913.1637861; Mon, 31 Aug 2026 10:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0z6q-0005RT-SM; Mon, 31 Aug 2026 10:19:24 +0000
Received: by outflank-mailman (input) for mailman id 1403913;
 Mon, 31 Aug 2026 10:19:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x0z6p-0005RN-B2
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 10:19:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0z6o-00EWQ2-7O
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 12:19:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a955515-2eae-0a2a0a5409dd-0a2a450cdb48-26
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 12:19:14 +0200
Received: from [40.93.198.8]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a955520-f479-0a2a450c0019-285dc6087598-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 12:19:13 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB5527.namprd03.prod.outlook.com (2603:10b6:5:2cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 10:19:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 10:19:10 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9merhmBY9PAuC0D3ms8IyjCRlF/JYBBeaJrfSSxOBV1u2o2Q7sFHIV0eaznSikylxal8C3hbET2jdMQ1TIAXd4qSm7ge3fICu+/xHK0zNQ64Fllx/sD0a2Y8RJoja1xajCKj0jxvmxqXwowu2K2mxC4G7QPdw9fDoGKI37X5ceQHmasI2hMtq3Ct+PRRrdHQHIVaFKUC42ZMUGJplrmIZfCxJgEjvYvAsN1WhFHq+F8z6LRSnQMYf4/bn7SH2z245nsIfanvIhv2xWN04cS5bpiG8q0cS+TzzGt5WCJHordytVq9ca2ZotembdFJ7wwKMMFXJMb7gS+wDvG+Hrduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8Ypo8Pij5uMv8SuVvXLIhAv+uICPjOUVBIl87hxIp8=;
 b=jL+/WH6+MrN/PI/4CjocbBBDnKEObC79PE9jIdOf8LFXLnLRDySI/Dq0mJ/9UGrdcq048dyzSPLcX636nfkvM02QBdlluKd5Q0tSBoMdj76r5+2FHVKXgVHMk3ssM+arYD6qZKXfICO9xzzJLXMFyqTicJC1wp768X/SJzv0Nc2VPCfBnxPe2XkbWOyDrImXO5SoHPDnp94dM6e27sX3u+XQ2tKuMaSft/EMPCnrEoVMYhwrhPdqd4EtWNjn4X8d4G10KCbm+5bnKNBRCI/AYeeplHvPEfx8GqK44OWjChRIBSBzuBoS1Dmq0tas14Wb1FpMxOx29MQXJtMp0vdNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8Ypo8Pij5uMv8SuVvXLIhAv+uICPjOUVBIl87hxIp8=;
 b=pjEYVVeH6+H9Izb4p6I8syxtE0P6VgSxkIwg5aTMXXH0NvoH0/P9NevQS5R/9WMYsy6PlvSGYxxzyzQPbozSeiXVyv/81f5taUXHSWWzv/PImlKT86IXqqlw9OErSSG/5GJk5YmP7lCcxqwDzLD0qEJBD08Bi0+KpoA+10hQ/aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d98bff6b-c32c-4c52-bbc9-cf88e4be6c3f@citrix.com>
Date: Mon, 31 Aug 2026 11:19:05 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 2/2] common: dom0less-bindings: introduce XSM labels
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
 <e97ab666be0d667dc823c3d881ac9ed76267a7a5.1787821757.git.Sergiy_Kibrik@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e97ab666be0d667dc823c3d881ac9ed76267a7a5.1787821757.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0604.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB5527:EE_
X-MS-Office365-Filtering-Correlation-Id: 357b064f-27bc-41b9-31ce-08df07494c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+zeOt38puFPY2bUKVYpvw9uHngMV3Lae2YyuHxzM5Sh0MEirdzVPs3uOTOmibZqCXpSkUe0T1k0KOAMjPFin0tEqEWwLyxNt89i2+n185PwB91zAi0lTSZzqmL4FmrlM6Qxix42zIAkWm4mOEI7g0TmSGgSWU+jrw5iElEVuRWTkZRHmgpejv4fqPfNrJqtkP69d+w43mpSVFJc3mWQuMCdhfmXBd7RwI/F0XUNGA28KyZ9EaDey3onUP272M238DZR6dyT7kwtF8QwqJuwkd989uNMQtoBfmFp/9ofjVcxTnOrxqSxuCaxPl+KDBMyvthItQPgGpHLRul5WAyY+ZyzRkSwpfZI1XPI1tR+PhPriw7oSS+BX9rvhu9pNqnAtmFtsANUBq05gAh8Y0qJ2ugO4nC3OFDNWgDvfig92rWF9P+e9p06tmzNCFY4Mwnw8U9qIeNqKeA3SQO7poW5shjmwYM9Pro1dAM1lH0m/tTFKyBIZ+h7T9rlKGlBWVA/lb5puhLe2BBy+eYRO7UD8zo4xns15odJqtURJc7EMb3r6afNbV+ODjqrkTkUginGCwqImExF8ucnKunasS+6hnuMTmxwSVMY6+ZGTA2xmo9Gw7hsQfPBa0im9WpetQppSGuxXSJ7KA8N3HvyYm0J8z2R/6pvjzDLO68Dtd3sEyUs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0gyb1EvU2pUb0xRM3Z6dVVET1pDS1hBYnkxQ2g5OW5ob2RtbUNEZFFwOXo0?=
 =?utf-8?B?S0xUd0dybCtMTmFUMk1GcGNZaDZCVUlheEExWlBWcjM1cFZLd3Irc3kzRmdO?=
 =?utf-8?B?dWRiV0pXZVBvdDBiQ0plS05qWlpIUll1c203bXdMcXc5TUVMUkpvcmdGd2or?=
 =?utf-8?B?VHJ2QzNIdWN0U2JGSEhPMGNRV2VOMFlmTG9yenJDQW83MmExY3pMK3dIQ2xk?=
 =?utf-8?B?VzRlS1BBTENxbFM5R3B4SmplR2FtTWgwL1dsWkJ1Ulh1T2Vhc0N4QkdRTnNO?=
 =?utf-8?B?ay9BQU16MmtvNFVLOGVNSnMxOWhQRExpVEp0TkF5UElPWG9YL3NtVFhXczBj?=
 =?utf-8?B?b2ExWjFabENSaDlva0N4MmpvUG1zazUwNWZRK2hjMFRZbHEvbFNkSVFReHUr?=
 =?utf-8?B?ekZ3MEdnKzZCaTl4M3M1blRXaENyZkVUTFpSVk13VmdYbXlobG5vUnJEQ3l6?=
 =?utf-8?B?WHM3Wkt5aUxHQnNzc2pCc1g4YlZGK3hZZTVWQ0U2RkRsZUxPdUJjWFJWL3My?=
 =?utf-8?B?Z2lPbnZjYlBIL1JtcVJqUFZPSytXblFESDdTVlB5M3ByQklWdTdRMFJaZVVE?=
 =?utf-8?B?OFVyd1ZzeW01bVVPc3Z1dUJvNXJqVTFvWWFZeHV2SXlrd1dSNnNMTFlvQzd1?=
 =?utf-8?B?bVJjbm9CVXBLNWV4OGZpL2ZMMmdiaGJqT1d1QVBYSmZWZ0E2amFuUTBPUm1M?=
 =?utf-8?B?cmcvTHlxSmhreXNuNVZheDVTaFhncDlCNjBBcXliazRTb1hmY0thM1AxNkhM?=
 =?utf-8?B?WFFlUWFUM1dIZFhsMU5mcXFGT3J4QUpEdlNWWkJZNXFrNmg1dDg1VVRzSHdk?=
 =?utf-8?B?TTloZUNpTVRJWXdRejlrZEVzUHczanNwbGllTzZlbVFIZ2VXZXFWS3dSanlP?=
 =?utf-8?B?c1AwS0ZUZnk3QU1nOUxNUzZXRmdMYVZCM0w1RnZPM3ZEb01ZaFowODdpajVD?=
 =?utf-8?B?S1I4L0U4am40bEhYZlRsQ3pqZjkxTkUwcG4rTlVZbFZ2SldJUldFaGU2b1VH?=
 =?utf-8?B?WWI2eENXaUFSNmVxZE5oZTY2M1pxWGowVmNVcmljb2V2YXpHMUx5QXFQOWhZ?=
 =?utf-8?B?cTdVQmRPcTRsM3p6aUpGa3NMSm4yb0VOMVlBd2NKMDYvenVISERIYkhGVDhL?=
 =?utf-8?B?dXVIVjd0S2ZoNlNLZVoxTTZFdWo3b0JIeWdZcG1sNDBkSjZlQWRVVG9IUVo3?=
 =?utf-8?B?YmgxYjNMK3R5cHJhS2hpa2xTbXhQVlZ6OHhtWVdqblY3ekovSnhTUkZ2QmhP?=
 =?utf-8?B?Smlma0tVRzJ5U1puZ0dOYklwNE93TFNCWEpYMWk5bjBhVlU2UU1Fcm8wQmxW?=
 =?utf-8?B?QkF0TmdBa0ZZMUp4SUFKOHozbGVIZWdMNDVlc2tYZTRPRTFZUTlDSFFqU1M4?=
 =?utf-8?B?THJxLzl6Vjdnd251OTd4QmQwalhzYWZVMnl4aWNtUnhRQkVERDdxbTBRSDV5?=
 =?utf-8?B?eGRsbGw0ZThiUEFZYWlyaEN6aXBMeHFyRERsQThXc1VvSkoxNVk2Vk1YTUlY?=
 =?utf-8?B?ODZRVVp1K0JuU281czlkaGljY29Pem5kRzN0MkxjcXRPWHpuL2JrMnl3THlZ?=
 =?utf-8?B?OCtzc3NTUGVsMjR2SDkwL1EzQm1pR2VFQU1kU2ZvRHA2Z2h6cGZTeUE4S2s5?=
 =?utf-8?B?UjBxZ3dmUmtmRjBXMzlCR2t2ZzV4czBjYkpmanAwa3JaektuZ09obVVHTE1X?=
 =?utf-8?B?QWUzU3IxOGFLcmpnSWJ5bUE2eXpnTGlQWi9JakMxaGkzUVlLemhrakJxb2hp?=
 =?utf-8?B?QVYxdG95ZitQQld0Y0JhcU1jRjUzZXlEUlI1bE5jQ0ttTUFVamhzejVUQkdo?=
 =?utf-8?B?dnU1ZUpIVXdyZEEzZ3VpQ0IyWWQvdWQ1UW1TOTdBS1R2SEJPZ1B3WktKTWVN?=
 =?utf-8?B?Tm53T3JUNTRrK0RSZWM0TzZyak9uQmplZmd3ZGVKYWpLSVVOQWhzMEhNVDR2?=
 =?utf-8?B?N3EyeWQ5Wmg3YW5hQlFVQjJjTlpmSUx4SVVQZ25rS2UzeXV2aTBhTnJ5V1Ja?=
 =?utf-8?B?cjJSdUErWjluWWF3L0hmSnBiWDlyUC80cWhJTVVyekdHU2NuejRaVlBLYms5?=
 =?utf-8?B?aktCTW5hMENueExQbE5ieFR1VjdianVVV2Q4aC9PcU9IK1V5L0YxS0xhQ1pT?=
 =?utf-8?B?ODdmQjU0RlFrSmMvWVBvRHNud2RoZ3d5VWJoSEpCTlpYcXhiM1ljZzNGRlpC?=
 =?utf-8?B?QlpEeTZpcitJMU9uUkpMbzVwSW1JWXBMZ1JXcnBmTDgrYU5mNVdMWVpPQ1Jk?=
 =?utf-8?B?U2Z4Nkc3czNWbVA1ZlZGQ25rK2lheXo2aEhhQkd5VFQ5cVA2TjlVTitGOHc4?=
 =?utf-8?B?bDYvQ1JyVVdkNjBDdVVBR2lzd1hEQW9vZlVzS09sUXQ0OFQ1NWd0Zz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 357b064f-27bc-41b9-31ce-08df07494c1d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 10:19:10.2464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRZTcwFQejmof/rYjJotN0Z2B/4LKm45LnWWcW6Sf+8Y7XJWcVZaoLlYYNIDYPioo4wzECxxuJOtCDOTwRYiiB0miAxcuouKrQFnzO7CKac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5527
X-purgate-ID: tlsNG-d25034/1788171554-76EDAA5B-189DD076/0/0
X-purgate-type: clean
X-purgate-size: 1376

On 27/08/2026 10:38 am, Sergiy Kibrik wrote:
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 9036e455d6..e4de292533 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -11,3 +11,5 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>  obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> +
> +CFLAGS-y += -I$(srctree)/xsm/flask/include
> diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/device-tree/dom0less-bindings.c
> index 41d72d0d58..bffd2ec65d 100644
> --- a/xen/common/device-tree/dom0less-bindings.c
> +++ b/xen/common/device-tree/dom0less-bindings.c
> @@ -11,6 +11,8 @@
>  #include <public/bootfdt.h>
>  #include <public/domctl.h>
>  
> +#include <security.h>
> +

security.h is a private header for internals of flask.  Requiring the
CFLAGS += -I should have been a hint.

If a suitable public function doesn't exist, then make one rather than
inserting a layering violation.

To this specifically, I'm not sure security_context_to_sid() handing out
SECINITSID_XEN if you happen to call it too early is the wisest
behaviour.  It's current call-chain has an earlier check which I think
excludes this from occurring.

~Andrew

