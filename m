Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE9A606A332
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=qMTHiuuI
Received: from list by lists.xenproject.org with outflank-mailman.1498279.1696127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUQpl-0007Pv-EG; Fri, 20 Nov 2026 15:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498279.1696127; Fri, 20 Nov 2026 15:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUQpl-0007Po-BT; Fri, 20 Nov 2026 15:47:29 +0000
Received: by outflank-mailman (input) for mailman id 1498279;
 Fri, 20 Nov 2026 15:47:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xUQpj-0007Pi-Ln
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 15:47:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUQpi-009mOA-R2
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 16:47:26 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b006b77-bab6-0a2a0a5309dd-0a2a450b9e7e-24
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 16:47:26 +0100
Received: from [40.93.198.8]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b006b89-b7e8-0a2a450b0019-285dc608af7a-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 16:47:26 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MWHPR03MB989484.namprd03.prod.outlook.com (2603:10b6:303:2a8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 15:47:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 15:47:19 +0000
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
 b=Q9eV3UgaxIpzWBAQOVb8j/0JKc58H27HiCaLJzvvC/k2nSJQ1c1HRS8A9OKTYr+KL92OPNI1Hhkh41puvyXDjoWxlQlij0DjxJ7OvvHFe0X9xXwTN7IFFxfsy7sFnb4eHVREaN5IJOqTt490P2Owq9mfABivGU8zNpUrDGa9cQZNi1l/tx3xYFzGK0KLD0U+iGziqhakisa8vPAbO9UJTghOtuSYnhqtV069U81TPJX0tu4lT5PqXyQA+12aH1RWoIkVOz0xYNWtz/q5jF2GIeWIFqZjdL/qtdB7zxkHMI/bk9YrviZnYUgigIt7LORxX8vYrS9BXPAiHsYjKauqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=la+mP9ftGBKDpYTmR2zMy5E6U0eJ7d3p0TotaxhSGrE=;
 b=pSkURoimHOw+6ywlrfUhmXdIj7DFvG0lTQJCRUTT9C9xSkgEmZhIRlV+TjsKxica9sM56w2DXW/DyqNn3FPK46KKHsqY5rYHZ1i5BHELhp2qh1B8xjAzPvxW/uoaPsOsp0SiqYW9D3Qlu35Y3osKP9PEgvuzgSvcYpls5vPQJv46NSHP8QV8W3Jxp1whUeO/BS94m16Ee9ZFkBKMMn3ajc1I/H119rw6UsR/lbP7rDD0BdVp9ko+YdQgnYonEgI2Dj97tixD+IbB3F1bPuaKmtCQL24x4ewPxEexNXgn4kG24utuTgXSF+6loYjyy8RuCLx1Dy2A1JKSfUA4SmjqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=la+mP9ftGBKDpYTmR2zMy5E6U0eJ7d3p0TotaxhSGrE=;
 b=qMTHiuuITP+wP8C1h4Nqs49vivDOYhcQq4QrY82wyIqgSTEQujkhOOMu8N1+TR82YRpWVMppwtk9KYymrOsrGwvBbjPRtWc94A+2lXwpVZcz34LjLb2QEiNo+anowTrLdRYl65N0MAcMdntql/B5HPAdn6yce49IKqJ6lxKXQqE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e36dfc8f-62d9-413f-bf6c-3a806bbd0e71@citrix.com>
Date: Fri, 20 Nov 2026 15:47:15 +0000
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1 00/28] x86: initial SVM AVIC support
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261105013347.719392-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0324.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MWHPR03MB989484:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f03fe32-5d36-4824-bf72-08df471d8f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261026140227099003|261026121527099003|261021135927099003|261022105027099003|261028144727099003|261021121427099003|261022075727099003|261102124527099003|261102123227099003|5023799004|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ARqDtSEeY6QvqeYTZHq829LmTu1n7aw3aI4JYonNdfikvks6m2RLs0gp160brnD1JIwZ5vbuh1kzh18imx/ggPShkGmssbwWjIua/Rcqv2OhnTHcc7KwhB1G0TTTnSsMsx8V/1rQoCwJPhFtYqcoBAA5bU7FRk9ARK8BS8JPMdwC8IU9HzyTwAxW7ljf9fe6e35TVUQl4VGO+kUVSXP0prQOktoetndV+JOsyau3790OVLAsD/x+EtXzqJnm1OliDz91csMcHqlTD6o9GMXWvKbStF0djf3DatxBwKy+ZD3Ci+ePZaNeAnXv2OjP7yUxF8sMRNxp6MdFhWydE7vBtEPep5CdPZ8tq8b6eUZIsDLaWeTeDHvZv8JhYJnAPy9vh3CLzYiQL4rcgm4b+htdm5NHRNB04XaUsGBs/79/mQYTGfTvQpvD3OWK94FXvucDsD1TKJoYD1mIzDAW/EWMw9OPmheyzCGjELZYBY1CE8Hc6abwgC1D830Hhrkv+Pofb5me1be1FIOftVIzlv5y5sLqKBzomhLoT9Apts+UQBRnLMPTF7mm0weLMckDHIi9IWeLaZAia7yjElTu/QlTc/guZy+QTv7IDy2TctYCBjdGttH1qy9nT4qkKXYjQr2kE8H0DDaqVCZpW64jgfYtigAW67YmwP1WljPfdk4+k6w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026140227099003)(261026121527099003)(261021135927099003)(261022105027099003)(261028144727099003)(261021121427099003)(261022075727099003)(261102124527099003)(261102123227099003)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QS9qcFJ0QkdIb29VdXB0eFBTOTY4VHBiTXNtbVVxMlVoSzAzWThQemRiK2lt?=
 =?utf-8?B?RTVvWnRXNGRqN2hlYUdaSEYzbklYRVcrOG1lZDVlOVlTNkxmSDlPbncxdVVn?=
 =?utf-8?B?ZkNrbjZGRXlUd2J6VCtrTGo0L3BjVkxwMlNjRVNhbFUrRlUvdDJCTkkvUVY0?=
 =?utf-8?B?OGhIVjJjcU5RYkRWd2lFRnF5c1ZoeWhCQWNpUkNQL1ZzWWRqay9YckdTYnNr?=
 =?utf-8?B?dGw2ZHdNTkhOQTlFSVdhMmRpajFhNmh5RTRvZEJvSlJxMHd6eDc2L2V5OHQy?=
 =?utf-8?B?dHJRbTRQNG1sYitsYW5rMEVqcWU0bWV5WERxSGRvUUFrdnYxV0hhZ0Z2LzVC?=
 =?utf-8?B?WlowbWNjUHRPdXVWTzdYOTZoREQ4c3Y0SU9Jdk91cmt1QTVWYmZQcGs4bG9M?=
 =?utf-8?B?YmNwM3dESCt0eXQ1VVRtN3FrbmJBNWgwc2ZYSEhDRnNUTHhIdzVyQmZNZGxC?=
 =?utf-8?B?d3kyNHRUZ1V2cEFSbmNlSmZxN0R1OE83SEN1ZzF5dzBNczlQWW9EVVF3TWtD?=
 =?utf-8?B?L2VRMjgzZ3ZkWElBeHBRb3dOMDlIRWNMd2M3OU1DWTRjWVVva01MdUVZdEt1?=
 =?utf-8?B?TFlTVnZoZ3o0TGlXT1RHNE9SNVpaMjJHSkhON3VJQWVqUGRmQnI5RzZsK2NN?=
 =?utf-8?B?WnNaMk55SWdwa0h1Y0dscjZMZUZjMGR6NnhMRHFMUEhxWmhqOTByczhmZUth?=
 =?utf-8?B?Q2l0ZjFBZG5sT29VSFladGdQSmI5T1lNdXBWc1pxS0hvSUszb2hzTGwyOStK?=
 =?utf-8?B?Z0hyeDI3c0dLY29GWDdEQ0tNSmY5aldPM3AzbUtNdGRnaXVRQjRZTVpzcE9a?=
 =?utf-8?B?YlNPMmRlbSsxeXJCc2J1cXI5UGdubzgrUDNOSnY4VWtiVlRMMWxEYUZnZmll?=
 =?utf-8?B?TmhGbmxIM1pXK3R0MnJPMDZTYURVbFVabS90YVVrenJKNHhwQ1pkRU9nd1ll?=
 =?utf-8?B?T2p1ekd0UExVYSt4dEFjQ05iZnpndE1VamRZTnR0Znp5Wk5GdWxRbHZWVmk2?=
 =?utf-8?B?eWlVakhVUjh6UlhLS013RjFVKzl0czNOZGVkc2s0ZTlXYS92RWk1WUpBUmxO?=
 =?utf-8?B?SWJhckF3L2p0MnIzYU1hc1VpenVRZGJzMlA4T3Z2S2VtTWZpZWVORHgrN3g5?=
 =?utf-8?B?Zk1xV1lqVzdCSkhTN01MUkZnMjJ5V0Q3SGFiMkdUQlYySzUyM1phU3QxaStt?=
 =?utf-8?B?Zmd4dXB6Nk9WRGQwN0lnL3RQdU9MMjlHODZ2eXdLd0NONmRZVUdnOXNXbFVu?=
 =?utf-8?B?TktqSCtEYVpISHVNeXBacDVuS2FYTWJVRENjYlZlakxKaFZ1OFJkMks2U2VK?=
 =?utf-8?B?TGtVNkwra05YeUlveUp0WVJEU0xKWnA0Qkp1T3J2cUszR1MyM0JxcEVieTlz?=
 =?utf-8?B?bEdKSjdldllSNjZ2eVpQQkJDcERnT1JiUjUxTlpVUGI3R2RTTFdQVS9xWFVa?=
 =?utf-8?B?S0lsTWc4ZTU5MmRrSjdGVEZ3cWVjY3h1a3FkaTBiYVNERkkzd2lvNThCeXhq?=
 =?utf-8?B?WkFGSkt2VVJ1bzZHYnhVd1lQRG5NSUROcFRwTHdWd3dMSTBOWm1FTllPdkpX?=
 =?utf-8?B?QU9mUWhWS2xmME5SYkhUbXJkY3hUb3NNUmt6QkczYjhXVmFoZmhDVHdSbEhs?=
 =?utf-8?B?bnB2dVUySThMQVJDRnRGcG5FdWtiZ29ZMVpqSUpYeVRWd3NsTmlPbXJNcHRS?=
 =?utf-8?B?K05vR2svYjArWW56ZUQzWnFVYkpIZWZiWTBad1prSGF5NkovMUJyVHFoVjJj?=
 =?utf-8?B?ckRMbGtGQzg0amVmbWdRMzhDM1FGdGxKT21EUkJLK09uSEVXYm56eXFVY1pk?=
 =?utf-8?B?OW9wUWEzckI0OGtwUmtLcjFTY0tZZVVGaWdKUXZJU3NuanZqK0lSTkQ0dWNF?=
 =?utf-8?B?OGpkZTdJZy9LUUdES2RaRTI1dytZTGg3ekp3UEQvZVc0Nk9YdURrRE9DVDdz?=
 =?utf-8?B?Qk4rNit3dkxDK2U0N2ovaXo4SVVSbm51d011WHRzZnp6NjNqVVI0WFRpVXRI?=
 =?utf-8?B?N0pyMnhTdXpPeVFOWUlwa09FaHllS3FlWEN5NStxSHhma1R0U1dqdlRtaTYx?=
 =?utf-8?B?YjErY0lBb1cvSDQ2SFNsN0RqbmNBYm54QUVQd0VNWkNvRVU5K1Bha3BxM1Y3?=
 =?utf-8?B?OWlZdjNtT3J6ZmlnMXBkZ0dKMmlBa2w5dEVZSngwQ0lUQzNQdHlNKzFJNmIv?=
 =?utf-8?B?dUNoZjVTTllHYWgyNXdNd1E4V0VBQTBBbHFCSUFJa1hZQ1p2WFN4bXNnYTNG?=
 =?utf-8?B?UFQ5U2JhMUJBemN0K2V0M3MyM0hPV3NyRnNmRWhHK044VVVQSlRieDhabjUy?=
 =?utf-8?B?eGl2ZHBQa2NSY0tGQmkwdVV0M1pYb0ZaVkI3aHZtZldmTzhsYm9ZZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f03fe32-5d36-4824-bf72-08df471d8f0e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 15:47:19.0504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yApbHPg/sXndTTwZAXFOJGZPObjmCUPJNyfEga8o4on/TUwJNzt0nBeOG07dvku4K5326lLkqYHXbtgQBNhey9oIZc9dLUjNvuLXOtrAhL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989484
