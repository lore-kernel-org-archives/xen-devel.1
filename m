Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69219C5DF8C
	for <xen-devel@archiver.kernel.org>; Fri, 21 Aug 2026 21:00:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1397847.1634655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxWLN-0006Tl-4d; Fri, 21 Aug 2026 21:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1397847.1634655; Fri, 21 Aug 2026 21:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wxWLN-0006T5-1V; Fri, 21 Aug 2026 21:00:05 +0000
Received: by outflank-mailman (input) for mailman id 1397847;
 Fri, 21 Aug 2026 21:00:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wxWLL-00067M-JN
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 21:00:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wxWLK-004LYT-Ss
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2026 23:00:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a88bc2d-bab6-0a2a0a5309dd-0a2a450aa2d2-14
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 23:00:02 +0200
Received: from [40.107.209.62]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a88bc51-f2d2-0a2a450a0019-286bd13eed23-3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2026 23:00:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5602.namprd03.prod.outlook.com (2603:10b6:208:284::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 20:59:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 20:59:59 +0000
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
 b=ys053x1ZWfn+P9AQt6T195JEEWpJGzD2nBS/XXdCi8lrgPsfokl+Kr/+4bn6Ilbkr1x6dxtzx5Y9FWJ7Ghn1MkQLnbctkLXOubhMGCXTTRFbeG9x6n3kJVaRWB2kjMRrXpJDalQ3Az/IiqFFMTep21i1PtjxDKN+8pGBhD3hDNu3opaXpqZ/I5DrdcUHZwlsQIsuLk926LUbCIO4wanGNHYLZWn3ItInwTdOqdDXmAsbl6fkf76wDi9NLyK2AklPiLZ+Z9LOzJsgN7vkOtHd/Aexn2LNqzqKOIg9VfTBpYDJbQow0rKAEt8aqevDvD8itkQ/fh+y94zyho1AJdeGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kzf1sG+yQdDpFyAaYBignx+5rMTEZquy3WfCDRt5Zgo=;
 b=r3t3NSHtV95BVEqV6yJxVRhwEctBuv2A7uLhd8FpUC929qNSKkbTyl5BfZME/IgiB52NubZzZ8DNOk/wubr2kuIBGDBxOmW/QHQCoMpE51pTzS3RcxunL9Ou1ZIMyv/DNfkh2LObP2IO8BsZ8Bnu/jrSbRcp7I/l0rWZGo3d3UpNjflRH0Kw7bc/8UrncLHRyMOEWw92VInszQIc9gbQ3/iQLb/Ghf/H4E6bCwqipCeXnS6nOLsCr1mj5E6TRg1vbToobMBYVh+CClK/8MEL6QE2T0dbeqAq6wU9tqIRs0v5+CPcxvpbyKrIJUq9RMUxZtyGkbdZLD9pYdPts/VZ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kzf1sG+yQdDpFyAaYBignx+5rMTEZquy3WfCDRt5Zgo=;
 b=OfKzNR6HnhTqs449DBuVN6OU8LZZEcP6MvZgv7/dJ293CVk/MVLvekCH5hLdcvu+hAv4emn48c5O6AMjutsi5By4WkS/wjO5CJ0Zn4L0ySCVldvIGfxWritXra6We4AWO5cYsm+KBQhcD3T35R6ye202z3sMmi37/CdEKK0i/vw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <62208647-56ef-46b3-a64f-666716864b1b@citrix.com>
Date: Fri, 21 Aug 2026 21:59:55 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/7] x86/pv: use populate_perdomain_mapping() to map the
 Xen GDT
