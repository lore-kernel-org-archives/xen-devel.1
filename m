Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233A6C982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 11:26:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427348.1650055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8c9f-0004sf-SY; Mon, 21 Sep 2026 11:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427348.1650055; Mon, 21 Sep 2026 11:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8c9f-0004sY-OR; Mon, 21 Sep 2026 11:25:51 +0000
Received: by outflank-mailman (input) for mailman id 1427348;
 Mon, 21 Sep 2026 11:25:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8c9e-0004sS-69
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:25:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8c9d-00CE6N-0r
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:25:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab11439-8faa-0a2a0a5109dd-0a2a4509b64a-14
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:25:48 +0200
Received: from [40.107.130.122]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab1143c-be1a-0a2a45090019-286b827ad6f1-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:25:48 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DBAPR03MB6613.eurprd03.prod.outlook.com (2603:10a6:10:19b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Mon, 21 Sep
 2026 11:25:46 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 11:25:46 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDmn9iy6RL9NmuXy2lUNoTGZxVvGOBTYr4Z/Y/nRr/G1gxbxh9ZJ6otfCsjixq9AY34i2fw+bc06AV5NQ8iiheGdP/IeD23st/2hPCm5Z9uQ05sB2ygKyVxXfU6JwuXrWUWIfek+qsYGzQ4zKqcIw8gl4kwMuBsZJOTTRgmd2E92VB2bQzWmaHmDfXnNCtR4rR1bGTjQ+I+tOEgzpeT0nZcjnVlth4/7aM9Hd1zBJXLORRcWfTIzA/yStL7EUHuRBSixJbQvKDBVsiyL25/rUQUaGlMYS7cXgFkE991ssNyxl0LdV1gf8yAlWkGoTAx3Ca2uDx7DYIurDHmQgSjWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gInDqvUmat87BsFtiV4wX/Ma1zOReKqD0U48CEuYybA=;
 b=sv4Rc03R5jRvwCO8Oyg9awrJDtybqVDMeaXL4dTVTRlXUd87d/VJ+f+YtceADbpoRzRa5m+ziLV6kEpECO7DB1JnA8KNzXcpyepNtP/A++jQMPY5CochoNTyQsEjBo5gvgYTmxGfE79euNwucT1FVAj/wxemSocsJ8ASgBvlxXU0dGuuchuGflr6RXCkUU0h8JEGZmKdS1bWUG6Php4mBlcYrdD7MrZ6ClQ9AAjYL4OWdw/p7EO3Jp9wGudJ06K+i3Qfq8M9MZmyl6QUsnuFV2Zg+VrAmmnscSisQBr3KEmcj7lEXfucyw9n/xKFigTC6uzZi74e3n2ChMcOXwgoZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gInDqvUmat87BsFtiV4wX/Ma1zOReKqD0U48CEuYybA=;
 b=SSDDfFdlqJ+pPCdpKg0/u4lXj+xFOpnoOm46vQ0bm9vkTtrfn6d+0t9ObWXznxNEKunrK7rSCmyYWInnJhOq+hG79e4CGeU18tIqq0JSeJHzBxB/vcInfGMfsuyzPhjXz2YGxkRN1p83ILNzLJbwNAN/uIxVYO3KTWmYESrmsPbeoNOg6/9yKOR3i8oxFrn+FxgbyP/TNFf8VNKicmaqlHfwUviOxphg5WdnOdjyb0ucflWepD4DWATwk7+jQwH1/E/+omnT4SjOggj6BPunExIxocPbi48SEbOPYb10BAClLd0d+I9VvaoQf1aDuWlmqvTBSqlNeCtUYvzc8X9ahQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Mon, 21 Sep 2026 14:25:42 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/4] xen/arm: make is_espi() a pure range predicate
Message-ID: <arDmDKZmYXYI2CW1@EPUAKYIW02F7>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <8e42437f8abca2722f1a2e2568bbb5b938c23e85.1787050437.git.mykola_kvach@epam.com>
 <fc7d64e7-1de3-4d8a-ae88-abfbc2735624@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fc7d64e7-1de3-4d8a-ae88-abfbc2735624@amd.com>
