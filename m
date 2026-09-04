Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C64C624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 18:33:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1409025.1641245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Yj0-00018k-CK; Fri, 04 Sep 2026 18:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409025.1641245; Fri, 04 Sep 2026 18:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Yj0-00018d-9E; Fri, 04 Sep 2026 18:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1409025;
 Fri, 04 Sep 2026 18:33:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x2Yiz-00018T-3U
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 18:33:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Yiy-00FKkv-GB
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 20:33:16 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9b0eea-2eae-0a2a0a5409dd-0a2a450ceb6e-6
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 20:33:16 +0200
Received: from [52.101.53.45]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9b0eeb-f479-0a2a450c0019-3465352d1757-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 20:33:16 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB5727.namprd03.prod.outlook.com (2603:10b6:a03:2af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 18:33:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 18:33:12 +0000
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
 b=UZxujtk+rC0E2sofKI/PTHKInvTe5kA+vdtzcpX9NB/msb93rwuDZirjSgJ4uXPzeUEvWRU6nboRKAmD9ty+49oIjc+JidnJB4x0Ag9Auu+6tH479mgafuCWsHP6KcfJ40HJSWNyHCC/fIxOl28qrT2Qq83Nz9wjDo3s1YXu7GHCqnQbj2SSxynt+qKL4OSzIpXg0Kx4tNMHCNC/hBI84j7MzefIrSr7/7BmxSY81x0O2J71rAVwiUic+vyWrpHZaRLpZJOegxL4Bu3PTghCAy44E7iY3YAE7K4z9SWHEao0UFYFrIPhpP7TuS7vRvfwyBC4dpKc4smhmwxVpLkA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmDU/reGsjLRrkDCK6HZNwyCHUm2mDqS29Pz+lfbx6g=;
 b=SvtjJBb3ZpL7vEx341s+cvhr8t/OMJFQ1mPpyZ4eSyyFIFY8p1DUk2Tq3qFLb+HT7YokITy5VzQORWDb+joXXb2nOiUg9uWjxGs5/NJOGR16w1s+4698UuSBHwVuntxYCG/cYG6jGvTTIWhkMHHsfqUwqDbT9S2JUUdtdqgQVMv0Mosn7SsXVCBl17eQK74aYXahTqun6RH8x/hmTRzV56wMKfVznKsWxGJoySf/Sb7KBCqPryu+9+6QQzFnCqLOh8nHxC1X/iCdTmOpDnMfmMsfbroRjLXmJbtCAvnUNuiPd02kpncF7waWdf94xBCd5Jl9aZeuEhK5048UFOIvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmDU/reGsjLRrkDCK6HZNwyCHUm2mDqS29Pz+lfbx6g=;
 b=XLtAIJar9kQVZsNwpIwcqOy6oaMaqYIJKCV4p6JeP7qEZe+arQBayv/jo9ijh/DM2v3KRFKWZldLDN7VpmHtuN+g5AqnlDA5R4QRW5Yddc2t9/tQs11cbx7a9ZDu/XBsG1xVeZf8eWvljElWGos3CoMVOrldYxwcJNII2luIZB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b7329963-48b6-45c2-9e57-9b6c9229c59d@citrix.com>
Date: Fri, 4 Sep 2026 19:33:08 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/5] xen/rcu: sort includes
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260904171121.65300-1-roger@xenproject.org>
 <20260904171121.65300-3-roger@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260904171121.65300-3-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0493.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ccb57f-1830-47f1-8ba4-08df0ab2f9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7uO2In/8fWtrZDGR4jbGAi06eGnBDZV5VJfac7rResVuumw2EBuLOEH0OOGPnHg9Wnprl6iT20jgMHAItEC/U7iGJ/r9eFxfWpXPLwx5yS6Bt1oW0ZTdZkTSa74uerDI+Xo+0e8XhdzgbgXLRWiP3Um90JKlmokqhAMElVsTEXjehSl1DTZ/ZxeByAYNgK2ny/5wSwh6OGoxm65kfgS8J+/TIsf4mLmV1Jr6S7PtNB92N1XvScWIc95SId1trgHqt/AkrPvquV/ybxUOSLYrJCBZZhXhEfncn2ELTTzEaXKg7bDWmRws2G/4SgXOqixrzFsMUzHsonOiFmCKj459/MbtLQeZV2xa4E8F1lnEMvnqh06fVSdEasWriifF2Fu6ksEXkUn7ECWO6N4JuUK+TLIHeE7uNnz+D/X6Yx/WqqsWP2dClIYog1flQuFSkhZugvvSue6u/5D+yv4ugeMorXVcsWSA1x62Q/eGLLDXi6kLASqX2RQulVXi56J/fKyCCN9IYI9W/HBPVz5figRhxDZLW/evIKPEjuuHSXUVLlBsh/QaXQhI8Yv+8Cu7Mk7sLFBzln9vxW9BCATrEBTkkAEs8gv/Tq/hjiB3KEYS9b+6MDtvgAqLIYZjUP95FDhh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REV2dU94aEg4S0VEMGZiK2dTTkJ6UkFVUDR6Z0NETDV3TEtpUUxLT2d6cXFP?=
 =?utf-8?B?a0plSjg5dnNpVUxidTFmT2ZJblZZQTNIcnVkaTM0ZEsrQzFTQ05QUlZiT21v?=
 =?utf-8?B?WFdzZE1nTVFtQ0Rua2gwc3djVGgvWGlWT3RQRng5T2MxbUd2NnBxUmQ0S2g0?=
 =?utf-8?B?bnI3NFl2Wmw2emdvaHJzUndaMm8wYVlIZTFGVzdFOHJIMmJLWllxZzl6dk5r?=
 =?utf-8?B?K1hEWGErNjYyUTdnZHZ5ZWVTNjZENVlLQnA3dzRwdUlRSThhMkUyaklhS2V0?=
 =?utf-8?B?cGw2NTBjT201czlTZXh6emdiWmlTWlEyTVhnNWdYQ01GeWc1ajRVZ2loSFlP?=
 =?utf-8?B?aWRTaXI2WWpuNkhXUTUzS01zZ1pETmhxTDM4c29rSVJHMldjWU91Sk9BQTc1?=
 =?utf-8?B?bmd6S05ETDhraEJWbXM1cGxGZG5rVTdESC9TTHgrMHRUL3I4eFZVR2ZPOGtp?=
 =?utf-8?B?Z0FCMDlBV0wwZ0ZrTWtqNGlVT1NVMTE3TEhueWdQYjVpYVZRdzFiT3F3allp?=
 =?utf-8?B?NU5vaHQ5YlJkSlNNRERaME1KL2FhUGpBbEF1RFRTdzFBTkpwZWRzRDJDNU1j?=
 =?utf-8?B?UU10TUVKSTBHKzlwWE5YTjRmY2pGNWRwWHpkYTQyeDBoVXF6aDBuazlTWkZW?=
 =?utf-8?B?eUVXOXZkaGhqYXhhR3pJaVczUjgvMjFPTGMrV2JNemRVU1VFTEtac0ZROGJQ?=
 =?utf-8?B?dVBpM1R3dnVFc1FBMzhkNzBtRWpPVWlaTE41Q2VBcnZNOWczTlpiSDQvSG1y?=
 =?utf-8?B?Wm05WDd1NFZyQURCV0xZUkVGdzdZME5hRnNaYnd1UkRpSVN6Y3pmR0Q5ZG84?=
 =?utf-8?B?aUNwZzN6TytCNFFmY2lTRlVITWk0c0RSd25TV3VhSkFCT0dRUktuUExPN1lt?=
 =?utf-8?B?RG1rY3NjSmdqQm9zRU11WU5XaVd3bDNDMW5pdWZ0OUkzVWg1TXA3SFlCRFJM?=
 =?utf-8?B?Q2k4ZUh3czJpUi9vb1BUaGQvWkxib2NuVzVZUXorZ1ZORTc5R1loOEh3U0hD?=
 =?utf-8?B?VC9PZktyeFdSc0NacUlxeEVvdTFlWTdVS2tHVEZscGtWV2dETDhhd1pXZnJ5?=
 =?utf-8?B?QUZzOHhTVmdUaHp5Q2lrVkw1S3ZvV0tUYTJ3Wk9sWXg0T3NRZmI0WjRjL1Vq?=
 =?utf-8?B?Znk2OFJwWDI5SjNJbzkreDNPclJyV1FKOTZBMXJuaFdWVW9oVHdueno5dEpY?=
 =?utf-8?B?eW43KzNtNCtVeUJLSlJwdzFiWmZ1a29XOVJOVk1uem1Kd2x0QjM4TmY0by9J?=
 =?utf-8?B?d3RCVkhIdm0zZU05aXBDTWZJUUpBcktLazdlYTJwM2U1MmVIYk5UeDRoWHBj?=
 =?utf-8?B?Rmh3enk0ZHVMUkZFMkpPSXlFbnI4K2JxUjgyTktuak52Z01WcnhPdklNUlVz?=
 =?utf-8?B?TUxJV3pLZlJyaWZwUzVpZVo1TzR4cE1hT2JyQUR6YUxXZ2prbjNtZ0VSYWp3?=
 =?utf-8?B?a0VsazZjcno1Y1l4emtUK1pVM0NqdW9FWUphT25LT2lTYytVd2NOcWdXQTA2?=
 =?utf-8?B?MWtSTXNYUFVVOUNoVEhxK3ZUSmZuQyswYjZ3OG9vTkJjZGlTVi9peUd6WUhY?=
 =?utf-8?B?NU5PQkVqNjhUK1dCTWpjb00xT2d3NXpuWmM0d2ZzWnY0R2hra2pvdm5Wb3Zj?=
 =?utf-8?B?bWJJNUkzK1F5NXlSVWhKZGR2NHozOTlIR0hITlRHRHFoNHcwVVAxaUV5SDJC?=
 =?utf-8?B?V3VJUzdXTVprR0NGc0ZBdUMwcEJ5STRvbDRZelhNZnhlMUk0bEpxRkc1eEdn?=
 =?utf-8?B?b051dzZPVHRyM1Q1NlA2bDM5YjY5KzVHU3B0RCtVVmNoRlRxMVljamVkb1BY?=
 =?utf-8?B?dzNjWFc0T2FTR1FQL3IvWUlNZ0Z6YTZsZFdlaFJSSVBNeG9qV1VOYnA0NW4y?=
 =?utf-8?B?eUFvdnVIR2Q1L2tvTWMvd3hsNVVZWm8vWmNYL09sTUdPUmpxWXZZVFRDMjNo?=
 =?utf-8?B?cFE4aDEvRFJ3R05hWEIyeWcyLzVybnJjb2tyV0IxQXYwR2hIM1JGUC9jSFBn?=
 =?utf-8?B?SlQ2U0w1THhlWE5yamdtUWYrMEJxbEYralprV1JvTmltYm9MNEZqeTEzTXJt?=
 =?utf-8?B?UUROcXhHNW40cVE3N3hwMGVrZS9CL2pGSE5tVi96dldNaGl3eUoxOTZnK0d2?=
 =?utf-8?B?NGRjMExpRzF3RktTYVBUNmRUSWJUM09sV2luYTVWb1hLaEtwRDBhV0lpbHF4?=
 =?utf-8?B?WjlHQnFHdnZlOUFJdFVDUXF3Z1FRaHcvL1dZQk9lYmxmeHVmVmhReVkyU0ZB?=
 =?utf-8?B?alFQcXFLL09OWk04VmpoWEJrcWRuSXNlTXlCc2Jsdkt1N050WXpFL1JNY0lH?=
 =?utf-8?B?YmhyS09mWlVOOEFBVzVwbWYxRVZKMFRxWVZnaS92SmVMN0thdTZDdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ccb57f-1830-47f1-8ba4-08df0ab2f9fb
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 18:33:12.5744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kw1+ddE9hTLjfCYqUEANQ1UKtFc+gATh1vZTgfSP5WjVx6LAFq1syEUJtEvqtqENSF2Hsqx0ueJ1QX5/r6V4j7gN62WHw2J3jeeihuyjnaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727
X-purgate-ID: tlsNG-d25034/1788546796-018C5A5B-23280E41/0/0
X-purgate-type: clean
X-purgate-size: 1156