To: George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260820-asi-part1-0-f2dbd92b8459@xenproject.org>
 <20260820-asi-part1-3-f2dbd92b8459@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260820-asi-part1-3-f2dbd92b8459@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 9077c5f7-b927-497d-f1e1-08deffc72946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	b9I1VSyujmwa2bLzvKX/qPRhgdMBGyfp18Jh9KmVNi9I3aW9x2L2dv1CIlAImIUDOBBhE6/WkVHSI4gm9OP09CEygr9twtM/fWMmKlapqXwhZ6xPVRDDG8KV51sM3yL6Dgr6J0liD4gXMWUOvvdhAXlchTx1LR73RcIkwU3nM76eZZFKqNwNql0SGE8Ps7IEeiB+LugNbXMwwiqQLrPoCnnXhR9XX3ZsXp1CnFSgvO7etHnMuVbfsaCHY290ISM6LuNm1yfSU1ZDlMv0RDtOqZ3LV2qkraYDTyUZTA2/zoiO07VKN0+hLq04ZywbwI8GGQE1H/tURfDj6FoM4+kZ+xhQla/iG3V5ELrs4fTSzG1NwSE9RykhJMiXLqhwpcVlLdEEbXDJpJy3iJY6e4ARQ5KotGgq+psPcdwsnSP4bOWXl8ob5x4ApwQ6bEYCcjq1x4FOD2Qt2vK5CdGyXxfgNUne/zxrXOs0rDj/hvy+eDH9GfTFnOf2BLNem2GZvTlpISU6IEVgo/dq7XBKVVzThmzt7oL1ajOjiDBIStRYrLwxFm3wvLA01SF9DVvsZzAb4NuVAkmOhySFrMU5FbjibX7cQaeWypV/Hx8EODu/xxKLwxMgJKTenm9bd3kJo052nNJIG/0hUSHzqjUhrtZZOOUsjeGh6tMsFwQ/6hPFRPo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkVjTEZ4cnI1cmNNaHIyZVgyODJjVXc0eEpTODJtbnBZUlp0eGRvN2M3b2lW?=
 =?utf-8?B?eFRFSjFBMXRNeGF3TTdQTzhGRDFCWXdhcGRsdSs3TEdtQXlyb1dsV1BiR1Y4?=
 =?utf-8?B?aUdSWFdST1ZBUERXNi9FTERwWFJwR3pFdXhVVmtPVzdRcnNGNlRSSFI5QWxP?=
 =?utf-8?B?VjE2SXJGN1NFQk93ZUgwOGtvbDNHa1VPUldzQ2dpTTVaZ2JkYnRlZzVRM3Mr?=
 =?utf-8?B?N3BsSnZhcHlVL3JYTUsrMmZuMDdYTGcyVWltZmtpT0owSFFyeE1ZR2JoM3Jq?=
 =?utf-8?B?M1Juc0lJbDAyWmIyMFNxRWFQK3VnVCtNeDQ3d1ltdTZuN0ZhYlRCSXF2eUxG?=
 =?utf-8?B?K08weldQZ1ZQcXdVN09Fclp6S3VjaTRlYlhMeUs5d1RRemN0SGhkalk4SFBs?=
 =?utf-8?B?a0JicTdDOFFkbitLTHdnUXdGZnpJeTJYQjdWN2RXSmJUbTNPYTVqQ2tKU2lW?=
 =?utf-8?B?WXkxbmV2Ti9YcE14TlM2YUxHdWozaTFEaGVSUG1iYVUrZXpEaHFtb1FDMmNB?=
 =?utf-8?B?N2pBdlRXQ1RDaThHb3FQVEpFbmxERzZNeFpzRVBrbUV2YmsyU0EvWUhUZlNI?=
 =?utf-8?B?NHV1WEF5YTB4TjNnbmNjcmtEeTRNRk9NQlRJSjAxTVNDMkRqT3JhZmlBQmtE?=
 =?utf-8?B?VC9BTE5XaEVLM1cxeDBlTHRUN0FEL0F5aHQ4VVFnL0Y4cyttbjl0d0NHTC80?=
 =?utf-8?B?TWxWWDYybFM5Q0JudkRrd3VOT21DYkROeHJhYkR6dW9KNjVWSzdVdEw3eDhP?=
 =?utf-8?B?MUc0b2o4SFYxbjVxMnlReTFLdVJXZFdiMFVsSEZ1WmdHYmZhNSs3VmxWb3lI?=
 =?utf-8?B?NjBmNGhDeVhzRkNPYVkzM3BjcTZIQ2s0NlpMZVFuS0JNeVNNckpZL0JpdHM1?=
 =?utf-8?B?SEpyMnZ3allIK3U2TjR3eUVDalUzTUU0TkZvcjkydnNFa1BTNnp3T3lidW40?=
 =?utf-8?B?bW5xNGlPZGRIdC83SWd1SGFHait6SVlHN2s5Zyt6b280QUhwZkZuZjcvREJ2?=
 =?utf-8?B?WG85bC9QM3BKeXJnZ25QancxRVRpYUlRSElXbU9Jd2REaHNIekhNQW5lOTJM?=
 =?utf-8?B?WEN2RmNEUTBNaDdqeXRBbWQydDkvUzdyNU1XUlZNSjRvaGZSL2lZcXVxVEsx?=
 =?utf-8?B?alkvdFVGZ01NNW9jVEVUS2dnVlV6dFV1ZHZsOUFUTDVUbVNDQjB6SVhPRWJi?=
 =?utf-8?B?bHpHeTlmb0JLL3RRbVpVdmk5YjRyNVhqSjI2anhlMEw0VjNEYTBaOTkwNXdN?=
 =?utf-8?B?djIrYUdzS0dVVmdhb0E2cURKZEdoZ1JKdUMwT1dVNFE1cUZ1TVdTcWZrUUM4?=
 =?utf-8?B?WmYxRzdndnVLdFdFd0dGMlpHRVBtMmNBQXh6blloTzR5RGxpWG42Sm1kMFJl?=
 =?utf-8?B?KzJEOFY0WUxkNi82TDhEQStDTm5Ha3JYcEZpRmgydkc5cGRzOUsyblZBRWJL?=
 =?utf-8?B?TEV3SGJQVW9HOWJ3elJZVjVxTUVQRTVVUHZXbEVCUEZmbG02ZTdTZ0FYdHh1?=
 =?utf-8?B?ZTRRNE5xU3UzQ0ozR09QeXQvWDFNbEdMK1krQ09OVC9aRGlKa2dNbjlNcXJP?=
 =?utf-8?B?WEpoTnRJOEV0KzFDTXlMUUptczdDdkp1NmVvY2trSUJ2azhLOFZNeWd6dVpH?=
 =?utf-8?B?UkEwTHlBcG8zMzNWZ01zQWhoNGlBSlNHbUVCNjJ5dVEvMEUzTlpFSGZpcXFS?=
 =?utf-8?B?WTE1QVlHeDg3V1BHVno3SUJuUEg5TjAzTFF2ZS9Kckw1K1Z1Y0tLRW1FSXlL?=
 =?utf-8?B?QkJSUlB3aTVpRlU2OWp3bWV1ejg2Q1p6N3JiOVQ1OWtWQVU2MndwSVJqV3Jr?=
 =?utf-8?B?bnVsRk5rcFpkQTNuMm92WU9leW5pU2d0cm1Sem0zdXUyUDIzY1Z6eXd5clZo?=
 =?utf-8?B?OVhsa1FLbU5vNERNWWY0ejBjejhLRGM4NDNyenc1TXJUcFFjaE9zVEYzODl5?=
 =?utf-8?B?NSttc2htQ0kwSmp1UGdmeVd4Y3ZFN1h1cnMxejF0MGZTek5Na0NrMVhORnEr?=
 =?utf-8?B?RkkwWnhsRjFFVGRhZzFvUnpqM0RpNU1oRmw1amZJMEwxTWZyeDlZZWFzMk5U?=
 =?utf-8?B?dUUyRzA1QnQ2N3FHbmNqclFaVDZVTDI3dEFBdWk5cWNnUUJKV3ZOdmswUVpV?=
 =?utf-8?B?SEhFRWk3VGtsc3BYWWw0N013SXQzTnNEcEpINWVYTG5yZnhjVTJqYkZOc3dX?=
 =?utf-8?B?aEdwWnVBT05idjlDOEo3amZBMkdORVJRUGtLcnBWbndUZUtYYUpqSlVLQ3RJ?=
 =?utf-8?B?ZWNPUllqbkRtdndIRSs1Y25YSElTcU1rWmN1V0NVQ29rWCthU0ZMbGsxZzBn?=
 =?utf-8?B?cFBPTitWam5qNjl2dXlLbzNoaWtaR3Nnb0E4ZUtiUzVxeHMvaW9YUFZxcVA0?=
 =?utf-8?Q?ubhL/5aqmPn6OoC0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9077c5f7-b927-497d-f1e1-08deffc72946
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 20:59:59.0992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P502RYFPaWxBKpCIA5yYcP5KkJ729LTaaewjCg41J60IWn0SFEO0UzQJOo01+xfq2PAWOp/NNLLE3LtfhDpD59dpuhklAmdKibZYk5cCaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5602
X-purgate-ID: tlsNG-4011c0/1787346002-534D7CFC-1AC46A41/0/0
X-purgate-type: clean
X-purgate-size: 1573