X-ClientProxiedBy: WA1PEPF00005B86.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::618) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DBAPR03MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0d6446-8934-499b-b80c-08df17d314a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	imzUX6YiR7EqwvfI6TRzZKd5KZH85Dobk1sQd/OLqzkUhatX0DtQQipUMvsS6udTN6676DZMayvXuhpu2NDE63QEZzKfINTaJ9KbLEggHCnL9JC2R2R0nHzIueroYAgbZ+SY2sizVPwLrDTCEclAnX4RpSbkpipO+sgSQThc+O3PFhntoFLijT8yzlBK6vbtmSoS7B2W1UgjTtWwqnzXFRNKAip1KtwF7aR+E0RFtWNsxXSk43l5180qO6icBOdg921ve87Lz9hh/U1x/+9AY9MeLWy/Z0g01lgMATO6iz5dyENVU1usXVhOPW8rtqPPVKE6/pTF6jCnEx5fcWkyxR1iBPfEY7DP57W8v0BBtcfVY0KrEK6XV7ZaQwSkoQVuCWGyOet4KCYAs70tFOceGybIEIUhk0/yu0kw571DRY6Rb6gVmpnobPSIn1Phnzf7fSoJ4/NKgSxnloDabE74yNcaYMeZWOXFnXfHD6KC3MjpN2tOWJQZezcCK18CEWae9HcSF9zLn6vRdkBqzcpClps7Ry3oLSy1qi0S7iK6V5/minArmmrO4lh/q91KGk80t9N/0IVTHyMb2nfJVahHiMPp2Xvyf1rkRXZe6gUDzrp712IwCL0D0wrtdgqlk9IhE1xO7egmcyMhJkOR8MAfnnjNr0wytPw/hlIGLkbiqLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0txSjhDenVsUjFzUmk3QVczTmczeHgxREZ5QzFDU1VoOHcybjM0K3pzNXR3?=
 =?utf-8?B?bkVsM2w5c2VubjdyZ0phQVI5U0JpTkJlb3UyZG5KdjJ2MFg4VGtWT2trWnN4?=
 =?utf-8?B?bmJoaXh4NnpPcjlKM21DY2ZKK2RyQmQ1dTcyd1Q5U3FmcDJCNWRHWWhKaDZt?=
 =?utf-8?B?SkVZUm5ZbjNFWHMvNEE3TFEveEp6ck1hcXRvSXNMOFMwcnBLT1dpNm16ZXZH?=
 =?utf-8?B?MjZFMFFkL0QzU3o4QVErUmFWb2RMcTV3Zm9DT2w0RjhiRWNWWTRNaUJTTTVt?=
 =?utf-8?B?TlluUGgySkljbUhtWS9paGliM2RxVE1vNUlsb1dyMGNYZGxIZnVqcTNaYVlJ?=
 =?utf-8?B?Szhjb2NMMWp3VzczZ1EyVE1KdVBLdjRURUtKd3d5c3paWE41RXFvaUZvZDNB?=
 =?utf-8?B?emFGZG5NOTZpNmdac0dLajVoVjF2akRLc09LTTY3c3ZCUnhBZnhrNnREMEdQ?=
 =?utf-8?B?aHl5V1VoOWhHNEE4U2l6blR5eFIxYkg2NzVyd0dsNFNYSmpubkMrQ0U2Z1Nt?=
 =?utf-8?B?T1kyTk0wdEpPRWFpWE1wc2Y5WHlXOFVjUHdWZ0hlVmZjM0hWTHRkdGNtbENO?=
 =?utf-8?B?M3ZTM3AxMGh6dHExMzZkMHRWOElVSkE5bDBoY2lsUnBKdzRyUVp2cnNpb3RU?=
 =?utf-8?B?bGpBbnFoTE52dW8vSVdmVE9Nd1hKcnFMSzNCcFUyeVRadFNUN1E0NEhVazdJ?=
 =?utf-8?B?clpqOGp4Q3dEeW5TQUFpNGY3YTRnQTVIK0M2NER5MUVrMzFvbUdZTzBaQisw?=
 =?utf-8?B?Ukgvbm9oNGpEenBmWFV6c3lXdURuNHRWKzExS241RjBBS1hCRmdjQzZmcEpj?=
 =?utf-8?B?aTdGRGFIMHgrK09qSW9uY0JWNTYxNTVLZCtKVmh3S0VNMWRXUHFUcGRjQWN4?=
 =?utf-8?B?UkxxbVdUSWdSVnlldkVRZ3VKaXcxYkk0VWVpdStJTDRZcVREcncyUDU5NTZs?=
 =?utf-8?B?MWE3SDBnaWFZS29DL1UvNzRycjllVXhWMDdVaE1RU0dSeHZqeG1PVU12b3F1?=
 =?utf-8?B?UG9vZXRNRnkyUjY0RTJQdE5aM3NoaUZrOXBnUjZLTEh3RFRrNEpIc3lBQVZE?=
 =?utf-8?B?UDVnbnFwN0EvMklsRE1BYkZ5MzJwOXhFTkdjcFd3NnRQMDZNcGFVSCs0ZDIv?=
 =?utf-8?B?enc2cFdydlJZaE5MWkljUGdQeVlNOXF5V2lUZVFIR1FZNDBMcTFkOWJPd01J?=
 =?utf-8?B?VWN4aHRIR2FZTndwK0NFdzZ0RnFuN0tQNGlKSGFGRW8zSVJqMWhnMk1zbmha?=
 =?utf-8?B?dWlnUE5YMmxrbFljN1B2ajRLK0dMdVNuTElYR2JnZlFnd1IvNjRqUHJINDVy?=
 =?utf-8?B?YnhweTgzbVM1TTFiUVJ5bzBMa0ZodkwvemRZaEdPa3RhelZlQmprYVgrY09n?=
 =?utf-8?B?aWVPVWNSRmdUR1pNODhheXVSeXNVM1M5ejZ3dGhMdVdLcG43MWMxa3EzRkcw?=
 =?utf-8?B?RjNKYmVObGQ0RUwzNzQ3NU9KMGJObjVSaUZjd2VtOGJIZkZXQk9keS85WExr?=
 =?utf-8?B?TTZIbkZNVzRqV1JWS3dZcFlEM0h2OUNLRlZSOCtuaVFjTnB2TStwMmdvWWs5?=
 =?utf-8?B?c3krb3RzL0MrNVU3RXhQd0FKVXFPOVZYekRkcXhud3B4aWF3clQrY09oaDVz?=
 =?utf-8?B?TGxqallUZWZFNnNGVWFobUpHRmJ6K1FEZG10MnBTUlJzeUdnZWc3ZjNtZ0xq?=
 =?utf-8?B?MExjbndUcUhETytqZjE4SXBmOEtRc2M3VkNYNnM5Z2k5K0lJZHpIM0c1ZUpv?=
 =?utf-8?B?clA4U0dIcTBlSkZsU0NUd0VqLzdaUzNoOENlbDA4SjBsemVObHdMOFNzdnZO?=
 =?utf-8?B?Sm5ZNnZCa2JJMXJ6SEEvcmVHZStPL05vUlcvSVAzMUw5VDFPa1hVYzlXNllY?=
 =?utf-8?B?MitUZ0NhY1pNRVByOW9OS25BOWZmODAvcVFwQW1pSUlMRWp4M1ZZdjFLYXNS?=
 =?utf-8?B?ODhBRVhNRHQzQlVGUWgyQjJmYk1aMDMvY0lOQ2dnMC9sbDlZZjBrZHJnbnJC?=
 =?utf-8?B?bzkzYzRvRzNEYnIzWU9Rc3VyTVM5NGluQVNyQzBHOG5oZDJTTHBNeENicVJW?=
 =?utf-8?B?L3lCbjB0NWhtTDZERFI5SmJFQ2lHN2F5a2wxaURYdjhsSTR0KzJkeWYyaWEw?=
 =?utf-8?B?bHVYNHlnanc2dHZOVmFHbkpQMm02ZWQwTTlvTXEvZjZVUEs0elJGZmZ0TW95?=
 =?utf-8?B?YnQ3MVdoSTgvVW5NazVMUURRZlJvdFRwNDAySm5RTXhSTzNPZVY0K09vbzJR?=
 =?utf-8?B?QnlsT3k0M1FGa1dVN1BBdUZhZVEreXhZV29Qb1dtQmtmVHJiRTBqL0xoa3p3?=
 =?utf-8?B?aXBZVDJ1akxXWFlzVE15STd4VXpPVThyNWQveWU5ZUJOQUpLQXNtUT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0d6446-8934-499b-b80c-08df17d314a8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 11:25:46.4383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yIH/5DtaUZ4vNs33oOnaEStFW4AfqNNITsR7Pke/aUZDR8bQrpnKH3lhcPP3AK/0jQY19MjNYTvCT+gnYEGkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6613