On 04/09/2026 6:11 pm, Roger Pau Monne wrote:
> diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
> index 3b96f829c87c..c1b6b2ae768b 100644
> --- a/xen/common/rcupdate.c
> +++ b/xen/common/rcupdate.c
> @@ -31,21 +31,22 @@
>   * For detailed explanation of Read-Copy Update mechanism see -
>   * http://lse.sourceforge.net/locking/rcupdate.html
>   */
> -#include <xen/types.h>
> -#include <xen/kernel.h>
> +#include <xen/bitops.h>
> +#include <xen/cpu.h>
>  #include <xen/init.h>
> +#include <xen/kernel.h>
>  #include <xen/param.h>
> -#include <xen/sections.h>
> -#include <xen/spinlock.h>
> -#include <xen/smp.h>
> +#include <xen/percpu.h>
>  #include <xen/rcupdate.h>
>  #include <xen/sched.h>
> -#include <asm/atomic.h>
> -#include <xen/bitops.h>
> -#include <xen/percpu.h>
> +#include <xen/sections.h>
> +#include <xen/smp.h>
>  #include <xen/softirq.h>
> -#include <xen/cpu.h>
> +#include <xen/spinlock.h>
>  #include <xen/stop_machine.h>
> +#include <xen/types.h>

I'd just drop types.h.  It's really not needed by this point in the list.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

