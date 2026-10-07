Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7FECA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 12:38:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442292.1659864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQub-0000sl-Fv; Wed, 07 Oct 2026 12:38:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442292.1659864; Wed, 07 Oct 2026 12:38:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEQub-0000sc-B6; Wed, 07 Oct 2026 12:38:21 +0000
Received: by outflank-mailman (input) for mailman id 1442292;
 Wed, 07 Oct 2026 12:38:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xEQua-0000rk-23
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 12:38:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEQuZ-0097lM-F5
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:38:19 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac63d32-bab6-0a2a0a5309dd-0a2a4505d94c-30
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:38:19 +0200
Received: from [52.101.85.24]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ac63d38-4cb1-0a2a45050019-346555182a2c-4
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 14:38:18 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by IA3PR03MB8023.namprd03.prod.outlook.com (2603:10b6:208:509::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 12:38:12 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 12:38:12 +0000
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
 b=Ht3rcRBzlAKpi55BkdxKiLtt4aZ4RhM8v16QTqbuNVqj8jR+DM7rvZl4wsKVmPrkhVczQ3IYPfZ7aamiCQQCxPunKAvfpo5E+/McNDJ8clmvT7HHFr8Jq1Is3GHXCFXWaWk/exmSEEWxgSR4TIe0IupktOk9ApJtXjs5QgGqOTi7+9Mn2COWfVLoqK7ADbDKVNpCtzcxF6NcR05WOtDsdhMRmCwqf02YTDwnNGnDoWJzAlNy7O/1EC+gARwozypAPiYuLoeIxD56T9j3USxoXooCSiE8pjk0boq/rWY91xVg6uqNl3PV2u4dKk03fWORtfb96xf3Sii2CDAxw56z8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YY9cqyUfKoDTK1PGZqm8ng1IS/cVdxO+SikKAV7S3g=;
 b=NUa3xkTSV4HdfZoRW4zUWJ01o89UzsF4jH6CROU1UH8mKW0oQQ+MiTeT2K2z3zuxR5tAXGIErbBcl/DwuZMf4LVSgAlhiv/gnWi4Ti/+BpnSawFs9ovD5J+zofb7K4yZzHSQ+E+ml77H5ejIY56jinHlWUbifGxzRg8/lvxsxtQY7UCRIO5cM0Rqf+1GkmYDC2yIZUtjAIT+OyzKwILShWTP7NkkZRQWxR0axgq6Zeh7cDIreGvK8OXKkbGo0+G+cFZ6eNwnfKJsjBIy8nlCdwkVyzsBhb/q/XOpTgvyMFk4vKKfkMXBWalI+dLhmjzJWBF764Vt9i0Cl/IPHF1GFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YY9cqyUfKoDTK1PGZqm8ng1IS/cVdxO+SikKAV7S3g=;
 b=vOH+brCE4qaXb4vgxwmX/uJ9bNVLZAdq3R19p5yYWXpydt3ssGpFXExzY0JH0XvQv1mD73gX0pEakaaAYQeYP0qm9EBYF9eeuS2VNLEnLAZ/PWLF1jfEoDcsRz0OCA2Q+3dyt0rwciXft4LeHpqmoEW37W6jWmOQSS73xvSa0u0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cb2a5856-e3de-4ea6-8a3a-00f2999eef92@citrix.com>
Date: Wed, 7 Oct 2026 13:38:08 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 01/18] x86/PoD: map one page at a time in
 p2m_pod_zero_check()