X-purgate-ID: tlsNG-bad1c0/1789989948-FD469034-9F88B93B/0/0
X-purgate-type: clean
X-purgate-size: 4316

Hi Michal,

Thank you for the review.

On Fri, Sep 11, 2026 at 01:03:28PM +0200, Orzel, Michal wrote:
> 
> 
> On 18-Aug-26 13:32, Mykola Kvach wrote:
> > is_espi() currently changes its result according to CONFIG_GICV3_ESPI
> > and asserts when an eSPI INTID is passed to a build without eSPI
> > support. This makes a range predicate carry configuration policy and
> > causes callers to depend on its hidden side effects.
> > 
> > Make is_espi() report only whether an INTID is in the architectural
> > eSPI range. Gate eSPI handling explicitly at call sites and preserve
> > the debug checks on paths where an eSPI is invalid without compiled-in
> > support.
> > 
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v3:
> > - New preparatory cleanup requested during review.
> > ---
> >  xen/arch/arm/gic.c             |  5 ++++-
> >  xen/arch/arm/include/asm/irq.h | 11 -----------
> >  xen/arch/arm/vgic.c            |  4 ++--
> >  3 files changed, 6 insertions(+), 14 deletions(-)
> > 
> > diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> > index 078049e741..075e1d2c50 100644
> > --- a/xen/arch/arm/gic.c
> > +++ b/xen/arch/arm/gic.c
> > @@ -348,7 +348,10 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
> >          /* Reading IRQ will ACK it */
> >          irq = gic_hw_ops->read_irq();
> >  
> > -        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(irq) )
> > +        ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(irq));
> > +
> > +        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) ||
> > +             (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq)) )
> Take a look at LPIs that are also protected by CONFIG option. We don't ASSERT
> because they are gone in a release build. We want to BUG() for eSPIs same as for
> LPIs if we cannot continue with this condition (we haven't configured/enabled
> them, so it's impossible condition where something went wrong). Here you should
> just BUG().

I will replace ASSERT with BUG_ON() and remove the extra config
check in IRQ dispatch.

> 
> >          {
> >              isb();
> >              do_IRQ(regs, irq, is_fiq);
> > diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> > index 09788dbfeb..c29f3d04a3 100644
> > --- a/xen/arch/arm/include/asm/irq.h
> > +++ b/xen/arch/arm/include/asm/irq.h
> > @@ -66,18 +66,7 @@ static inline bool is_lpi(unsigned int irq)
> >  
> >  static inline bool is_espi(unsigned int irq)
> >  {
> > -#ifdef CONFIG_GICV3_ESPI
> >      return irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID;
> > -#else
> > -    /*
> > -     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI is
> > -     * disabled. Returning false allows the compiler to optimize the code
> > -     * when the config is disabled, while the assert ensures that out-of-range
> > -     * array resources are not accessed.
> > -     */
> > -    ASSERT(!(irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID));
> > -    return false;
> > -#endif
> >  }
> >  
> >  static inline unsigned int espi_intid_to_idx(unsigned int intid)
> > diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> > index e5aca17dcb..e14123a30a 100644
> > --- a/xen/arch/arm/vgic.c
> > +++ b/xen/arch/arm/vgic.c
> > @@ -718,8 +718,9 @@ struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
> >      unsigned int idx;
> >  
> >      ASSERT(irq >= NR_LOCAL_IRQS);
> > +    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(irq));
> >  
> > -    if ( is_espi(irq) )
> > +    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq) )
> Following the LPIs, irq_to_pending() returns NULL if they are not supported and
> we somehow ended up here. We should do the same here without using IS_ENABLED
> and ASSERT. Note though that for that, some call sites need to be enabled not to
> dereference NULL.

I will add an espi_to_pending() stub that returns NULL when eSPI
support is disabled.

I checked the callers. They already handle NULL, check the IRQ range
or register rank, or use allocated IRQs. I did not find a need for
extra NULL checks.

I tested the proposed change on QEMU and FVP with eSPI, ITS and
debug support on and off.

Best regards,
Mykola

