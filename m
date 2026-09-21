Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD06C982DE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 08:07:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427133.1649752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Z3v-0002a0-0O; Mon, 21 Sep 2026 08:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427133.1649752; Mon, 21 Sep 2026 08:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8Z3u-0002Zt-Ty; Mon, 21 Sep 2026 08:07:42 +0000
Received: by outflank-mailman (input) for mailman id 1427133;
 Mon, 21 Sep 2026 08:07:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8Z3t-0002Zn-HY
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 08:07:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8Z3s-003WJZ-Fs
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 10:07:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab0e5c4-bab6-0a2a0a5309dd-0a2a450b9b8a-48
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:07:40 +0200
Received: from [52.101.72.114]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab0e5cb-b7e8-0a2a450b0019-346548729991-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 10:07:40 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS2PR03MB8772.eurprd03.prod.outlook.com (2603:10a6:20b:553::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:07:37 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 08:07:37 +0000
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
 b=Y8eETPZwqVGqcJG1FMpkf9H6RYhiZT1uGmT0mysveGHlHcqrPbNgvz+w7Wj/YZ0e5uz+vMIwRMvxl2TyCfr0Eins/IsIL0avOF565HtvmNhvSU4N5BUCGXNQnuyFyY/Vu++NIT0nGhxUKQb26Woh23XLH4YY8SdKoHigJDMCCnbCMEBx60eAwJIAP4TAMAhyRdnpM52tP1+9qo56KyCbq5pr3+Mhj1LRRORQY3avFcrEdryT2E8NkhXAY0fz8D2M78cpLu6v6jf1A7uHPYdYDG/nPB7bjqfhEPr0yoB+r0zghplGbG7U9iKjGPvzmk3xaZIADfAJF5ljFd2EqM5+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvwLDzR5sUVcCzmMmiZ74UtWe5DtMurUl/eWE9De9aM=;
 b=AY7+wVrrCWUrCyYEZsSOD8bAwu3O7sUt+0X2U9/d+A3uqKNbKj79MDf7aCDZeKRh9U7QnJ9CvH78alQkQdHrQL20a/AB2h8EOZf+NUMjywSbEps8FyTKgICQ9ECPEKYvwhiqTFfNwhAZc5GgJogHHealvo6PtAj/ftczequtbTFq/zW+w9+9T22K8+SMf0Z9wL6oQDgYK/Uz7ofoApWUykvz64R200PnmhJtVz3MjUwjkO4phRxVFD2tAYXOq/FHaGsrIYqiIsn7E7AO7YCBWMuuDyG+5/WNOMfMIz3dtuX3KJ6AsL1IUUratMJZtaklGtXIX4UrS4AeramH9DvUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvwLDzR5sUVcCzmMmiZ74UtWe5DtMurUl/eWE9De9aM=;
 b=aVEWXGSlfCzktiz1zZ/viRBDfIyQdFxPTGfAgbzR7z83uXpztlb8c624uWwEkgXNk75qMcy7A78JJMDjP5ZYQ1IQPX6v+JE9GbYml4smfW6hJ2rdQGM6sVwYjBSxshGNGXviC1eq51hESj3W08Rx56GP9mBaVL2QzoYTQ8pDxav8GKcurMR/8Mm/I2K725e1ETSn22ny33OIe50BftQpvZ6Wt7PM6mUf0arsIIJjK01R3xu9PcB1pQLvC9yZXmZSlQoi1S9IAzGCWGUN0xTnQZjOlQCKDhyZIiKL419K6GBZTa0apIeyBfXlzpXgUnRje3VG6whsd3leSNgn1QjK4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Mon, 21 Sep 2026 11:07:32 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3 1/4] xen/arm: make is_espi() a pure range predicate
Message-ID: <arDjKs9ag2YRavEo@EPUAKYIW02F7>
Mail-Followup-To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <8e42437f8abca2722f1a2e2568bbb5b938c23e85.1787050437.git.mykola_kvach@epam.com>
 <87o6erxd1a.fsf@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o6erxd1a.fsf@epam.com>
