Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95276C5516E
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 17:59:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378347.1623782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpV2Y-0001B9-3T; Thu, 30 Jul 2026 17:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378347.1623782; Thu, 30 Jul 2026 17:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpV2X-0001B2-VG; Thu, 30 Jul 2026 17:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1378347;
 Thu, 30 Jul 2026 17:59:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wpV2W-0001Aw-QO
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 17:59:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpV2V-00Bi9C-RZ
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 19:59:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b909a-e002-0a2a0a5209dd-0a2a4509867c-46
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 19:59:27 +0200
Received: from [40.93.195.10]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6b90fe-be1a-0a2a45090019-285dc30a30cd-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 19:59:27 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7599.namprd03.prod.outlook.com (2603:10b6:208:4fa::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 17:59:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0245.012; Thu, 30 Jul 2026
 17:59:23 +0000
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
 b=rAlmoNTZNLyTkai3yd3hdjPG8SkdRX9FMsG6nm07q0rF9/lKz83wQHw5a3vlgWilkSzXinAd/vz3EvVEcgVwZ3iShq9l9+XFK1nrH70GdYrp7T71AqfXDW1flQRsLLEH/5Q8sHCbZRp2hm6xAuInpNaxKjE0quQXxMrhNi5+GAA9piDr2PZohkAt2mbv48vhujl2xCKjhiPpu5SgOOv99Fa99A1oC56qZmDqIqYqGi1xEShDUNxlptQ7WnX54u05Hp6nRHlpadk76v4/BJmuL5+gLwEhddvqOPI1YPwm1e59y5r82qq1S/7uUvX3B6xGTubjN9FzOFOTjyJKJApSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6iSvvMeb7pFL4osUoHftjsz9tl5oIZq30inWXDnugo=;
 b=MidNc8KveKvycE4dk5lZzUYWnCgn1cLYuh0IwZulIkHewdw655UgYK+S9/5ewlIl8lCFWQiS4EdNm1zTldzcdaBA2D7k2WpuCY15+mjWKgQbM9kCWwE6jJaRgDfbKOhGAHftrjSwvb/StfT893gkbJ9Dlb/1/aRYlhnode7YseGH+2ctTeYJr17ailt/uljsvv5Yw1jWv1eyYqinQDAz8v3mdEoKWssGWmeaT4/0b2coGQLXlVAeUNmevlrAjZIMtrnFgCL8se+r+lfZtbibx9khi2utca4hFAcTITCmDsndk3/SP9mldVxu24FKd1HTLKS89hbmkOV8V3bNLHic/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6iSvvMeb7pFL4osUoHftjsz9tl5oIZq30inWXDnugo=;
 b=LZBtRzriTRgs2q0SMgN0GUCLfYv1dLEfA5c2NvwJxED7//hOC3pz2IYGKdpunV/201n/BbaFkvGtE7qsxZJzZzqrgap6NCocpAeU9K+VHT0JuLlKhWrzxVflmTZbmkcnPml6eSaf9IqXwMqeYaC9MR3kjyI1eBfAms03DWQ9V7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91bdef16-2da7-49e7-af5a-e395da533330@citrix.com>
Date: Thu, 30 Jul 2026 18:59:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v2 1/3] x86: introduce "brk" allocator
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
 <f7e3cd68-f6de-4ada-87d9-1a5dff277b2f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f7e3cd68-f6de-4ada-87d9-1a5dff277b2f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0005.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: b662812b-50dc-46c3-121b-08deee6449f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	cTYS9Dsu3xF27gMPz64uDNtZnl/zKqi07vhzao3Xf56mPNjDKKvjmp1ez0VDsSR+zwFpwc1ivEvlz2xmG4zLKxP8waxB1K4ngX2H5UFXGLpnbUEGOqAk0H/mMIFEzSbyrVw0hZ9sJs/dA2rHicWR9SkBchvYpptpe/aghrVeaZHkI+oXrRN9AXBCPMe/Z49v7nYjkEhPZBpWFonZgdxJRv7Bm0/7t4WToZoEmdl6f7OYSn0eomJgGB+iXnmqr8v0NDYsqXQzUHD41rreY0wA23JLvg+/Bc4rZioDosNoFUPSw8wNXXPP6vcEE3N1RNhHgwjKFKOPK24afS5sLt7fh9zYrvjuBcVLN5MEElGp9PuxcsrAHkPTuck5qBUajFQPkkDjpYGpubcDmOZFqJCW/VZHx4iHwyiFzXr0G3SxIJyXXHTVpAAQXKV0VWET2uL5zc7/oo+U2oH7JZvGf2+S5/Fwa1+7N86/n31RMluZSL9O1nx7LRaqKeGomB9ZFh8JiZ5JZnbyw3Jw0QbVj4Zl9GiSSJIEzSgptncwTqReGhDGN2dy91uvcQemCePiNO7dB3aoOrcbd2xjD0ngHaDidc/S3c2ufvpX7ZL9Aa8BM6dKYQ/hFfPSbyZNPR1oq0W8lMQv4La3MHVslyXZXLzYFdv9OPFtgx5VMeYbF738p74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkpFMHFEM2VEOVBBcGdUUU9paFYrNzQ0WStpZXhCY3R0c3NUV084eVpzQ2VX?=
 =?utf-8?B?QVZHK1pSbWgwNXVlaHNxN3VBMGFTSTVlR1prczdxRXVKUHZuK1J6OVFqWjF5?=
 =?utf-8?B?RGdVNzc5NjRuQmh3dFNPbmtzd1hPQzdISXJGcFQra096ZTVnaWRVT0Rvemsw?=
 =?utf-8?B?YWhnOFJCZlduL0FxQi9uUjF1c2kxZTUxdVBUVGV4UEF3YWdldUtiQi9LcWZ4?=
 =?utf-8?B?Vzd6VFVHUnRKRjJ6dE14ZitZOFA1dDkweENqUlpDZWFXUjVWOWhlWGMvSDBR?=
 =?utf-8?B?ZG84dXVJSXA5YUV1TlJVNmxKVmhCRjVxMjkyRVQ0UDdadXMvWnR2N2FKQmxM?=
 =?utf-8?B?WE5iazluZ0lhaVZOeHBzNVVmcGhzaTRjVFhidzQxTVpKVlZtZFRJdzVkckQx?=
 =?utf-8?B?eTZiVVVWTVFPQjFScTJGZGo4RDhpTUhaVEdwL0I3SHZ5bTMwekhhRTNTSUpU?=
 =?utf-8?B?Tys5dy9icG5VYkZPTFlTVHU2UUluL29nRkhjeG1kUDdnZE5YVUxueFNxN0pJ?=
 =?utf-8?B?Q2RIUUh0TjdDTmRIWmxRZDJhQTVrNDdBTDhRZ0FjblNESmI3S001RmdQZTJD?=
 =?utf-8?B?cFhLejQ4VzRkaEFlOEhDTm1iQURzaFBLcTNpSGVOaWRQMmVDbEdsNm1CTjNt?=
 =?utf-8?B?R2V6OVlRb2tIcWVtbjliNy8zUGNVZEl3QVBkRjlyeU5GSDF1a1RwZThHWlRn?=
 =?utf-8?B?ME5wOFdqSEJCRWJSQit5NmJSdXFoeittY3AxODliK1NOZHQrNWkwMVBrc2Vt?=
 =?utf-8?B?MUdQTDFSRysreWw0V04ycG1aV1VXQlBCVXJNc21FS3FDYThlMVVIUlRCQ0JG?=
 =?utf-8?B?VmVZY2dMejRGSFBIa3ZHSUEydlIxOTV5cUgvazRFTXdTeEZ6eXZoeVdLcHMz?=
 =?utf-8?B?SzhVNWdxckpqdUUrMnlQRi9mWlpBdkJpaTJkdGVrV1pYcVhZcVpmVk1YK2J6?=
 =?utf-8?B?L0taVWdzMml0dktVaU41akd3UGxqVGw1KzY1VkZoTTM4S0xqdk0wam00TjRC?=
 =?utf-8?B?VTRUMGpxVFJUYjFKSWEranVhMlZSUmppMzR0b00wWmdZRFIweHVxUXBXaTZI?=
 =?utf-8?B?NzFzZ3NZdTlYV0dGNEM3UTlneGo5cnN3QUhxVFRDK01HbWVJRFVNTUFyTVoy?=
 =?utf-8?B?MmVqdWxnNUxKVUhKd20zc0MzeFJSb01QVU5wRTBIcWI0Q3l3V3RSdUNDblBD?=
 =?utf-8?B?MWt5Y1hxYkQwV2dFSzAxdjJqb3Ryci9WY3FkZkVBclJaSVZtTWc4dWlYWldT?=
 =?utf-8?B?UE1OTmlGa0dDWXdNZytPczJBaVlFNlVWSnFhTU1ydS9SdllhNHc5bmFqSzJw?=
 =?utf-8?B?aFZEUE1Ca3MzejJCclU2R2thOFp1MU5DM2JVajg0THNBYTYrK2V4emUxOEgw?=
 =?utf-8?B?ZW5tQmpvOHlXQkVXZ0gvbmVBa2xxYzliemxuTFd5M280blZGazQwMmI2MUVh?=
 =?utf-8?B?TTY4ZFdnemRBZ2dPdEk5Y3FubEplNEtUTVVyWHVITDVKMmZUdm40R29WeWt1?=
 =?utf-8?B?NTdTM3NnUXJlZUJDOW4vZHhHZklCUXIzWS9TMVRJN3NoNmsyWjRKSlpnckZO?=
 =?utf-8?B?OXhya29OUHZpeFZmZ3M4QVBBMy9raWdaVExBVE53MURWWWJYY0RiQmV3b1Y4?=
 =?utf-8?B?ZjVmY3ZHM2E1bWpYNXlWWHdBaVljZXFjN2xxTUdWK05IZVJiZEtNQ3RvUTM5?=
 =?utf-8?B?TnB1U1ErV0JMRVdMamNCeEdmK3B6RWFZZ0dhOThtc243ajRSemdTT21KeWwz?=
 =?utf-8?B?blRwSGZjbStXYVV4TTNDR0JyZytmbGl4a2ZyZUVHYXZDMU5LUHJsYnVhN0dj?=
 =?utf-8?B?d29OVjZQZ2ZwdXJHMlN1cjByenJIYmtRckJFRlJrT2k4ZytZL0c3VG9wZ3F3?=
 =?utf-8?B?YVI1dER2QkFpTmEySG1QbTg4NExnZlJvTjVDZURjM21VWnBoMWZUazBDQktT?=
 =?utf-8?B?VjBGNnozZEhyUEJCaHEzaTRUNTEzelVXeENBOGxOeElxMXgraWtDMXR4TjlR?=
 =?utf-8?B?bFpwR3ltaWF6ajJNVmpwazJHSVZGeFllWTQxamlvMEFEZmdtdjlyY3BPbFZB?=
 =?utf-8?B?MEdnaHVieUFaVWJCWlBjeDQ5MkFwdHpGb2lXMXhXRDh1NXowMUJYa2xQUFBE?=
 =?utf-8?B?bDJUcURlcW0rbXdxOHJMRUNhQlQ1ZDd0c2x6RlVBeVpaMDNWY1JLcmJXK3ZQ?=
 =?utf-8?B?dGgyRVRSSzJZNDlPV0ttbDJtSWhTQ21oRXpKTGJ4Q2ppVzl6QXZGL2hTQUUy?=
 =?utf-8?B?SVZLOXNCQWdnd0xXVzFsWGtscFpyN3VjdXdCQ1p6V3AwU0tnak9aRkJVTlpx?=
 =?utf-8?B?VFl3bEF6ZVJqQmFOZ1VWTVR4NTNCeUVhZGNYSktZdERwUTJBbldOaEE1ZVBV?=
 =?utf-8?Q?D0J9W4JMPeNIs65s=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b662812b-50dc-46c3-121b-08deee6449f3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 17:59:23.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t49sLWDGkpa4lNByeLllLWE1uvhMbQOmtz/RRPjAyoOMYx8KsbTcM+pzEUplY/XVZmPjw0SR4UC3FitwTn5cup/glMi4hPqw/IkPorb0XcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7599