On 20/08/2026 6:43 pm, George Dunlap wrote:
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 1774966305..2fcaa413f7 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -71,10 +71,10 @@ DEFINE_PER_CPU(uint64_t, efer);
>  static DEFINE_PER_CPU(unsigned long, last_extable_addr);
>  
>  DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, gdt);
> -DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, gdt_l1e);
> +DEFINE_PER_CPU_READ_MOSTLY(mfn_t, gdt_mfn);
>  #ifdef CONFIG_PV32
>  DEFINE_PER_CPU_READ_MOSTLY(seg_desc_t *, compat_gdt);
> -DEFINE_PER_CPU_READ_MOSTLY(l1_pgentry_t, compat_gdt_l1e);
> +DEFINE_PER_CPU_READ_MOSTLY(mfn_t, compat_gdt_mfn);
>  #endif

I am not convinced by this change.

The reason we had the L1e stashed in the first place is because mfn <->
maddr conversions are expensive.  Stashing the L1e in this way proved to
be a win in the context switch path, despite the fragility it added by
needing to maintain a second form of the same data.

mfn <-> maddr conversions have changed expense since the optimisation
was first put in, but one form is now even more expensive than when the
optimisation was first put in.

Stashing the L1e means doing the conversion once at boot.  Anything else
means doing it on every context switch path.

So what this patch is doing is still keeping the double copy (the
fragility) but reintroducing the expensive part of the operation into
the context switch path.  If you can't keep it being L1e, there's
probably no point keeping the optimisation at all.

~Andrew