X-ClientProxiedBy: WA1PEPF00005B70.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::609) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS2PR03MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: d700d524-afd7-4ea4-b084-08df17b76645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|6133799003|10067099003|5023799004|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IcjFi/PNRTsX9Ll+JUC8yFCasv+/ijU3K7zl1o7RJB3jX9Z/plzuh0iZlaN7NcLA+SZUzdIL84rFT9zthuWhzvGGC6C0inh83niEoDTPoEPR0N11zfOClODGZ3fLvbxqzOED/SQebleaF3THOktQfiKYSVDVlHI0c1bo3LsvyyumILB/rkEnqldk6J3X12DXONyJ2fXshE7n57Qaz564x9nvpGVtpRCpwtyTISYYfJiae0jtreFsQOY/gGyfdYRb38oTIMRz6SN1TGW/BSx7tXcqF3ehkBF1XfszoJhng7+3kz2q2OpcEuzvOq4nMV0Nq9tvMdyu8e1m1A+M7hB39uvDNlM2km2XycIc7xgV7GxeCDSU2q2bcRpPT0+jb68gY9fKSIm76Cmx059DxLV9MoovJk6tjlYH+MTSQYOR7wzfB05iIq9xIG1Ihth7oVRnaBtRrplz8RVYG4aw9Z/8Uwy9Hv40NvlCqXrT0nyse56pUDShkZg8EDjnIAI3RWGW2JQyxBpucrdFo4CT/KUdiqzW4GC+o/WwueNC9c/zEXanTSmeKXEa4AtF+ySwhlA80ACPKd8o48xNhsegVkShCYmNQXMd081iza0+MfY7ORMHkHgrcG6O4xaik89aiCWo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(6133799003)(10067099003)(5023799004)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0tpQ2orNmRaU3VUaTRyR0NvaFlXa1NLRlhEYlNaYVZhMjZsY0dKUGNhWllK?=
 =?utf-8?B?N0dhWGJnQitWSTkxeXNHRlFlanBrVzhEMzc1dXU0M3hkajVTb3JOTGk0M1M4?=
 =?utf-8?B?UXRUeG00N1dpblNvRk5ld1gvcm5iSUEzTWl0T0hVdTB2Z0FBL0VBeERJZW1H?=
 =?utf-8?B?Q2t1dFZLZmd1cVFoKy80Z3J0RGd2bnJaR1NKOGl5bmVWNmhzN0lsUlFWaXBs?=
 =?utf-8?B?ekdxRVZuR2pwNWQ3SHhxNlB5MVBwUyt0Q013STNkMDZzZlZpOGhDa1p2SC9S?=
 =?utf-8?B?ZjN6RmZ0SlgyZU5YWFZOVlJFS2tMVUFPS0N4eldMdEs3Si8rbzFqbnRmaWFJ?=
 =?utf-8?B?bi9GZG53SytBWUduQ2hvL1I5eXl4UW9pSEViSCtvMEQ0YzdZQ01TY0gzZ1I3?=
 =?utf-8?B?Y2svdTNrdG50K0UzOVBPclhteDJiT1FTS25Fd1VZSUl2MFFUNTMrb1lkcEky?=
 =?utf-8?B?OCtsbHp6RGZwNXdBV3N2VUJTNFd1cCtUS3NJc29DVStCQ0FZTzVlczNqRW5P?=
 =?utf-8?B?bjVrNjJDU3krTUVCbklFVXdjUnNMS0hYVHozQmR4RG4rYjYwV2kvK0lhWFdD?=
 =?utf-8?B?UFpzK2g4bzdyN0Evbzk1eGhWSmVpeGVOSS9CKy84am1nRmJFaXNIUVNFSUEz?=
 =?utf-8?B?aldXRVFITWdYNkZGTjk0MUdleS9CWWEyVmRqMlZGNk5Ja0hjNWlWMDJZMmRW?=
 =?utf-8?B?bWpqZmFBNDNVVlJzWEJ6bmI0YWhzbXA3OG9uU1dRQ21JTVdoaHpPajVWSThC?=
 =?utf-8?B?VHVBeVY1c2l2a1c4bmdOelB1cTRMb0VZemRiVEJYNTJySWR5NE4waWwrbGVr?=
 =?utf-8?B?VkZoZEZxdDF2c0JPcVdjaDdIUkJwdEMwdEVBNmQ5c0I3WTNpK3YvaVY0OC8r?=
 =?utf-8?B?Qkk5Q0dIR0U2YW5xRUg2NDkxTEZqMEdDbEE0SExOcGs5cExNMTErbWREU2s5?=
 =?utf-8?B?OU1IVHNCTU1uay9kWVExWHRUMGE1bnJZQXlUMGRSNllVazVyM0RnWXhzQUhk?=
 =?utf-8?B?R2F3a29IRGdTT2FqUjBEaE1STFpiQTFjd0s2SVAxbERxbGR1aVk3eDVwMnh1?=
 =?utf-8?B?VkdVbUt1bk9tWkxrRjZNeUJReGxRcnNEZnk0R2h5Zm8xWWQ2YUFlaVYwUlMz?=
 =?utf-8?B?UndpYjZTT1F0aE1Nemx4UXh5M3hEK3hOUHpZSk9PQ3ZwazMzSVg3b3VFM0Zl?=
 =?utf-8?B?OHFpVTd4NTZnSW10ZUZOa2pka3dLTU1oeGFVVFR5RE1RZ1RjR0NwVkRzQTIw?=
 =?utf-8?B?KzlHNklCYXN0UTRUaHRkV3BnMWRBYUpaQ3IvUG4zRm0zNjU0OXRYMGUvZ2xM?=
 =?utf-8?B?ekRxeXJCL0Q3OG5oYmhjcDFFcWk0S0NsVlZFQ0o3ck1iVmNnTW1sdVNud3ZB?=
 =?utf-8?B?UENrZU1iMkJRZkJSNGNYM0JwVDRoZjBPU2tDSTZ3Wk51QTlhN0RpSXc2R3lC?=
 =?utf-8?B?TERHWkw3TkRnRW5MaWhibGNodStVUzhNc0ttSXNrM0FjYXpEajMrNW9CWGIy?=
 =?utf-8?B?blJFK3FUTWZhOVEzazlQbjZ1VzJOdmFNUmRXZkY4Ty90S3lpT2NnUUFPWUdG?=
 =?utf-8?B?OHRsSk5iOVRKMDJuRCthdGFYOGJ1Q1VVbEhuWFFWSGM3U2xYNEZ4U3dLYmRG?=
 =?utf-8?B?aitVNTZyckd6NkI0QUdhdXVwam4rMlFwNzJiVUs4MWhYc2E4SHcvay9ZWHkv?=
 =?utf-8?B?S1RLSVExd0l2ZzlmMzIreDU5eWFsYlNOVUx3bjdHMHpTYmNVbWlnbjZaQ3VU?=
 =?utf-8?B?QUxwK3M3ekJkK2hPN2Q3dTR1eXF6VjYzWmxCMEc2NEU5L3EwK1VDQk4xM05O?=
 =?utf-8?B?eG5vSHJHZzMrOWJ1cEF5SkRvWkRoVzV1WnN1Mzg1RFc3emN4dG1MOXR3aGFF?=
 =?utf-8?B?TmRjMTNPYVI3TDNWRks1SUlmVzBCNUM3ZGtyVkpkdnBFT0I4SnYvRjFqWU1D?=
 =?utf-8?B?SU9TamRLNENwZU1QTkdzRksySnNlOXFrNUhWWTQybGZMUnA4QTY1c2k2Tk13?=
 =?utf-8?B?MHl2ZmgvcmtjVHlxVjhlSHNxTWp5MFdITWwzZ2JPL3FiVTl0Z2RtQlptNVd0?=
 =?utf-8?B?aDQvcVV1SmUweW0yU3k0eHlwSkxhUWNzMk5MNlQyOEdJUjFuRjlzVE0rRm5p?=
 =?utf-8?B?TktMY09RbzNFdDJDc3RiMGFsSUQyYjRwcGRDUXFtRS81ak5NK2JleCs1eHdj?=
 =?utf-8?B?Y3F3QnhvdlY1eW5wdkRIZk40NEdGeE9VOWNVcGV0VGg5c3M2bTNjU3FWZ014?=
 =?utf-8?B?RWRsanlLMWg3UFN1ejdrQUovcHorM0h2WkhZSEFBdGJPV0NNcEJ5VlMwblJI?=
 =?utf-8?B?Vjh4VEljZE83cEZza0t2WWRaRkVVc2FJMUNKZjU3ZjM0aGNWRlZNUT09?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d700d524-afd7-4ea4-b084-08df17b76645
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:07:37.4839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xjs1m6vFimVYurXNaUwa4ZJv4XKEiLGjwB+wiCP9YzEarix25TxoHOFNTu19lvQLQgIr81nl4bLVluA7j9rcIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8772
X-purgate-ID: tlsNG-42698a/1789978060-A9AC09EA-B50BE743/0/0
X-purgate-type: clean
X-purgate-size: 5294