X-purgate-ID: tlsNG-bad1c0/1785434367-BF4D3034-A6DA585F/0/0
X-purgate-type: clean
X-purgate-size: 4989

On 27/07/2026 11:19 am, Jan Beulich wrote:
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,4 +1,5 @@
>  obj-bin-y += head.o
> +obj-bin-y += brk.init.o
>  obj-bin-y += built-in-32.o
>  obj-bin-y += $(obj64)
>  
> --- /dev/null
> +++ b/xen/arch/x86/boot/brk.c

While brk.c has x86 specifics, I'm not sure it's worthy if being in
boot/, rather than simply in x86/.  It's used until mid way through
__start_xen().

> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/efi.h>
> +#include <xen/lib.h>
> +#include <xen/mm.h>
> +#include <xen/page-defs.h>
> +
> +#include <asm/brk.h>
> +
> +extern char __brk_start[];
> +extern const char __bss_end[];
> +
> +static unsigned long __initdata allocated;
> +static bool __initdata finished;
> +
> +void *__init brk_alloc(size_t size)
> +{
> +    void *ptr = __brk_start + allocated;
> +
> +    if ( finished )
> +        return NULL;
> +
> +    /* Allocations PAGE_SIZE and up will be page-aligned. */
> +    if ( size >= PAGE_SIZE )
> +        allocated = ROUNDUP(allocated, PAGE_SIZE);
> +
> +    allocated += ROUNDUP(size, sizeof(void *));
> +
> +    if ( allocated > __bss_end - __brk_start )
> +        return NULL;

This means one (or more) subsystem has brk_alloc()'d more than they
reserved.

While returning NULL is probably the best action, I think a
printk_once() is also warranted.

> +
> +    return ptr;
> +}
> +
> +unsigned long __init brk_get_unused_start(void)
> +{
> +    finished = true;

This doesn't get the unused start.  It also terminates the allocator,
and the name needs to reflect that.

But combined with brk_end in the next patch, it's really quite a mess. 
Integrating brk_end properly simplifies this patch too.

> +
> +    allocated = ROUNDUP(allocated, PAGE_SIZE);
> +
> +    return (unsigned long)__brk_start + allocated;
> +}
> +
> +void __init brk_free_unused(void)
> +{
> +    unsigned long start = brk_get_unused_start(),
> +                  end = (unsigned long)__bss_end;
> +    unsigned int subsys;
> +
> +    /*
> +     * Only xen.efi will have the symbol __subsystem__ available, and it'll
> +     * be non-zero (10) there.  In ELF the symbol will be undefined, and
> +     * hence zero will be loaded into the register.
> +     */
> +    asm ( ".weak __subsystem__; mov $__subsystem__, %0" : "=r" (subsys) );
> +
> +    /* using_2M_mapping() isn't available here. */
> +    if ( IS_ENABLED(CONFIG_XEN_ALIGN_2M) || subsys )
> +        start = PAGE_ALIGN_2M(start);
> +
> +    if ( start >= end )
> +        return;
> +
> +    destroy_xen_mappings(start, PAGE_ALIGN_2M(end));
> +
> +    /*
> +     * By reserving needed space early in the E820 map, excess space gets freed
> +     * way before we make it here. Don't free the range a 2nd time.
> +     */
> +
> +    printk(XENLOG_INFO "Freed %lukB unused BRK memory\n", (end - start) >> 10);
> +}
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/brk.h
> @@ -0,0 +1,7 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/types.h>
> +
> +void *brk_alloc(size_t size);
> +unsigned long brk_get_unused_start(void);
> +void brk_free_unused(void);