To: George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-2-gwd@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261007104051.48841-2-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0039.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|IA3PR03MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 5000a09c-ccbc-4a08-e158-08df246fd9a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|22082099003|10067099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	bf984I6LyuKanhzTZV7cZuRueaJFUzrtT1PHDMStk3YGY1EasLr/wVsCwSNgitF/Q12HvKiRxo6q7c3T/Rt7oCM/aNNbribxGPaIHg5oynWtoDMyrmSGUtgPS4RYdGCTsrEva8UVYjw7cZCfxmU6ztW5GdB4s8HEDwktV+7WYwqppai21kBLmL/mGt326J04b91Vf60rBgWkj5IheI55LBGX8+zO0hR2WR3/aXOJjib1CNgWlDWGa22JHRy1MYJ0zEsP/OLZfY84qYt1JByQ765JOUfgRpjfYP9toot3QT7rmPJJJ0vRwSV6+gPSRnXs85X9pFvgTjsZzt4OKBOtBIS+Z9FwY45S8s6MK2EZCrHwaAyl0tbKF1wGeHTWSKlxmqstCZaK4/GZxy9gy+2QjI7OqcQpSubnKlZwzR9R1x6l90mobCxF275udV48sHpcJqD7uRky5dY4yce52FN7swhVY2739w9JciMjKapp3HSLk9sEzXkRGWVPxv3S665Agn14fI1LjmzTSDEexxc2ZWfdLsVd6X3fsnlXCXihv6aIFsdHQUw0M2zICy2+jj7BqrmD3FQytZlIapwpOOvL3Qr3yG1Huyh8tECNedrosGOWG2O961IKDqo0oOn7co6q+H+f9lDAgdz4T8AX/OuAtHzhv5fkrAOAyHX7uJD6kcw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(22082099003)(10067099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bys1bUdQVWR5VE9IM0ZONnpUdksvSUVXcmhsOEhKbE4xNlI1YmRlZnhiVUEz?=
 =?utf-8?B?a1Vwenh4YlkxSDl6SGR2bVYxc2tTM1BCZHVQZFR5b1BuYmsrZWR2Y3RnUFQr?=
 =?utf-8?B?VVdYNElHdDk3YTNHU2FUMmhqWE05czFnYjN1Y3BYVmd6dmhnazI1TWtScXlZ?=
 =?utf-8?B?ejV1MGM2eXFWVjduUEdBZ0QvUUtqeEpQSFdrWDBPUW93aWhwMDl3MnROc0RD?=
 =?utf-8?B?OG1FdlozQ09ydFArZ3lkb3dKbzN5dmhLS2kxY1ljZ09UQ1dlcTI2dUt2ZEZZ?=
 =?utf-8?B?QmJYay80OWVNK1FEM2d2V2xlOExWRWZWeTZzL1Qrc0xKU1dtV3FHYXEvd3l1?=
 =?utf-8?B?Q0ROUkRNajJPMFh2S3pRMm5ob2ozako0dzdmSkxFeGMxSUNZbThhSDFTMmN5?=
 =?utf-8?B?bi9RRVIxVTY1aWF2MFF6YlZsamFvdzk0SXVjSnRuMFZLbHdnSkVWMEYvWDh4?=
 =?utf-8?B?bGFmeHN6LzFJclpUbWQ5dmNHK0FpQVZ0Z3VvUjRKWXVWY011aGFCUkNHU0t5?=
 =?utf-8?B?aGJnRlgxYitSejIyeFB6ZE1yb3dIMkZBUFBmTnM0TndoTnl6dUNUMkJ0Ulhv?=
 =?utf-8?B?VjFtV1ZLclkvcHRCUHlUMzB1dzlaai95TzBvMmc2MEhhaDVqOTV1S1NseDI2?=
 =?utf-8?B?NC9hZENEYURCaWNNNDUxL3pTenl5RjJ6UVV4M09oVkE0TGZaeE9pVEc5b0Er?=
 =?utf-8?B?Ymw2cTd1QkxKMzF2blF6bDViOERiTldTNDJReXBDd09Pc0tnaTRPRitzNlI1?=
 =?utf-8?B?dEVYUVZZOVg2UjZYeXc1SFU0N0huQ1R0dERrei8rZWIwbW55SVJNaUdKMUpG?=
 =?utf-8?B?dE5EekNmYXh3MWxmdmdpWENDUVA5ZUdTNUhYalc4ajNaZTFwekpKZXlpNDZ5?=
 =?utf-8?B?OE1BcnBrWHVhRWlEcnlWL2pZYXMydmFxeXBRdVVSRlBHSXJSeU1HSE9XZDcy?=
 =?utf-8?B?Qm1SYkhDMXh5UzU2ZjZYeUpxWEJYMUJBcFlSZTVXVXo4MmZtaE5ITExSR0xj?=
 =?utf-8?B?N1ZWaGVoZjdoeFpTV0pIeUxXTEN2cXFOa3N4RmhQMVVYcWtVNldneVNuQnVl?=
 =?utf-8?B?bnl4UjZyU05VNnAzRy9nbjBpZ3prKzl4alg0RGJHR2grUHZQNlRrZ2t3UnYw?=
 =?utf-8?B?MmxrSnRYNzFCYkNIYTFuZlpQWCtEaTNOWm5GTUJadXVEbUtlZFZHbGtyV0h1?=
 =?utf-8?B?d09QT3grTlgyYkZjRnc4Q3Z4UDBFSjFhUVk5NWVKaGM4VWlpQzlPS3A4bEF2?=
 =?utf-8?B?VzB2K3pRb1lyQm55ZUZTTFZYOWpuaDhXTHRpd0hHM1QwdjBJNXZKSklpSHpO?=
 =?utf-8?B?OThZaWtkU2pYMmdzZjhuZUhEeUJqTnlYRWlkVW44bDhUdUZOR2tsYUlnd0cr?=
 =?utf-8?B?M2hGS3lDQUthdkQvdENoczhLODFmc2xqTHhYV2daL2JzOXJ0QkVob2s0RUZF?=
 =?utf-8?B?UEk4N0pYazhjSUdwK0l5ZlV6bld2QXlPUU43R2ZGWWJHYjRGbnBXMHEybnhW?=
 =?utf-8?B?aE1DTHZRSXBVZWxtMVhYSFVVQmFZbzVKZytSMFFyTjRDSkEyWWF2bkMwTUth?=
 =?utf-8?B?SjNEOGJBbmVObWcwYTZxM2ZXSysySGxEbURpVld3UXVHQllTS0NVWVFKRWxq?=
 =?utf-8?B?V0NLeWptcjhNdXEyU09mc3drN2ZIQllEbitBaC9Mcy90SCtXeXBGYkFXdFA5?=
 =?utf-8?B?VHVsWEMzeFg1VE1UNnZOT2h6K0Jvb245NGxiTHBRWGt5aHNDWFlOWk1zb2Vu?=
 =?utf-8?B?aTJ5ODFFY2ltNFJkcUdQQ2FPS1lMczVIQVE1dzB4Um5CS1Jza3hGbmVqdFZS?=
 =?utf-8?B?UnpqamNSS3VtRmJDbHZUOFV5aGIrdlpEWlRYTGtvN09lejh0dXN0MHVnNUJw?=
 =?utf-8?B?L2plMXNGVHFVcDFPaFE2RktxY0JKTnh2RTdsOVh0cHd2aEM4TTFqcHlKWStD?=
 =?utf-8?B?SjdtdEZ3aGtmWXJnN1FTeFlvWlQyaTgwT3RnZjZBYkZpTTJpdWdGWFlycFdx?=
 =?utf-8?B?WmlsY1F3S0djN3l1U1lzTm5kcDAvVXdTL1dDeDFheS9mZG5JbDh4SHhNdkVO?=
 =?utf-8?B?cjhhWnE1WWtFejBqVlFoNitWemFsUWRSQ212eGxMdVlJb2pDQWRjcDBqaDRh?=
 =?utf-8?B?QnlSSzlxbDV1OTFSdHcrekNrdU1MVG1YekFuZk1QcWpXRUQ5UmtnVnljVStR?=
 =?utf-8?B?Q3cybVAraTRIOEc1aDkrK20rVUgvMUR5dkx6MGVqVGl1VVE5NThTVmpnRzVv?=
 =?utf-8?B?b0lNVlNJaG52L0pLZzQ5VjVrakhyQ291cms2UzVkZmcrSUtLblVweVZvWHZn?=
 =?utf-8?B?Ym0zRDl1d1hORlVTdzFBZEUvdFMzSTJPdkMyZWQ5dGM2SDNSQjluQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5000a09c-ccbc-4a08-e158-08df246fd9a4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:38:12.2122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnLGt0eLSnepB2o/fUuIH1WlVGLdluDr9PVxbq3pNlDxozlBIbSmNT89vMadjOBq9f1g8K/ZiPNZXiqsUSREjwE5DS5+tvUOoWxPNIouMhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8023
X-purgate-ID: tlsNG-c201ff/1791376699-F74BC2A1-AFD56B14/0/0
X-purgate-type: clean
X-purgate-size: 1149

On 07/10/2026 11:40 am, George Dunlap wrote:
> diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
> index 4602c32cff..0b0beca15a 100644
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -911,7 +912,12 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>      if ( paging_mode_shadow(d) )
>          max_ref++;
>  
> -    /* First, get the gfn list, translate to mfns, and map the pages. */
> +    /*
> +     * First, get the gfn list, translate to mfns, and pick the pages to
> +     * check.  They are mapped one at a time below, as in
> +     * p2m_pod_zero_check_superpage(): a vCPU can hold only a few transient
> +     * mappings at once, and the p2m lookups and updates here need some too.
> +     */

Actually, I think this wants almost entirely dropping.   Yes, "and maps
the pages." needs editing, and should probably say "and check for being
a plausible candidate" or so, which was missing previously.

The rest is a justification of why we do mapping in the same way we do
it generally, and not useful to have in the source code.

~Andrew