Hi Volodymyr,

Thank you for the review.

On Tue, Aug 25, 2026 at 03:24:44AM +0300, Volodymyr Babchuk wrote:
> Hi Mykola,
> 
> Mykola Kvach <mykola_kvach@epam.com> writes:
> 
> > is_espi() currently changes its result according to CONFIG_GICV3_ESPI
> > and asserts when an eSPI INTID is passed to a build without eSPI
> > support.
> 
> Probably you want to reword this part of the commit message. I think you
> wanted to say that "assertion fails when an eSPI INTID is passed to a
> build without eSPI support".

Sure, I'll make the assertion failure explicit in the wording.

> 
> > This makes a range predicate carry configuration policy and
> > causes callers to depend on its hidden side effects.
> 
> I'm not sure that I got this.

I meant that is_espi() does more than check the INTID range.
With CONFIG_GICV3_ESPI=n, it returns false and asserts if an
eSPI INTID is passed. The callers rely on these checks too.

I will explain this directly in the commit message.

> 
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
> 
> I am not sure that it is a good idea to put ASSERT on value that we got
> from external source. What if Xen is build without CONFIG_GICV3_ESPI but
> hardware really reports an eSPI?

This assertion already exists inside is_espi(). It was added
by commit 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in
the eSPI range").

Before this patch, gic_interrupt() already called is_espi()
with the INTID read from hardware. If the hardware reported
an eSPI with CONFIG_GICV3_ESPI=n, that assertion would already
fail. I moved the check to the caller to keep the same behavior
while making is_espi() only check the INTID range.

Leonid explained the reason for the assertion in [1]. Without
eSPI support, an eSPI INTID could lead to an access outside the
regular irq_desc[] array.

The assertion was also present in v7 of the original series,
which you reviewed in [2]. We can discuss changing how this
case is handled, but my aim here was to keep the existing
behavior.

> 
> > +
> > +        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) ||
> > +             (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq)) )
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
> >      {
> >          unsigned int nr_spis = d->arch.vgic.nr_spis;
> >  
> > @@ -949,4 +950,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, unsigned int rank, uint32_
> >   * indent-tabs-mode: nil
> >   * End:
> >   */
> > -
> 
> Please refrain from unneeded changes.

Ack.

Best regards,
Mykola

[1] https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00380.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2025-09/msg00422.html