X-purgate-ID: tlsNG-42698a/1795189646-192CC9EA-750FB00C/0/0
X-purgate-type: clean
X-purgate-size: 5208
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> Patch Series
> ============
>
> Basically the entire work is divided into three big series:
>  (A) Current series: initial SVM AVIC [5]
>  (B) XTF interrupt latency test [6]
>  (C) XTF infra in public CI [5]
>
> For this AVIC series:
>
>  Patches 1, 5, 6, 9, 11-16 introduce various cleanups and fixups.
>
>  Patch 20 changes XEN_DOMCTL_debug_op implementation to allow
>  more debug operations added (like enabling/disabling AVIC at
>  run-time - used by the XTF test).
>
>  Patches 2, 3, 4, 7, 8, 10, 17, 18-25 represent AVIC implementation
>  including performance counters and run-time controls via debug
>  hypercall.
>
>  Patches 26-28 cover various documentation updates.

Sorry this reply has taken longer to get to than I had intended.  I have
committed a couple of trivial patches, but I think the rest of the work
is going to take a bit more complicated rearranging.

First of all, I think there are two areas where we want to take other
pending work as prerequisite.

1) Moving the SVM/SEV leaves into CPU Policy.  (Series of mine needing
dusting off and re-posting.)

In patch 4, you introduce a new command line option.  I know Intel has
one, but it is part of a bigger anti-pattern we're trying to remove. 
Wit the SVM leaf in policy, `cpuid=no-avic` on the command line will
work to hide the feature from Xen, and without much effort we can make
`cpuid=avic` work as an opt-in until it's enabled by default.

