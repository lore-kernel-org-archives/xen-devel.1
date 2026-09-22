Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AFEC982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:21:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429148.1652080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92JM-0000sY-0n; Tue, 22 Sep 2026 15:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429148.1652080; Tue, 22 Sep 2026 15:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92JL-0000sR-U4; Tue, 22 Sep 2026 15:21:35 +0000
Received: by outflank-mailman (input) for mailman id 1429148;
 Tue, 22 Sep 2026 15:21:35 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x92JK-0000sH-Rd
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:21:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92JJ-00GyPL-SC
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:21:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab29ced-e002-0a2a0a5209dd-0a2a450ce03e-34
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:21:33 +0200
Received: from [40.107.209.18]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ab29cfb-f479-0a2a450c0019-286bd112b9ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:21:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB5992.namprd03.prod.outlook.com (2603:10b6:208:30a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 15:21:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 15:21:30 +0000
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
 b=iD+eqMeUeRMYVXOqvGEcrD9UimyvpCQ39HB17t72w0LUxy3j1uuiI72DD76v1DKYRe5zGInyROwQpHvViROUMFml8P7TKV36utmgf1QcAQQKKrEdtDIqsqqMbzYNq5N++jGhWbb+Wn3hp341sxY8+GI3OYASLNSs+HHzMe9ypWgzf21sf+P87KTYoWjAd3LjmsDtX33QffR6q0Pwtqgm4ChDyk0k7zWFVKoXwigPNFzQda1llstXJ0pHSM+vaj3K3lUWwYpjmDN/VU3wDxZRSOO47I/XHuEXaizJ4VCILNonyW1AC2/SBd0QiPjU/6HVCks5NKXuDLUdlE7eSCMOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEI/kIIOd6UTcjRAbecf/3Wfz1WNDPukW79dqipR1yQ=;
 b=zEl9RhiSh8B6jJU65h4/2f8Ot7SEGSbH/o0k7fhBGWacSPU+BA7H2cp/oZpnsJsvJK+QehoyXtlacDAAitEdjiTV7DdW5eHpHT1OGkhGMmt1/IGhtFJTO3oT81q+2DEbKpcLw8BoAmMMteYWrh7I89jhJsDkI3K+FYuQnjAtnB/fwkLqo0LBQED/mQkjfbC5WUV18DtGTZVF6S997t80Oo/J4Nq8wY7J0vAS/dZUkVJBLO9M5KXivAfOddRPiPguJigklTaEivcAPmsIeOdToKoNsfBB+j/ILUcCqJqvKy09fOsXbvLvgtONScCWLPlPASzs4gzvG0eAQFr1PPGEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEI/kIIOd6UTcjRAbecf/3Wfz1WNDPukW79dqipR1yQ=;
 b=Gx7ADZ3DJXZR6gAWNPkoDubm9ZbpiltYQ0Gqmikmdbwp3XYNJrhhcFRXwfYQ47RprCBObPgPzTrUkAqLkZg3NanGK2Swr81/0wxhMAr+jyMDJSKZxiFu4f1d6+8Qri6VNzrnv/LTHM5uiJaM2NQCArUoGP/cErH02QlpkunmVlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <290d1ac5-a9b8-4576-9e9e-2b44d377a76a@citrix.com>
Date: Tue, 22 Sep 2026 16:21:25 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 04/14] x86: restrict PHYSDEVOP_* when PV=n
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
 <664d2a63-2745-4c33-9748-283aefce2433@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <664d2a63-2745-4c33-9748-283aefce2433@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::45) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6a05a6-fd86-4164-f559-08df18bd2d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gmx9byPQOysiQJWUO5wVZm3kLvgP/kfuw8UMBXRBoOulp+TTu/ulUQV670JNzgpM4T+j5eviJJkAZQhCMA5R6/hdCIhix5bzOp8PYHTTKtVcXGXxwrUARDkFQDVpenftEulxQZ8qRW5GCXga2yMVdGQSZoAbtU05WPu7xlDpVABv/9GDFzPxFcZXoOUJL/K2MYl7j2D1I2zckq/bLkJe2bryNxSdDafvB30aCo21YcQVqBQxY/8KoFJFYf+eNmIPnejZ9EJiIloGiaBamJthxe7LyBfA9IOedNdUk1OSkSOiZXeHKulkwnKQJT6weivB357y9zzbQpUDy9I2UH8wGy8ToPkJ2UJy/sDhwhks9DZD0q/YBs0+EuQAeHBIMERbn+HfRtZmRV3JVvpPe/5+Ny5mPMgLXL//9mrDcVNvk1JyHwEqVX4FDGGYyEpGts/4zFqbfiRU3XMe1nriSQVnaaOelGYnMbk7MffcWkpnbpz3yakzIYT1SQvqbl8rder+MNaGCXiYh541BQRT6sw72KEUjoCwA+DhC1dGyvz69YNkGjU/EAFy0UahFH3YfbXJwlpJazQRH8mfwta7iMIdR5fWTBPQcZUpU1eyRf6DYHRIzld1cvYVbiEERejbOE85WLTgMAiYHtnowLgSu79nyB1B6NUbwY/OClt1wrT4lJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUNrS0RGQkxFZVJyTjBEemViZ01KVFRpbC93YzdaRUVZa3EvNjM5cFBDcVJj?=
 =?utf-8?B?bktSMkFOU1lCdnZmZ3A2R2VILzlTc2pqSVdMdTdDRzZVekFjOVpEcFZoYTlS?=
 =?utf-8?B?M1Z5UzNRd0VIa1V6MG14WlluYlJGNWhUVW9aNERVWFk3cHJBeUhCUnpSYTZk?=
 =?utf-8?B?UlAzUUZFYjBYcCtHaGh6dGYwYnUxYTd5UTdlL1cyRTNCSHhQaEpvR3paSDZ4?=
 =?utf-8?B?bEFzRzIwV05iWFkzVU9IMTFqb2Flc2FlMUlSR2JWYnlZWlpVbU1BMEhFSnZs?=
 =?utf-8?B?N0x1L1FMbW9TTFZlSSt1QmtQb3lhdlVGZUVHRmJna0MwK0xjM2J4R0czZWtT?=
 =?utf-8?B?QUNWQlltSVg5ZFlVZFY1N3dZR1RLOXd3UXoxWmhPS0kyUXZpTUhRMVMwNHhM?=
 =?utf-8?B?ZFpSa1YzbUhwcGlJS3dDKytkN0hzdmZJSzkwNld5aFQrNXVXUktzc3I3NThn?=
 =?utf-8?B?aGpIM1YycWRDR2NKb3lpTnB3UTFidFJVVk15czRhUVNVM3NxZ3JaQ1NUUXRL?=
 =?utf-8?B?SnBLZ2tWTkFYS1BoaWdoQkZLZWhaekpVWjFFakNlRDdEN291Q3lqTWhzenpo?=
 =?utf-8?B?TEpKSEd3SGxZRzQrMmYyQzFvOWVhWXdIZFdNam8zT1RPY21UWEFQMTlURkdu?=
 =?utf-8?B?NUlBR29vU3dLTDdjaFJJY2ZhNnZ1WlRUdE5Xd0dOelNoSnVtckozY3BnamUx?=
 =?utf-8?B?UUkyWmU2RDlzTkZ1OVYvRFpFb0VIeC92Z00rdi9MR1JsUjdtdUQ0dUdjdEhm?=
 =?utf-8?B?Zkl5RG5JeDFZdlNKdHFnUU1xY0FQNjVPNDF4bUVPY3VkRkpTY2FxenhoblVu?=
 =?utf-8?B?TlRBcDJFa1lkMGFvUHdJWEFsNlM4TnN6V0Q0T2MwdVFtcXZiSm91eG8rSk14?=
 =?utf-8?B?VUtoaGVDcy9ZWmxadW9Pa0w3VG9POHIvWjN6cFBONHNVWGxTdTQ2ZzRBNlBE?=
 =?utf-8?B?ZXdtYmp3QmxqOWVRRDdNNGthZ0dma0JYSU12WUY5U1VERWdka3hOaFdTZGda?=
 =?utf-8?B?WlRtVlcrNGdnYXZwbDllMngxdG94em83dmtlQXM2OENJZG5yU3p3WDEvUjNP?=
 =?utf-8?B?VDl0S2poYThKQkwwNWlaUFBzOFAwQ2hGWVU5bzFSTStlK0Q0NTFCeVFmV1JE?=
 =?utf-8?B?N01wNElRQkgwOWQ1RHdLNGdBbjBiU2VTZVBiMjNHM3V0dHdCZ1NSbnZHWWc2?=
 =?utf-8?B?QSszMVVBdFhDQmZLOUNSem5malVZRVpmSVNBcC9QOVh1TVgvU2JKT3VkRnVr?=
 =?utf-8?B?elRKUU1kckVuRlRvMGs5dCtINVpVVXA5NjF3RHJZbnNKMFVBaWorcXIxelVP?=
 =?utf-8?B?STA5NEF0ejNlZ3J5UE5jekN1R0dQZ2ovTDZjVS9iMHQ4Nk14d0RBMWM1M0p5?=
 =?utf-8?B?MzlUWkVicUpiNzJwRUt2R3B1VW1GQTBpN2dRSU9vdFBYL1Fjc3ZIMW85T1k5?=
 =?utf-8?B?ZFNvU0hzRDBhR2R4R2h6NktCajVWZStWR20xWDJHa2JXS2Jac2VtR0NjcVpP?=
 =?utf-8?B?RDExL1JlL0plcW1jSzBTbkZIVDhONnZ3Q3JEM0YrZXp6RXpudHFGTmI2Ty94?=
 =?utf-8?B?VGxOcUY3dVJYS2h5N3lsaThJUkRFZ25pUEVIaHdLcTRpTklrNkovRld6cFFk?=
 =?utf-8?B?T0FwQXo5ZnBRejNiUzdxM01CV2tyMWY2ZHR5KzJjR1VWeW5ad3JMUXVibXBC?=
 =?utf-8?B?NUdnY0F2RlhyZVhtNHYvWnNES1dXM3NPSHBCOHRyejJvL3dlcmZNckNIUktw?=
 =?utf-8?B?cFpSRXhBSjNjR24zVEJ6cFJXOFZaTlZORW5wdFRyYUdhZFZpRElnUElYVHBN?=
 =?utf-8?B?NFByWjZmMG15SnVua1VQeGRlQ1NpcldxSFpoTEhsZzFsQklLcDd0Mk1Fc1Fu?=
 =?utf-8?B?M1VDN1RKTGE2OG1hTnNrakJZKzM0YXBtYkJkOUdXYzBlRUN0VHRxNU45Z1F2?=
 =?utf-8?B?SHBNMFEyc0dCUzVpL0RWWGIzZ3BmZmt2aUI4VnZZRk43TkpTcHRja1I1blhK?=
 =?utf-8?B?UHlzK2wxQkN5YXk0TEgvT1FTRFpYbWN4anBLbWpYMS9YcUtFM1ZsbE9wak5t?=
 =?utf-8?B?RTVQZ2lnVnNGOHU3cDJ0TnNOV2pYMkppSmdWbUw3enpSaHRwRmdGUDM2MGsx?=
 =?utf-8?B?WTRYTzZxdXFmdTZXZ0RZQWl2U3JHSkFOV1dwei9BSEYrcW84Zm5qQUhsYzJT?=
 =?utf-8?B?TFlaSG92cGxVSmdIL0c5VzRQekRGNjlMZXYrU1lLVTBNTHYrZjRWVFFnc2Yr?=
 =?utf-8?B?YUpnMWRjM2p1QnZNelNsaE9JYkQvTjh4cHZuZjMxQWwycVNSWFJEZ0xqc3J4?=
 =?utf-8?B?aVBoWGJSU1dzRnAwVkYzM0Q3QnFhcXV1NGpndXJrTSt4ZjNBQUR3dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6a05a6-fd86-4164-f559-08df18bd2d60
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:21:30.0090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQMB5musMl+7XyW738dHryLfyJQ8UijEbMTjMzXKuIl5CLy3Lte1IUgMMmUHhuvGVz2DAM2Jbxuk9dvE4KdhwZ2Ra+qLB846pLcGqf9yrSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5992
X-purgate-ID: tlsNG-d25034/1790090493-51B35A5B-4E28AF6B/0/0
X-purgate-type: clean
X-purgate-size: 484

On 17/08/2026 9:52 am, Jan Beulich wrote:
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -233,6 +233,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>          break;
>      }
>  
> +#ifdef CONFIG_PV

I think this needs to have /* See hvm_physdev_op(). */

Most of these ops are not inherently PV; they're only PV because we've
not cared to expose them to HVM guests, and that's a different meaning
to what CONFIG_PV normally means in code.

~Andrew

