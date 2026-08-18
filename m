Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5859EC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:06:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393622.1632432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEqE-00063J-Jx; Tue, 18 Aug 2026 08:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393622.1632432; Tue, 18 Aug 2026 08:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEqE-00063C-HH; Tue, 18 Aug 2026 08:06:38 +0000
Received: by outflank-mailman (input) for mailman id 1393622;
 Tue, 18 Aug 2026 08:06:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwEqC-000636-OE
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:06:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwEqB-005Nw4-CM
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:06:35 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a841288-2eae-0a2a0a5409dd-0a2a45058dcc-24
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:06:35 +0200
Received: from [52.101.65.121]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a84128a-4cb1-0a2a45050019-346541799ecd-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:06:35 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS2PR03MB9718.eurprd03.prod.outlook.com (2603:10a6:20b:60e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 18 Aug
 2026 08:06:31 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 08:06:31 +0000
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
 b=I6pnMfeYzqnzCwh6gW0tsfRXYO4z8VAcNZilznoP2f0WuD8IPz8ArmajvJyFrRAAvw8gWtXb/BJb0nT/s8ZFn1afWSYRT/pXgv5ItF7oxLUagDnzGkB2rafIGU0IWEcclJ48XmO5ye9XIM6kFd8Dper8Gck3Va25PEp1H9LFCJ8U5+RD0D+wz+Ik/KYvpzqJIWQlhpuRn1kxWOiDcMfPhDOn6dXvQNexYOFRYAJrL1Q2j0oeR1DBhcjTnEN61pt8eXjDq5+JNuUG2ElmdyQNq7hKjZL4vrRHhnG0QbI5ofBeoi6iSNlc1F73ZSAG2m49m0DixGswvEXhIp9+OYbwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoz66d29gEfg8FYdfnppGP8J19Tvl/1HF1J4mYAvfgM=;
 b=A71ICOhdI2jw0tpatMjxdzIK5jajER18NIO3rLIGBBEMPsLwRJgIpviogJ1P9XtkqNKBNmb6JnFJ7sIoG0QkvAseZcDF8SB3jf3C2jBvjuK92XKQAb7SgUoIbYvPbHvS/hCM/IcPdqO+fedLq7p9k7bpbcIhuZjp4kBEbZ3meIEzwesD+6i0u8XRwCWmJjrq1Ps+/JVprTvQUfmYA+Fev7wazgNo3fjPXYMUgZSLKRFJd5Sn1xRFXvh8O6P9PnQQWZjqjDE6JUz/O1LKrPsTzo5wgz2mA4uqaaMbQ2lN7G2QhAP7DOACJeON7b+YTTon78dfRmsKUVjHcufEdkesiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoz66d29gEfg8FYdfnppGP8J19Tvl/1HF1J4mYAvfgM=;
 b=Vyg7YtVBlc+nXofpX/MBMb7sw8w6crCpSRYx8I2J87PG/R1J+AuoY0GVwjQ/DLkhLdYMqlr9Oh5XJZC95390cPJIGhSBYcmbjosRUY5P2p5s8Qq7o3d+pgAdNeuyJooU63EDY49yOGQ9i5CQB2Jd82tx7YqGh0TMiTnPdvhrBJdelCEfNy8LWHJ6gnAKFIGkAgqIDJkU974qLvN2MV2ZfquLl1KFmyScybW+69kQrQ7Sj3GiK3xFjevQJK1oTtIGUVNjHdK7QJK2w2Mpic7vU0pvzdB38vmUmJ1bhquPVqfjQJF8TQJ1UEOyl5zKaow61BTFaCsgBLhFbKeD4PxWqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Date: Tue, 18 Aug 2026 11:06:27 +0300
From: Mykola Kvach <mykola_kvach@epam.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: derive GIC CPU interface ID fields from the
 vGIC
Message-ID: <iutqzuknxgblhw4j77yuoapsmvcsy2gwhbolslyfvkvsm6uc4b@b67uc7ri6pdd>
Mail-Followup-To: "Orzel, Michal" <michal.orzel@amd.com>, 
	xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f46f9e6ebb12d8402fa72b1641796f33e24c539f.1786395761.git.mykola_kvach@epam.com>
 <103a2e50-0391-4bad-b9e7-d00c36c76a54@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <103a2e50-0391-4bad-b9e7-d00c36c76a54@amd.com>
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS2PR03MB9718:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f90dc4-264b-4beb-92fc-08defcff9cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|4133799003|56012099006|5023799004|4143699003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	PRCfCr0/xCV31gh/qK3LD7c1xUxiB9FdhDAjweoA4bqeoQEmun7O9obLecL7ZGJmJ8If8CHKLKHwz8olLOHjLcTMrdQM20wGYiHjKxBYucGKy6sJu8zeeGH2tKzP6CBTLmfW0Lfl1GegjgbG4gJ+h2olJnMmNUUPppezIdHc+H2jjPfWHCHEj7kGmZdHVNJdJPQ71zuEslO1kcVJuE589nu24WQ3WyCQdwZGEulXgy4bM4mIf03iJS+MsSZMUkCmCc4aGmJ0CvLPXx7k9RZJIhSuzMrYaUN53X5djkbQUSFjewoaC41wbVjxJzeVvrqKm4Fo8b4Ars6k0mcQKfsckX0kAClDEZAgKbzdhkYYGJPLfr+yPywXX5IrUP2a1tp+tHlfJbtOHh0BNkYtqEgMJZniDOV8T4WBeNSxb13bUGawDgdy74cnatxGg0DJCjIfN+cToQ8Fhq5crSFz+KKNon/8p3vmqk56th4Uujp5A6akbEzlhehwq/uzvNqXXQbRbQha0GRdFGvWDx7GttNvrQ67p3cC9oxAg2Hu8alFoelJk7wh7IaS+K6GtIyTZI0D+keWL0S1tR6aXJ3XGEeQvsfOds8e3+8FEgXtp9F1a8A06ucy9kztOVoJBedum3fq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(4133799003)(56012099006)(5023799004)(4143699003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a05zWVF4UEczVXdXMFUwakYzQ3NSV3VhLzMwMDRFT1pHaHpVVDNZNlZoYk1U?=
 =?utf-8?B?Nld1K1pYVGphY2NrK0FhT3dLRjF5ZmJUK3ZpcGprUHlIaGpkZDNhYVM2WWUx?=
 =?utf-8?B?b1FaczhCd1lGUXhKWDNGZG9xKzFiREdCbnZVL0s5ODhIemlGOWZxMVlUc2Vh?=
 =?utf-8?B?NGVFZ2NvUU91KzFMcGtxQ2lzeDgyVmdxaDVUMFZiY0p5UGtUSjZRQVZIVnVD?=
 =?utf-8?B?THRqOWlncEhzNHJ4YVZxeWZlV2tKK2QrWXhkSEpZSjByVUx6dmU3SUR4aUY2?=
 =?utf-8?B?bXNKa1JKcTZCOEM2Um9wNlBYaFRiWFdsMFRIV3JLOUE1Rzd5SERlRUpXSEU1?=
 =?utf-8?B?R0ZFZzFCaXBYUmhUKzhMdUpZU0dqVkdUQXptaWRPSFpDVkV6VHJ6UklQS2JO?=
 =?utf-8?B?c2o3dHI1K3E2a0o5c0hycmcxYzJUbW5NVmpZTERlME00ZHdtd09CZDNtb1N0?=
 =?utf-8?B?QXRmNFd0dTE4TDBUSTl1TDBYUmhkWmdxbmRjU2RSZzZWSDdTYlFubGR4OUdU?=
 =?utf-8?B?STR0Rm9OeGtOY0RtbkxGTWtOQmQxUkZYbTBmS0ZqdkpSdFVhTWJ0TzFGbXhB?=
 =?utf-8?B?aWUxQU5TRHBtcVMyWUdlL2pnaDdiNE5XN3AyblhnMWtvcVdhK1grWVpaUDFQ?=
 =?utf-8?B?elFtSE80dnFHc1U4alVqaUQ1MFpGZkFySmFTUW0xQnlTY0E2RUlKMzFNWGw2?=
 =?utf-8?B?QUpUc3pLZE1NcEtzMUhFUVZCYlZ4dE1rajdEZ3pPbm8wUFAyZWlIOUtsM0hT?=
 =?utf-8?B?bFptdkxzRS9rQVJhNzJERHQ1eVBUY3p2RWJjclBpaFBqWGFWY2FtNSt6NTBZ?=
 =?utf-8?B?YiszbGZoMDVFSVp6UHBiM2h0VCtmZGQwS3VOZDRvR3pJMkJJSFRidkYxOXRI?=
 =?utf-8?B?NzRuekJ1WEEyTFlYZTNENFB4ZS9hdGVpRGxZWG5lemd3ckgvT1QzZ2xJUWZC?=
 =?utf-8?B?dDN0MXdmQ3ZxNEZhQmtjSlREUzlLSDRmSXdER3FFeVlETk82NldtQ280V0w2?=
 =?utf-8?B?bS9UemorL2dtT3BsUktmYVJXa2pmMW0wOXJUdWdGRk5NVTVYUGR4MW5NNHAw?=
 =?utf-8?B?K1ZEbmNuRDJqVkR2a2NrUGM3Sk4wTlVLS0ZISW80QXUyOUd1K2xVL0F3bVlr?=
 =?utf-8?B?Vk42eWQ3c1BOZVhVaTZQTTY1WHo0Z0d5R05sOGlrQStkUkVjV2trOVd1OFZr?=
 =?utf-8?B?RU9MbXpmcmFXbnByYjNXaHI3SHF3b1lITThTdmxqcDJDdGZJVXU1WUpMditj?=
 =?utf-8?B?OHlJU2FKMHR2TEQ2L0wxVk1xM1NsNG40R2wyaUkvSFovNWhiQzBVdXpLMnpa?=
 =?utf-8?B?ME5VS09VYXMycnJWbnNHb0hDaHJtS3Z4cHJRTkpVV0lsQTJqSTBQeDZ2MnI5?=
 =?utf-8?B?NWxmZ01wc1hHMithMjNSSklBcFVqMllUV1ZGdmM3NHZYZHlzRXNRNWR1ZTBM?=
 =?utf-8?B?N2xOUnlSdk44alhXdWFNekUzVXJIUWtkc3gyTXNYYWRLeTFnaVpTR2w0SFd5?=
 =?utf-8?B?OUFJS25hQld0K1RReDRQZFRaYnk4akMzT0N5UTcvcm1mczlGR3lBdGtGQ1Bw?=
 =?utf-8?B?WVhQTUgvVGhNNVUyMWNWWGIyeUdBOHAwcE9KYWQyVGVsZlFIdG02Rkxla09K?=
 =?utf-8?B?TXU0R0JDbUZ4NGowbWg0QlVIY2JVeWRGTjUvWEVkWDBLWFZBN0ZzbG1XNUdG?=
 =?utf-8?B?WjhLZU12SFZnY3pCWGd5ZjF4dGJ6dkM4SXBmeGlvT2xTaTFLc3dKVGdncWx2?=
 =?utf-8?B?Rml1cTNWR1hBYmMwK3F3TXBxWEVxR2IrRGI5S1RqTHh2K0hVcE10ZFNBRnVi?=
 =?utf-8?B?WUMxcDNjUW5mWnVuZHpyejJnU1FUMGp0dUNUNk8zengvUjlGd09LRDNhbC9W?=
 =?utf-8?B?dFBMWmpKK1c1NnphZTlva1VZalVWZytUektvL09EakFLcWg5N0FXRHMyVzhr?=
 =?utf-8?B?czNINDBtbmVPSkNuc0VaTm0xTUhxUkJ4MXZXMFZyNTNwMzBmSEhzbENPVTRx?=
 =?utf-8?B?UnBKSWF3WE4zSFVrMGZxR0hPOGNocVBjTWQwUzBqRS9sMkpNSzg4dFBPN2xR?=
 =?utf-8?B?aTFFUnREOEc5bUhHeUxkWFR6R0xxNEpxOXk0QlJJYWQ3WFNQa0ZiWDQ0L2VE?=
 =?utf-8?B?OE5xVW5mZEU2UmtBaEhFT3RMUlpaNG1vU0FzdjUxWE42anVUQS92MWxBVEty?=
 =?utf-8?B?bU1BLzl1WHNyakVCdmhLUjZPcUl3TFIzNnk0bUpOZUdObXB2RUNIeVNLd21y?=
 =?utf-8?B?R2FFMlluQ1FLQlAxdytrT3pBNTg0TU9aQk1oUytsQnYyMlROc1ptUFc2T3dm?=
 =?utf-8?B?Z1pJK0JXZWwyRU10VFJjTmhjc1NGYlF4cndKNFQxM0xPUXFZR1hUZz09?=
Content-Transfer-Encoding: 7bit
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f90dc4-264b-4beb-92fc-08defcff9cff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:06:31.5882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itYwUaXk7tr7FW7YFir83Y8wwuAI/xWH+Qzr4b851PNvuJyS332mI7tVEKVAd7RNdN65jIT1APypuKHBcLrGkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9718
X-purgate-ID: tlsNG-c201ff/1787040395-71AAF2A1-EF556941/0/0
X-purgate-type: clean
X-purgate-size: 6217

Hi Michal,

Thank you for the review.

On Tue, Aug 11, 2026 at 09:51:38AM +0200, Orzel, Michal wrote:
> 
> 
> On 10-Aug-26 23:12, Mykola Kvach wrote:
> > Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
> > which is initialized from the sanitized host CPU feature state. This
> > does not necessarily match the virtual interrupt controller configured
> > for a domain.
> > 
> > A vGICv2 domain can therefore observe a nonzero GIC field when the host
> > supports the GIC system register interface, even though Xen disables that
> > interface for the domain. On a GICv4.1-capable host, a vGICv3 domain can
> > observe encoding 0b0011, although Xen exposes only its vGICv3 model.
> > 
> > Derive the fields from the domain's vGIC version instead. Expose 0b0000
> > for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
> > ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
> > CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
> > unavailable.
> > 
> > Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
> > Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v2:
> > - Share the GIC ID field helpers between the AArch64 and AArch32 paths.
> > - Parenthesize the individual ASSERT conditions.
> > - Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
> > - Target master instead of the 4.22 release.
> > 
> > v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola._5Fkvach@epam.com/
> > ---
> >  xen/arch/arm/arm64/vsysreg.c    | 18 +++++++++++++++++-
> >  xen/arch/arm/include/asm/vreg.h | 20 ++++++++++++++++++++
> >  xen/arch/arm/vcpreg.c           | 15 ++++++++++++++-
> >  3 files changed, 51 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> > index d14258290f..a02ad951f9 100644
> > --- a/xen/arch/arm/arm64/vsysreg.c
> > +++ b/xen/arch/arm/arm64/vsysreg.c
> > @@ -21,6 +21,7 @@
> >  #include <asm/arm64/cpufeature.h>
> >  #include <asm/arm64/sve.h>
> >  #include <asm/current.h>
> > +#include <asm/gic.h>
> Stale include? Nothing references gic.h here anymore.

Ack.

> 
> >  #include <asm/regs.h>
> >  #include <asm/traps.h>
> >  #include <asm/vreg.h>
> > @@ -304,7 +305,18 @@ void do_sysreg(struct cpu_user_regs *regs,
> >       * to identify the processor features
> >       */
> >      GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
> > -    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
> > +    case HSR_SYSREG_ID_PFR1_EL1:
> > +    {
> > +        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
> > +
> > +        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
> > +            guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> > +                                                   ID_PFR1_GIC_SHIFT,
> > +                                                   v->domain);
> > +
> > +        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> > +                                  guest_reg_value);
> > +    }
> >      GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
> >      GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
> >      GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
> > @@ -343,6 +355,10 @@ void do_sysreg(struct cpu_user_regs *regs,
> >              guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
> >          }
> >  
> > +        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
> > +                                               ID_AA64PFR0_GIC_SHIFT,
> > +                                               v->domain);
> > +
> >          return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
> >                                    guest_reg_value);
> >      }
> > diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
> > index 387ce76e7e..24735aaea1 100644
> > --- a/xen/arch/arm/include/asm/vreg.h
> > +++ b/xen/arch/arm/include/asm/vreg.h
> > @@ -9,6 +9,26 @@ typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
> >  typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
> >                                     bool read);
> >  
> > +#define ID_REG_GIC_WIDTH 4
> > +
> > +static inline unsigned int vgic_id_gic_field(const struct domain *d)
> > +{
> > +    ASSERT((d->arch.vgic.version == GIC_V2) ||
> > +           (d->arch.vgic.version == GIC_V3));
> > +
> > +    return d->arch.vgic.version == GIC_V3;
> > +}
> > +
> > +static inline register_t id_reg_set_gic_field(register_t val,
> > +                                               unsigned int shift,
> > +                                               const struct domain *d)
> These two are incorrectly indented (off by one to the right).