Also my series removes the SVM_FEATURE_* constants (they'll be
auto-generated now), which simplifies your earlier patches.

2) Removing the vcpu_id <-> apic_id relation.  (Series of Alejandro's,
or at least the first part of it, needing dusting off and re-posting.)

In patch 7, you encode the guest's APIC_ID as it's vCPU ID * 2.  Yes
this is currently true, but we're desperately trying to break this bogus
relation.  It prohibits providing a sane topology to guests, and is one
of the hard limits on HVM_MAX_VCPUs being 128.

Alejandro did a series making topology selection work.  The first half
of it at least gets into a position where the toolstack chooses the
APIC_IDs and we've got a proper variable in Xen with which to derive
everything else from.  Getting at least this sorted will give you a
proper base to build the logical/physical table upon.

3) (Bonus).  We need to take a decision on whether we're going to block
writes to APIC_ID in xAPIC mode or not.  I sent an RFC patch.  If we do
decide to block writes to APIC_ID in xAPIC mode, then it means the
logical/physical table is static for the lifetime of the domain.


Now for some feedback in no specific order

a) Please have one single patch adding all the architectural enumeration
in one go (CPUID, VMCB, etc).  i.e. merge parts of patch 2, 3 and 7.  (I
have your patch 7 rebased over the VMCB cleanup which was merged after
posting).  I find this helpful when reviewing because it separates "what
is needed for the hardware" from "what is just internal book-keeping".

