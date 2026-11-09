Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC57606A332
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 14:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ngOHmrcQ
Received: from list by lists.xenproject.org with outflank-mailman.1480150.1684114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQ20-0001d3-B9; Mon, 09 Nov 2026 14:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480150.1684114; Mon, 09 Nov 2026 14:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQ20-0001cu-7z; Mon, 09 Nov 2026 14:07:32 +0000
Received: by outflank-mailman (input) for mailman id 1480150;
 Mon, 09 Nov 2026 14:07:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xQQ1y-0001cd-MC
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:07:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQ1x-0032f6-KD
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:07:29 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af1d39a-e002-0a2a0a5209dd-0a2a450195ee-30
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:07:29 +0100
Received: from [52.101.48.24]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af1d39f-5984-0a2a45010019-34653018aad8-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 15:07:29 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DSVPR03MB989290.namprd03.prod.outlook.com (2603:10b6:8:3ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 14:07:26 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 14:07:25 +0000
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
 b=NjM4imooFNUHTc7hAbVppf9LFz3KlmGT4n8EzFQIhm1rVFaAQoxihTntLOkhiYW1hxapG9IDyZQpFsn18NHIUDESsd0jJ27qJwxwoG47HHGX3wuDhxF1NJGggMhiPWrXP6eW39f72J3GM+cxhd/kgfMJWNREJCGSSCWKN6gqaDgQK3U/DDgPYhxkCOQsQb/7YVeLKy6e+zyAXG8SAyxwYPGzlSQFKiUQLh6f8NnDN1su7u3IwMjzeczDnguEVfJd0N+BQi7fu2td6aLWf1zksJBWY4YgI06rfQ2+UEuFAacytlp6KK3u+d3IsuNgQW5xAW1VRMu/8JUq2cB9VQmuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ge5LluQn6Pgo3xDEJjLrpqHmBt/nmKHzFMO9QBaIf5s=;
 b=rY4+9J+ZvadG2YlgDOj6/yN24X6UB2Q8SUVFEnpsHo0R9aFH+VLSLYm6lk3fyTj/7FC86EzzV0s92sYp0kyjrC+gOxW7cgt6v6Lnv41XT7KGqPVjG70GHsWk1VWSvGOhC35ayDH7sKV3CSprK3MdEyZpWVsyYpDep47XuYIaPoDq8QjHmcn7f9OqCXQE8uA1M37zhNvN0abSNgPQpCRa9xWsXPdiO2z7KjvwBapMXUl8n2l7+5uUPMPhe6LGBvS+vpae4L6wLMhSa0nblAnlA5KEiwNbjEf2NA8edbpdvEyVFbNwv6q4uLXwfaUo1xwybvBqAVFv7RDheN8y9BDiBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ge5LluQn6Pgo3xDEJjLrpqHmBt/nmKHzFMO9QBaIf5s=;
 b=ngOHmrcQuvNAl150nAGyNyoSK5QdHCah0sE8pgw4XjCb06yY/JdfoICXMdmSMlSHpnoEWOFE3aeTqfNmrxVFDrz1oykiLB59vFIGcAlCKOyrvIRndyF4XgdfWreLap/ow4bn0GIpi/x5Z4HxohSWQAT1XCg0YuhHkvRFjf89LQo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2341fc44-3a2d-4f0e-9b77-e39bb539a0cb@citrix.com>
Date: Mon, 9 Nov 2026 14:07:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 22/28] x86/hvm: avic: ensure SVM AVIC supports xAPIC
 operation only
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-23-dmukhin@ford.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261105013347.719392-23-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0610.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::12) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DSVPR03MB989290:EE_
X-MS-Office365-Filtering-Correlation-Id: e052118d-00a7-48ff-5873-08df3e6ac836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|4143699003|56012099006|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	AD7Uj6DgA6XTJwSMzNTP2VoerJGxAsmEQ3zGHsnxFdmQSmszWssDvjoL4VuaLkPEsljfEX5krrpfVtUZ37B+40bkuK1vozmXHduAK4PUg2L2aEbuLWcMX9gQLxZ2d9HI87LD2IEURfYnitihQfCZSQCAOfPeEWZVuaZqx4TxBOHBDS52kS/aoqOgkzzda/QtBfVoejpAevAewQgKsgEQKqeaKV/Nl6admVPCNbd++RenUPh3jq3A9B8r3iBXudn9Ehhb5lbCY3Smq2CqTY/8gG4F5TENsZtP0ay5zH562Ak/NY1xT6PbbnLcVyX7LZI0sdxiAWI2RvTESplmBOctyhtQ6VWS9h1V8mPptd7nUkZ36FxVMwH1ZFNEEr6NadBKAUULwiZlLtBDyAZ4kIAtU6W+PX51083RIdvCKV1hXi7nfxXvNSWzwzDFaHTFU/CrIIDPhjqs3e5DDa/wgkTvKIhvFoOFbW2XkpJz67Fh2/R5LmpomwsO0Xz7y0NQkPT4d8LeQHpI49IH0yY3a7N51F7XZQu1m+ap53ZwKh+8frtRaaeA9oJvcVRrM2DTFyBP+Ixn2FTN6ZmsEmkD+u4Bh+/RVvqz1Ium3Ox3SEYWdlZDdV6R6hTZjy4vIfYP8VlE1gJOhDcDz7jiMbVrtSZVqC/y1kWiXxymMI3P4A6bfzY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXZqelE1V1llaXJHSzFzb2xHSkJjbUtsL2lnOHRlT1FnL0h1MHhoK2FmYkVr?=
 =?utf-8?B?Qkl2NDhyb0FvWm9xQzBWWjhqM1FqS2tPZnVMaTJDL0VqQWlWQWQzN2ZCVi8w?=
 =?utf-8?B?bGpmTFRFbm9LendmbWZITkZEK2psRVRQQ0lKU1QwbFJEeWU0VmVDbFRLM3lB?=
 =?utf-8?B?a2RLNWhJejdZUDRjS0Zha2pBc21nZG1BM3JOOGhDT0xJSEhLanlGeUdTdEo2?=
 =?utf-8?B?MWV4VGFYN0tnd05pUXdnclEyUXZUdkNBRWFGSjFDYmpQZGVqcDlVS2hzUHls?=
 =?utf-8?B?WnB6R05nYkNhamxBamxlRmxmVE1lNzRhTWVMOTNVaWF1MEJxRHhjUWgwZEFp?=
 =?utf-8?B?c1pYTzF2WDc0eEhQS0t3bmlFZ0RsZjMzcWFyVXQ4SDE2a0dVbHNEVDErQkRW?=
 =?utf-8?B?bWh3VjVsN3RoSVNCZUhvUW9SZEw2U1YzS2RlTzlRczBZVXRiaWlGZDB5a256?=
 =?utf-8?B?S0dNenVDbTc0YmZhR3I5ZnJVemJMV0l6Ujh1KzlGd1cxR2liZUlwNEZ0b1VU?=
 =?utf-8?B?TG1aWWVDOFVEQWJCbzJtMVdUVWEzb0p4L3ZLTERKREZtaW9kUm5YbVRmTFR5?=
 =?utf-8?B?WHNzQzhLb0V5Y01ody8ya2lLakI5NEdWNFU0d0lZRGZrTVdQZUtML2UyRzJv?=
 =?utf-8?B?L3ZrZlZWM2NlRTU4L1Zndk1ZT2Q3bm5XR2VtYTdPU25YOUxhbnVvbFNtQ3Vp?=
 =?utf-8?B?aEVWQmMzTkptL2V3UTFPc2MwNWpMZk9TeC9YampGYk95TjJleXB0RkF1VWtE?=
 =?utf-8?B?RjBua3JiUFFUY3Bnc1QwMlpCSjBLVHBMcUlsdFBkSUU1bFo0UThKSkFObjVq?=
 =?utf-8?B?TllPNWIrczNXUWx0Sml6akErMXl1cmRzOTBrMXJNd0JnRVBMaDlxTkxWWm1R?=
 =?utf-8?B?dXVLWTQ4VStHdkpmUTVoUGFJTW8rcEdqc1JGaU5UTEh4YjhWZWNHdGZUczRM?=
 =?utf-8?B?Y3pmeUZFdWNEV1JlejBWbGM1NXlnbFE2ZHJXMmNZRHA3aUsyeVcxTkxPVVA2?=
 =?utf-8?B?RmVSNk5ZZFp4Y012UC9PUndJeklrWGtybE5GSTFwVmk4M1dadU1CQk0xRlhv?=
 =?utf-8?B?K21CT1FRd3dUL09TaXl6SVB5THpvK2xQU014TG5kYkZoYXpYVkhWQUlsZTVp?=
 =?utf-8?B?NU1hbXFtQldBMWZxNWp1VUhpRkc0SDZlNFlLTllHWFFlVHZLRWpvMUNLeFI1?=
 =?utf-8?B?eGVsOTBHWVY4SGF6a2tsT2wyZ1FLRWR0THJrZHpiUDJZQWVjeEJYbTZ3WmJB?=
 =?utf-8?B?M1VtYzBpTGdzSjViZVdXazdXMmxycE9yNGNzSi9kSU9RTCtrZ01FcFpsU0Qw?=
 =?utf-8?B?c2liTWQ3dDNKQW5XZm1sZnIvS2ozalF6cWRSVFlhS3Q1cVY4WnpoQUQ5UStK?=
 =?utf-8?B?T1pkUjFQcDNhL1VPaklqUUJTN3NGdkdNQ2xvUmFsSlQ4ZEZNekN1WGlqRFRU?=
 =?utf-8?B?WXZyYlBQTlB0SytJdTRDMVZaYmVNVllRWVduZFdOUXdwQU85dmVDWUhvMjc0?=
 =?utf-8?B?U1M2b1U3ZnVpdHM2c1BiSzBRUXkwbnJoWUxsa0FYRjFlS3pGb0hHNVcyMWkv?=
 =?utf-8?B?L2c3OUYwcEhxaXdSa0JlRTJKNDMrR2xsSmFmY3l1TW5mQ01LZ2ZWOUhPMytB?=
 =?utf-8?B?b0lCRjhZUU9IdjRzVDluektNSzhTNE9lRVh4bDRCTG9HT1ZaQlZmVFV1VkhE?=
 =?utf-8?B?TmFwMG5Hc21TU0xoWUNKQ2RkRmo5K0QwNm51YjdVNGIvZnZRUmk2MGxiaVJy?=
 =?utf-8?B?NUw4aEd0d0VQY0k2SGpwdzdhQ24vc3YvaW1udVpOOWdDbFB0c244SnJ4bjV0?=
 =?utf-8?B?enRhSlBPRWFBM1NLcXhadzdXWEZuVnljcXZwWmJDVjNyb3FWNDlXMUlITEVC?=
 =?utf-8?B?T0hEOFp1YmxoSEpTdFQrclJhTURDUnlaUGx0eUplcEpvTXFzWkNZV0ZiRDVy?=
 =?utf-8?B?OVgwWEM2QWxGYlo5b1RNcnZJNkNpeUZMOUIrSlYxN3ptQUVaWGdKSVV1b3VJ?=
 =?utf-8?B?aE45SHdoUVdrWTZZT0hDL3g0K1NNWnpEUjF0bm96Yy91bGtFYnhpOGtoRGly?=
 =?utf-8?B?c1ZkSWs4eEdrZ0Z2Skd2Ym9aMWNMZDJETEdkM3RvZE9QZjZpdm5sMm5EQWlT?=
 =?utf-8?B?clp1Kzg5Vk9LQ3J2WFBTYm1KRThNbk1XakhnTlN5bHhURHBENFNuWGFzZFdD?=
 =?utf-8?B?K1FCdFhzV25EWDFCVXV3UlBkdDJORGFmUU55OWdTeXpsbkVUYnBYZW10OE1u?=
 =?utf-8?B?N21qaGhLT2tYUXRtUmNYOXVGU3Zna2FCSUFvd05WMmtvNG5LOU5EVDkwYmtw?=
 =?utf-8?B?WlhtdlZ2Mk05eGY1V3EvSEZiSHlzNVNZY2Q1YnBUUXArbkVZQmhxRFpNbjlV?=
 =?utf-8?Q?x3IAaleE7eBYRbvg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e052118d-00a7-48ff-5873-08df3e6ac836
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 14:07:25.7559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ev/lgJHsT8I73Qtk0i42ZMCHUw2pdCaGnaUW+9XJ8vR+XNrA/c0etRFAnmHhvHPL7RzrQrvoOr4fTBgp4GZQUeq558igSrDHbP7Qdd2ot0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB989290
X-purgate-ID: tlsNG-d62444/1794233249-BF66C757-F3CF06B5/0/0
X-purgate-type: clean
X-purgate-size: 1290
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
> xAVIC does not support x2APIC operation (yet).
> 
> Until x2APIC mode is supported, don't advertise x2APIC to HVM
> guests when SVM AVIC is enabled.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/cpu-policy.c          |  3 ++-
>   xen/arch/x86/hvm/svm/svm.c         | 12 ++++++++++++
>   xen/arch/x86/hvm/vmx/vmx.c         |  4 ++++
>   xen/arch/x86/include/asm/hvm/hvm.h | 15 ++++++++++++++-
>   4 files changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index 48a3185eed8d..ca9b1a523570 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -764,7 +764,8 @@ static void __init calculate_hvm_max_policy(void)
>        * (x2)APIC isn't enabled.
>        */
>       __set_bit(X86_FEATURE_APIC, fs);
> -    __set_bit(X86_FEATURE_X2APIC, fs);
> +    if ( hvm_x2apic_supported() )
> +        __set_bit(X86_FEATURE_X2APIC, fs);

Perhaps this is moot given Andrew's comment, but on my host the X2APIC feature
bit is already enabled by inheriting from the host policy so this doesn't have
the desired effect and X2APIC is still exposed to the guest.

Ross