It's inevitable that brk is going to be used in other architectures, and
none of this is x86 specific.

This should be xen/include/brk.h right from the outset, even if that's
all we do in the way of making it generic.

Except, brk_end in patch 2 really needs to live in common/brk.c so it's
probably easier to go in arch-neutral right from the outset and use
"select ARCH_HAS_BRK" or so to allow the arches to opt into using it.

Furthermore, this header needs some commentary.  To do this nicely,
DEFINE_BRK() needs to be introduced here so the comment makes sense.

-----
Early Boot memory allocator.

Subsystems which conditionally need memory prior to the main heap being
set up should use DEFINE_BRK() to reserve BSS space in Xen.

During boot, brk_alloc() allocates memory from the reserved space.  Such
allocations are good for the lifetime of Xen.  Subsystems MUST NOT
brk_alloc() more memory than they reserved.

When the main heap is set up, brk allocations become unavailable. 
Reserved but unallocated space is handed to the main heap, so it doesn't
go to waste.
-----


With just a few sentences, it's now far clearer what brk is and how to
use it.


> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -321,7 +321,11 @@ SECTIONS
>         __bss_start = .;
>         *(.bss.page_aligned*)
>         PERCPU_BSS
> -       *(.bss .bss.*)
> +       *(.bss .bss.[a-zA-Z0-9_]*)
> +       . = ALIGN(PAGE_SIZE);
> +       __brk_start = .;
> +       *(.bss..brk.page_aligned*)
> +       *(.bss..brk*)
>         . = ALIGN(POINTER_ALIGN);

This looks fine, but if it's becoming common then it wants to be a macro
in xen.lds.h

~Andrew