b) In patch 4 you have a single static avic_apic_access_page[].  That
was XSA-412 (3b5beaf49033cd).

It's actually worse on AMD.  On Intel, any writes targeting a
non-register part of the backing page are discarded.  On AMD, they're
deposited in the backing page.  So, this page *must* be allocated per
domain, and not global.

c) AMD has extensions to the APIC spec.  AVIC even accelerates some of
these, and you feed the accesses into the current vlapic
infrastructure.   For current CPUs, at a minimum that means reverting
changes to eLVTs, but I think more generally we should probably have a
CPU generation check during init and refuse to turn on AVIC until a
human has checked which new hardware features leak through.

d) One very fun bug with AVIC is that a misaligned xmm store can write
to two different registers at once (ymm can hit 3, and zmm can hit 5). 
The whole write gets deposited (contrary to Intel, which explicitly
discards outside of the first register hit), but only one VMExit
occurs.  This allows the guest to write reserved bits.  We need to
confirm that nothing in Xen is going to malfunction (e.g. check for
BUG_ON()'s/etc. which ought to be downgraded to domain_crash()/etc.)
because of finding non-architectural state.

e) You've got a number of fixes for interrupt-related things.  I think
we need to get those fixed first and with robust testing in place before
trying to add AVIC in on top.  I'll see about dusting off an XTF test I
have on the matter, but we really need to fix CR8 handling before
building further.

f) I'm not overly convinced with making use of debugop like that.  For
now, maybe defer it to the end of the series.  I have had several
occasions to need extra hypercalls to make testing happen nicely, so I
think there is room to make something, but I suspect it will want to be
a little different in nature.

I'm sure there's stuff I've missed, but I think this a long enough email
for now.

There's an outstanding question on patch 5.  If you can answer it, I can
commit.

Thanks,

~Andrew