Ack.

> 
> > +{
> > +    register_t mask = GENMASK(shift + ID_REG_GIC_WIDTH - 1, shift);
> > +
> > +    return (val & ~mask) |
> > +           ((register_t)vgic_id_gic_field(d) << shift);
> Incorrect indentation: continuation line should be indented +1

Ack.

> 
> > +}
> vreg.h does not include any header, so please add appropriate headers for
> objects you are adding.

Ack.

> 
> > +
> >  static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
> >                                       vreg_reg_fn_t fn)
> >  {
> > diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> > index e7c484f2c1..d6f9326b71 100644
> > --- a/xen/arch/arm/vcpreg.c
> > +++ b/xen/arch/arm/vcpreg.c
> > @@ -12,6 +12,7 @@
> >  #include <asm/cpufeature.h>
> >  #include <asm/cpregs.h>
> >  #include <asm/current.h>
> > +#include <asm/gic.h>
> >  #include <asm/regs.h>
> >  #include <asm/traps.h>
> >  #include <asm/vreg.h>
> > @@ -173,6 +174,8 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
> >                                    domain_cpuinfo.field.bits[offset]);\
> >      }
> >  
> > +#define ID_PFR1_GIC_SHIFT 28
> Move this to cpregs.h and remove one from arm64/sysregs.h to avoid duplicate
> entries.

Ack.

Best regards,
Mykola

