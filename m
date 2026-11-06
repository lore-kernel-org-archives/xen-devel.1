Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93E606A330
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=F07E3NCy
Received: from list by lists.xenproject.org with outflank-mailman.1476710.1682695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLR3-00007p-TY; Fri, 06 Nov 2026 15:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1476710.1682695; Fri, 06 Nov 2026 15:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPLR3-00007i-Ot; Fri, 06 Nov 2026 15:00:57 +0000
Received: by outflank-mailman (input) for mailman id 1476710;
 Fri, 06 Nov 2026 15:00:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xPLR2-00007a-2O
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 15:00:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPLR1-003w4J-Di
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 16:00:55 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aedeb9b-bab6-0a2a0a5309dd-0a2a450b9a9a-40
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 16:00:55 +0100
Received: from [40.107.209.65]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6aedeba5-b7e8-0a2a450b0019-286bd141c66a-3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2026 16:00:55 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH3PR03MB965729.namprd03.prod.outlook.com (2603:10b6:610:39e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 15:00:51 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 15:00:51 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPqtu4x9L7rWaGCl+VeldGC/cncUKAjEkiGewqP65Hsy39eyj66hLlXmVTDTYRlcKzioEhSbO4o8v33xV4FKWMD3lSXwfbrZueO02X8KxwaS8vcJraj+9SinvafJCxTGCEfmYspsDDVPNtwVH5BUubwPgZD5CNOqDHNNQizBcGyUjkscTB9xLaT0e2lTTIFWM6s2UX7Z7TH+WTg8QMxZJebsYYNY1Sy4C8vJskuCImByHEkouVMsgx9bPBBIzef1Yh8vMx9GDw1owplX0LH83eeQf5IloF6edp/wkX93gBD72tUwkbToo4UCegNk6LP1wtXFoSPHxvjmfrnfKItr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ujMVwmoPIMqHU3izph4uPFOL+L+KDgKZi9rxOQqbFA=;
 b=au1OAs2WM3e/FPrNJkrEmZa/NgnBZyGNK2333kZqSi/i92HBHKzM6FIyIpOmHlSLgws/SLRe43dO2XfIIa4AT1qmmPKBWm60pTGXgkmCRSLZKbpPFzt0x2b2BKyAhdvNz1mzWApHk+df+apUI5uu7XuNeQWhawbA1B85u1oCXoaOyvLBtId6b5Ighh/aUeN4SiPL+ke5QEq7+UUxVOu0jTv3avoiHIjN0E9c+ukdwEqGu8Lrczx2I+z1IKCJ1C+0A0FZKF+OvnRIwHvOJYWemFLIczbyT7K/h2Vz7c8oz4QRJLIxaaGKx1YRj3qS1BN6VHyFvKZQ2BQz7jXcUxvnvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ujMVwmoPIMqHU3izph4uPFOL+L+KDgKZi9rxOQqbFA=;
 b=F07E3NCytIVmtTWyObfDApwHSsydMRHLoeh16W9GDj+1QXSX1Yh681ZYl8QG0N9NZhBntrkF0izR+S2Bf/FuNhbm2LT436+CUMLMjysj1A/59ZU/K8fCZtIzjhl3sfw8vorSwV1MLRXxRlZkcYyn4r0052RKRWoGLvivZrh5rCc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4dff2308-da70-493c-992f-717a8517db46@citrix.com>
Date: Fri, 6 Nov 2026 15:00:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/28] x86/hvm: avic: add VMCB state initialization
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-8-dmukhin@ford.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261105013347.719392-8-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::10) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH3PR03MB965729:EE_
X-MS-Office365-Filtering-Correlation-Id: b970b090-e719-4ed3-206b-08df3c16bfdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|10067099003|4143699003|11063799006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	ESSK4sdCB8LJCbi+qkvxIWVUP98/Pk11uy1Wj6c9pcjmNLXRwxJ9opzgvKCRx7X8ekVWDkNWGCcFY+Qw3nFQZwT86Q9eKt7C3musqBJ/8sYUflsALpyszRC6hRKcoXkLihkSuM10X0d0JD6JRqtzIJ5yswJeeSp0ePakhCVu9vZCNmzoIVjgiYL3m9QA9MEaKucdyomqkpUm7eaHurP/4DkXZ1KIBMj5QnCN4aNxp57dnKrIglkDyz+xQEwAyxVyznNND/zQW416fbjZ4jLFLts28/5kSPkmJr0fNHWFNy9WoqIznprBVOkEdA7Z4s8zQB7rgK4dU9RrxxnJPJtjHXlU563GZtYWEcSpqa1SlFtbV0+L/QPzSz4ulzdnXUWp0ELdL6QDrrOM9pyrpP/jycAot33vHS1SKR5uWCvPOhfh/vWByUGQ8vuTX+F+AnraFAff8XCA4QwJoIRe7M/3cMUTMgAozmf656E8cda2VRWjsh1Tatuhru2P3teOy7KJG3Fzkr7im9D9ociU9QleX9WfWnMk47jwgtpv8+iR4K4JYHc1S8nTFylDHpJnAyPkzWApp61yBs8b8PWUAz5YAYY0E3t8q21YiJbicVA1dpQ/jUcx8p0bYIfWRhaXbm25RG7hbJhszs61ZW8HE6ruMqEVgO/PZIvq7p6fT42/P+8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(4143699003)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTJMTlBSN1FMUk1JRE14cjJjck9PSUxUZjYyT2dmVndKS0dMSWFNSG9KV2xX?=
 =?utf-8?B?NjFZZ0dNTjNzTjAzRTZEcUhWYkpUMk5zUENqWS9aVTlxQnc4YXdBdHpONys3?=
 =?utf-8?B?TDU3SnByZ3FsZzJEb2JsZzlPM1UxS1BQMVdRWGw1QXA2eGJBRVlkQjNKQ3hq?=
 =?utf-8?B?SXhIL3EweTdEOTY0WGk3MHk2N0E0ZG91Z0RUSm96TlZkTVFMSFQwYXFsdjdx?=
 =?utf-8?B?Nk5TZEFxaURNUmUydUl2S20yKzJ3Ukx2TG1pQUJnQjFJM01SQnJWeFM5USsr?=
 =?utf-8?B?aEtNRUR1VkJvQmdIN3pocHZ3cGhSMmMwOU1zRFFBV1hxMzZYQmtLdmRBaWsv?=
 =?utf-8?B?dU1rOTg1SmVISmRzc01YYjlXcWQ4V3dvNUZZcWJjYjVmaGUwc1k1RHVNalJr?=
 =?utf-8?B?QklESDBaODRBeU1ieDhSNkJ4NlA4Y2VabWJDMTlQNEFMU3dlUVhPaW45TnpG?=
 =?utf-8?B?bGlKTXBycFRNbGg3NWt3bE13akxMSjlhWUxIVDRxSVJYQnNETE0yUitiVFMr?=
 =?utf-8?B?OGhXR0pXdDlwd1NSdHNyVGo4bjJ0UVNxQmd1NUpYenZWdFJYQ3VNRThMdTNH?=
 =?utf-8?B?M1BkUEJqZ09qcmpMclFOZWdvQUFPdkZ0OWh2c254a0gybmVmai9yUDBOTEhT?=
 =?utf-8?B?NmhycmJvNkpGR2JtWHRlQnU2cVVwd0tESXhRTWdiTkl4OHdyK2xCWXYrSWo0?=
 =?utf-8?B?QUdybnJiYWNIYjdVc0Q0Z240TjJicnZRcGhNbGJZblh5RUZhMmk3RTFnYTI2?=
 =?utf-8?B?UjhJUGxNbVJROGZuRmtjNTZ4ejdpTDNDZnlYWWQ3cjF2cVF6TUJlc21xS3NN?=
 =?utf-8?B?Y3dxRS8yRkVRS2puYWNoeHp2MUl5aWh2Nk1pbjQzMjI1NzFMNXVSYnRpTk9S?=
 =?utf-8?B?Nm1qYWFoV1RVa3V6blpZUkpzVkwzQ3NvTTBWTXNTZ3RMVnBmVnNPRmNGL2xZ?=
 =?utf-8?B?YmhaK0ZsODVLbVM0TkVYNmFMRlA4UHFKamJSQUJmKzRmR0hwOXlhTHhFOUlo?=
 =?utf-8?B?MU4vOFdFNkNmWndVOGJGTmJERVovVWZjWWNmZTAvYzM1ZGdYaDY4NkROMUMy?=
 =?utf-8?B?RjA5eUFEUU4xRlNuVTBhc0UyYW9USHpRSlVURzhRM0JVakt5QjVKT3B0bHpj?=
 =?utf-8?B?Mm1aY0NianB0aERmSVhlYTdiNUxNejQ4Mm13NkxQeVBwa0cyV0lWdkZqTmVs?=
 =?utf-8?B?TnA0N1J4TWtSbkRlOXFDWERYSEJSZkV5YnBvUk9SWXRCZHNTeENZZGFzWUs5?=
 =?utf-8?B?SG5JanlETGdPOUk4bnViRzRBaklRMENkR0dLNG45bUdxZW9xcGRla2d6OTlT?=
 =?utf-8?B?UXVVVU5YalJVdGVWWEw1UnZ5dFRzTjlPUFF2dTNEa2ZRUU16M1RmZTRPaUYy?=
 =?utf-8?B?dTNxbkF6cVdQUlBwNGNnNnFjbU1IN1cwczVraGtYb0JGYUpyeG5rRmlBUDJ5?=
 =?utf-8?B?bVQwUHJpZThveWFrMkY3QU1YOHpQTzNPQ3NDdE52ZVl2NXB6a0Vxa2kxdWFX?=
 =?utf-8?B?c0c3WWRNNnlsaUsyaFdtamo5dGRmdkVlb0Nyb0FaV0YyeTZJeENGNlF3NDBM?=
 =?utf-8?B?c3hqTDhMSzU3MnNqblU3UFluejczWlAvemFWZHB6dzNzVmQ0VDZmWFJodlhK?=
 =?utf-8?B?cUtveXh6N1MzYVlLdDNWMEgrRmFBZVorVEI2Ry84TmFxQXhtK1prN0UrWjl0?=
 =?utf-8?B?OHZkZmNsNSt4dk9JNWsrV2FuMGdkcTZtQ2YyOTUxRU0zK1FYQU53WXNkYnB6?=
 =?utf-8?B?WHJaWWttNCtSdGwvOVg2N3ZMaEw0YXYrMEt6REtXdHB4ZlJaZ2JWZG1tdzlX?=
 =?utf-8?B?a2hNYS8vVXhQRFk1Rk1wc29wQi9yTjc0ZDFoZUFqWGcwYUtyT1hNeWxETGt6?=
 =?utf-8?B?eVZqaW02MGxTSlhtOTQ2RG11ZjdyMW0vNWdjNldmMUc5dmRTdUVUdk1XWVFR?=
 =?utf-8?B?M0xBTVQrTHNQZGtIY0g0RFdza1U1VXZoNHdpbjBnQ2FyMEo5Qml0c2pDaENp?=
 =?utf-8?B?Rjk3bWNnSmpDWEtIMkNSRjRNZFBUdU5hNS8rcXIvZjF3bkhTS0cxR243dVNZ?=
 =?utf-8?B?SjBjclFQNUZHUEF6WkFyeVZqOVk3S0VXeGdoM05LV2d1ZXM3ZkExb210UzB3?=
 =?utf-8?B?c0F0WEJCT3RVWWhDMDdWaGE3K2hsK0ZTMHNIQnFrQ3RkeUxORU5SN3lhRWpw?=
 =?utf-8?B?VWdHOUtDR00vdVlIUTJTdlk4eEh4enFBZkNjYkk0YXNYRTBSaVBLbXBjNU9C?=
 =?utf-8?B?RW90ckpYbGpUbjAwREFaL2JJbjdvSUZoRVZLdWc2UERQSXdUK1VvM25PNkZ3?=
 =?utf-8?B?eUFTaUQ5U0IxakpBdHBrQksvcVBNNzU1bmFaSzB4bWdmc1dzM2xMdGYvWVB6?=
 =?utf-8?Q?03ZExM9nMu4EZbu8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b970b090-e719-4ed3-206b-08df3c16bfdd
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:00:51.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFE82cPB60KqHlNJW7DPxlLrEBqaWUPAIipMymOl7+j1fC3bs3qkvKrSuA4LXSGjV6g5tk5J1SOQLiWcmf+yviZhFDjv3HF6fZdzNUGZyh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB965729
X-purgate-ID: tlsNG-42698a/1793977255-A82F49EA-54B5E1A0/0/0
X-purgate-type: clean
X-purgate-size: 9053
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 1:33 AM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Update SVM VMCB with AVIC-related data types as per [1].
> 
> Install AVIC backing page and logical/physical APIC ID tables mappings
> into VMCB.
> 
> Set VMCB 'avic_enable' bit to 1 in case of successful initialization.
> 
> [1] AMD APM Volumes 1-5 "15.29 Advanced Virtual Interrupt Controller".
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/hvm/svm/avic.c | 110 ++++++++++++++++++++++++++++++++++++
>   xen/arch/x86/hvm/svm/avic.h |   3 +
>   xen/arch/x86/hvm/svm/vmcb.c |   7 +++
>   xen/arch/x86/hvm/svm/vmcb.h |  19 +++++--
>   4 files changed, 135 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
> index 2c0e113ae34e..bc98661a7057 100644
> --- a/xen/arch/x86/hvm/svm/avic.c
> +++ b/xen/arch/x86/hvm/svm/avic.c
> @@ -9,6 +9,16 @@
>   #include <xen/param.h>
>   
>   #include "avic.h"
> +#include "vmcb.h"
> +
> +#define AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK        GENMASK_ULL(51, 12U)
> +#define AVIC_PHYSICAL_ID_TABLE_SIZE_MASK                (0xFFULL)
> +
> +/*
> + * For AVIC, the max index allowed for physical APIC ID table is 0xfe (254), as
> + * 0xff is a broadcast to all CPUs, i.e. can't be targeted individually.
> + */
> +#define AVIC_MAX_PHYSICAL_ID                            (0xFEU)
>   
>   bool __read_mostly svm_avic_enable;
>   
> @@ -125,6 +135,106 @@ void svm_avic_domain_relinquish_resources(struct domain *d)
>       }
>   }
>   
> +static bool avic_vcpu_supported(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    unsigned int id;
> +
> +    if ( !svm_avic_enable || !has_vlapic(d) )
> +        return false;
> +
> +    if ( d->max_vcpus * 2 >= AVIC_PHYSICAL_ID_TABLE_SIZE_MASK )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pv: AVIC: unsupported domain max_vcpus %u\n",
> +                v, d->max_vcpus);
> +        return false;
> +    }
> +
> +    id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
> +    if ( id > AVIC_MAX_PHYSICAL_ID )
> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pv: AVIC: unsupported APIC ID %u\n",
> +                v, id);
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +static void avic_vcpu_enable(const struct vcpu *v, bool enable)
> +{
> +    const struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    struct vmcb_struct *vmcb = sv->vmcb;
> +
> +    vmcb->_vintr.fields.x2avic_enable = 0;
> +    vmcb->_vintr.fields.avic_enable = enable;
> +    vmcb->cleanbits.avic = 0;
> +
> +    printk(XENLOG_INFO
> +           "%pv: AVIC: %s: apic_id=%#x avic_physical_id=%#"PRIx64" max_vcpus=%u\n",
> +           v,
> +           enable ? "enable" : "disable",
> +           GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID)),
> +           sv->avic_physical_id ? ACCESS_ONCE(*sv->avic_physical_id) :
> +                                  0xDEADDEADUL,
> +           v->domain->max_vcpus);
> +}
> +
> +int svm_avic_vmcb_create(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    struct svm_domain *sd = &d->arch.hvm.svm;
> +    struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    struct vmcb_struct *vmcb = sv->vmcb;
> +    const struct vlapic *vlapic = vcpu_vlapic(v);
> +    mfn_t mfn;
> +    uint64_t entry;
> +    unsigned int id;
> +
> +    if ( !avic_vcpu_supported(v) )
> +        return 0;
> +
> +    vmcb->avic_vapic_bar = APIC_DEFAULT_PHYS_BASE;
> +    vmcb->avic_backing_page = page_to_maddr(vlapic->regs_page);
> +
> +    mfn = domain_page_map_to_mfn(sd->avic_logical_id_table);
> +    vmcb->avic_logical_id_table = mfn_to_maddr(mfn);
> +
> +    mfn = domain_page_map_to_mfn(sd->avic_physical_id_table);
> +    vmcb->avic_physical_id_table = mfn_to_maddr(mfn);
> +    vmcb->avic_physical_id_table |= (d->max_vcpus * 2) &
> +                                    AVIC_PHYSICAL_ID_TABLE_SIZE_MASK;
> +
> +    id = GET_xAPIC_ID(vlapic_reg_read(v, APIC_ID));
> +
> +    sv->avic_physical_id = &sd->avic_physical_id_table[id];
> +
> +    entry = vmcb->avic_backing_page & AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK;
> +    entry |= AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
> +
> +    ACCESS_ONCE(*sv->avic_physical_id) = entry;
> +
> +    avic_vcpu_enable(v, true);
> +
> +    return 0;
> +}
> +
> +void svm_avic_vmcb_destroy(struct vcpu *v)
> +{
> +    struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    struct vmcb_struct *vmcb = sv->vmcb;
> +
> +    if ( svm_avic_vcpu_enabled(v) )
> +        avic_vcpu_enable(v, false);
> +
> +    vmcb->avic_physical_id_table = 0;
> +    vmcb->avic_logical_id_table = 0;
> +    vmcb->avic_backing_page = 0;
> +    vmcb->avic_vapic_bar = 0;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
> index 3da62f59b0cf..1084ae683944 100644
> --- a/xen/arch/x86/hvm/svm/avic.h
> +++ b/xen/arch/x86/hvm/svm/avic.h
> @@ -11,4 +11,7 @@ extern bool svm_avic_enable;
>   int svm_avic_domain_initialise(struct domain *d);
>   void svm_avic_domain_relinquish_resources(struct domain *d);
>   
> +int svm_avic_vmcb_create(struct vcpu *v);
> +void svm_avic_vmcb_destroy(struct vcpu *v);
> +
>   #endif /* __SVM_AVIC_H__ */
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index 3ec5bdddf588..c4282bfd6c6e 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -20,6 +20,7 @@
>   #include <asm/p2m.h>
>   #include <asm/spec_ctrl.h>
>   
> +#include "avic.h"
>   #include "svm.h"
>   #include "vmcb.h"
>   
> @@ -215,6 +216,10 @@ int svm_create_vmcb(struct vcpu *v)
>       if ( rc )
>           return rc;
>   
> +    rc = svm_avic_vmcb_create(v);
> +    if ( rc )
> +        return rc;
> +
>       paddr = virt_to_maddr(nv->nv_n1vmcx);
>       nv->nv_n1vmcx_pa = paddr;
>       svm->vmcb_pa = paddr;
> @@ -227,6 +232,8 @@ void svm_destroy_vmcb(struct vcpu *v)
>       struct nestedvcpu *nv = &vcpu_nestedhvm(v);
>       struct svm_vcpu *svm = &v->arch.hvm.svm;
>   
> +    svm_avic_vmcb_destroy(v);
> +
>       if ( nv->nv_n1vmcx != NULL )
>           free_vmcb(nv->nv_n1vmcx);
>   
> diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
> index 8b351679fac5..1ee5da053a9a 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -346,7 +346,9 @@ typedef union
>           u64 intr_masking: 1;
>           u64 vgif_enable:  1;
>           u64 vnmi_enable:  1;
> -        u64 :             5;
> +        u64 rsvd2:        3;
> +        u64 x2avic_enable:1;
> +        u64 avic_enable:  1;  /* bit 31 */
>           u64 vector:       8;
>           u64 rsvd3:       24;
>       } fields;
> @@ -362,6 +364,10 @@ typedef union
>       uint64_t raw;
>   } virt_ext_t;
>   
> +/*
> + * AMD64 Achitecture's Programmer's Manual, Volume 2
> + * 15.15.3 VMCB Clean Field
> + */
>   typedef union
>   {
>       struct {
> @@ -377,7 +383,7 @@ typedef union
>           bool seg:1;        /* 8:  cs, ds, es, ss, cpl */
>           bool cr2:1;        /* 9:  cr2 */
>           bool lbr:1;        /* 10: debugctlmsr, last{branch,int}{to,from}ip */
> -        bool :1;
> +        bool avic:1;       /* 11: AVIC */
>           bool cet:1;        /* 12: msr_s_set, ssp, msr_isst */
>       };
>       uint32_t raw;
> @@ -469,7 +475,8 @@ struct vmcb_struct {
>           };
>           uint64_t _np_ctrl;
>       };
> -    uint64_t res08[2];
> +    uint64_t avic_vapic_bar;    /* offset 0x98 */
> +    uint64_t res08;             /* offset 0xA0 */
>       intinfo_t event_inj;        /* offset 0xA8 */
>       uint64_t _h_cr3;            /* offset 0xB0 - cleanbit 4 */
>       virt_ext_t virt_ext;        /* offset 0xB8 */
> @@ -478,7 +485,11 @@ struct vmcb_struct {
>       uint64_t nextrip;           /* offset 0xC8 */
>       uint8_t  guest_ins_len;     /* offset 0xD0 */
>       uint8_t  guest_ins[15];     /* offset 0xD1 */
> -    uint64_t res10a[8];         /* offset 0xE0 */
> +    uint64_t avic_backing_page;      /* offset 0xE0 */
> +    uint64_t res09a;                 /* offset 0xE8 */
> +    uint64_t avic_logical_id_table;  /* offset 0xF0 */
> +    uint64_t avic_physical_id_table; /* offset 0xF8 */
> +    uint64_t res10a[4];         /* offset 0x100 pad to save area */
>       uint16_t bus_lock_count;    /* offset 0x120 */
>       uint16_t res10b[3];         /* offset 0x122 */
>       uint64_t res10c[91];        /* offset 0x128 pad to save area */

The avic cleanbit is defined above but then you don't actually make use
of it.  The fields to which the cleanbit applies should be marked and
have accessors defined.

In principle, it shouldn't make a difference since AFAICT these fields
are only written during VMCB creation when all the cleanbits are cleared
anyway but it makes sense for consistency.

Ross

