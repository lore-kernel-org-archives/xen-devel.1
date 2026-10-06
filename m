Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7800CA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 12:22:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441467.1659080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE4Az-00017t-FK; Tue, 06 Oct 2026 12:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441467.1659080; Tue, 06 Oct 2026 12:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE4Az-00017m-CW; Tue, 06 Oct 2026 12:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1441467;
 Tue, 06 Oct 2026 12:21:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xE4Ay-00017g-GN
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:21:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE4Ax-00C1u1-8C
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 14:21:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac4e7ce-8faa-0a2a0a5109dd-0a2a4508cae0-10
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 14:21:42 +0200
Received: from [40.107.208.57]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac4e7d5-f659-0a2a45080019-286bd03977fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 14:21:42 +0200
Received: from BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13)
 by DM4PR12MB6208.namprd12.prod.outlook.com (2603:10b6:8:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 12:21:33 +0000
Received: from BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740]) by BY5PR12MB4999.namprd12.prod.outlook.com
 ([fe80::a890:d230:e0a8:6740%3]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 12:21:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+xmDdBpY4l+ybgD2Qu+1HolYym40xVO+8cT4+8S2aTamSI/fUW1RMyY8wcq40yOUOUxZQuFFS220Xv3nKyu+9/GR+xyNBxDg/AgFSjwERKtacdnXDhAuuTxc1iYoU3oBCctG8VrrcYXdI4UKvXmkyIssFI89IyUXfZ50sMy0Kzj3P0p5Nf59FYdMHYmoKglKZnzfct39rx+W7Ax9A2q5U0YcWmEUkpTe0JKJGqNXLDy8T7bpsWnkdP4s5q5lQ3nU6hu+ajrRTYYJ75G7b9AeL/JBUUZpPrS+1sJlqrcDhTAwVAyUOSlRlHWVprA9EwKyP2kydVjBdlhHH0l+5+VuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L0TIWnnKQVHg5t9SZCiwB1zz6+si0noHsKHjoNk8iw=;
 b=aAZ+AK0pO6mkTArqQ/XT8HuEhymaxRiwHumdfGDfrgN7a7xxfCluJvWBWQ2Jtb0qPwsQHDb3MqN0BFv5HD8WV9Em1ZWSYyuJso3+SfFRdzwAJfks7jNH649XUhoo7pEBFX4i71HIiTbkDtCdObZ0lwiAY5/VL1yLxSBjw5RXkAMl2zRREJgrIi43mK4o0BG1cM9LKtRMOY8+6s0dKnJdaUDaXFydMGK3Sh0kY34cNIrzphcU0xwTQwxTllQj4vlbskwkTsvnq3elL1jiNZzRImtpr4pMTdCaomfTKKnyMj8zP4kUDWOLtCDy/31B/FyyA6j7kgmvlUTEdCpR6yanQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L0TIWnnKQVHg5t9SZCiwB1zz6+si0noHsKHjoNk8iw=;
 b=WJjjMVvFrq+gaTdn+ylKZM9PfdUd8myU4T5y29Vz7UJDRnqsEhj79ir8vGls/PEUx1oSUCtnNSbmRcyW1N8ikpTFu5R7LDofxH4+nVBsWsFJjkkAmBPaQ7ZOQjo+43Tua6djv0hc0arwGJo17Z22uBc0BLzpa89LOSrzQtXUpE0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Oct 2026 14:21:28 +0200
Message-Id: <DLXR22SBHLW3.2SACLO55074LM@amd.com>
Cc: "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall"
 <julien@xen.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/nospec: Make nospec helpers always_inline
From: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Orzel, Michal"
 <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
 <f9c2cb00-e334-4dab-a173-4cbffff18d94@amd.com>
 <d66c1a89-b448-45d1-b17f-ef63a34acc8b@citrix.com>
In-Reply-To: <d66c1a89-b448-45d1-b17f-ef63a34acc8b@citrix.com>
X-ClientProxiedBy: MA3P292CA0066.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::11) To BY5PR12MB4999.namprd12.prod.outlook.com
 (2603:10b6:a03:1da::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:EE_|DM4PR12MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ce28b0-6008-4461-db8d-08df23a45aed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qwchgW8qu3K5x9TN4+zq7njqZTLiLHAsddDzhciXMjrAMfRLvUSofQ6j2LDJ9IFFuC71OzGxofIvqjhjar6e1sycmyRdb7B6Dv9mRMwLXbXntnT+9hg3AQkoryU7nChdRFSr6wWzcy4n9p6dkWJxjqVgEXbU+4Wf6NIf2VS1/7y5msxDpZ0rPkCKTe7H6SXbW1x0y6uJMJYmBYXCZ7YRa+1DZ5pndDJ/Ith1Eb/UlXQO5yEACOkJvs1XmUyVShdN7ohQSKiSe873k9cAZBWxHAoFISZULaNk36kAeHQnnlSmwGPWf13S0lQqDjjrD7gy3qcxrneaSZiUB/EuuC5uxtCR3nNg0t3qn7bNFIKjY8a4I53GDqYTM5UkDxG/YEhA4brkchaLDdJ9Cf8+P42uiq3mpkd/zjswiLdefySah1N21LEhjNBOPjMEs3FJKv+gLKMCGHtspA9MIEGbreE3UNpAktU079YgPGdohPcM3LYYhW59qaX/P2/yYZ1q91suiVy5zlp3wYBYvkr5wvAPjgJqC9SwyYBnWP1qGbjfJVN9tUpzPAjsPkmyXyTjyh+5/yPEKsz4ZA0ubgzJzdsSBDcLTjDEtGBjhA6XYRayvJtG5ifbyHxQ4jzXW336Ryhpv9Roi2R3F+IKzuH7XT55wpAFPXIxJBs6wRbaWc7lH5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4999.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWUvd3Z1eGZyZ3ZqUVo2ckZVWHNwKzVOL0Y2S0FFWDlOU1ZETFoxeUtlM3Jq?=
 =?utf-8?B?Zm1UczYxV1hTa2I1MDBabTBKdGI4UURXeDR6bHlJaDRXTm9hR2g5QXRWNUlI?=
 =?utf-8?B?VVM1QldBV3FXRDRGQzJ3ME9NZXFzalFpb0pVOTV2RUJHTFdTVUhWTlRZdWVy?=
 =?utf-8?B?RGlwOGIxTkljVEtER0lRWHZZQzVzRi9ONE0xZjMwbkNhcUUvMmNkYlFIMWVj?=
 =?utf-8?B?ZVhZcm9EWWJiYktubDA5eXl6MFQ2QnFta2FNdVI0R3dJTy9wMmtBeDExQzBH?=
 =?utf-8?B?ejdFVVMzZ0tDR3RLOGhmby8xWmtMaE9mNnpxcW5PRVF5Z1FBb0d4TVF4QU9y?=
 =?utf-8?B?bG1WMll1c3IxUGhNRHpGcWd4dnJRVER0NE5yMkdlcWk0M3NENG11YjZ6ODJu?=
 =?utf-8?B?WUJ2bjBCYjBnQ1FoMThtZ3RpMFN0ajloYzFJOHVYWEhvY1VPQnhsaEdCc0li?=
 =?utf-8?B?MUozcGdPUHAwWnJVd3R5am9hQTRId3hUU2tPQzdEbUVZbzRWWGVrRnpOMmov?=
 =?utf-8?B?MXl0WDFiMjltS0hMYm5wb2NPZXl6TEdlc2xpU25TQmI3WWhYWGdjOGZrbSs4?=
 =?utf-8?B?ZEtwUVQ5WGpmSUZJWmd2UmZrd1lxbHpwcmtlTnZ2M2dWU1pEbTVNN01zRlp1?=
 =?utf-8?B?U2pYN3lmQ2xRd1RVKzk5S0hpbXJpbFZMdUdhUDVCWHhOY1JtNnplTnhuYTlK?=
 =?utf-8?B?Q1ZibnpMUGU4V0dmSEJ5aTRpUlFrL2lCNU5YakNVVTRWWkhxTVQxaVZCRHhM?=
 =?utf-8?B?R1lBWmRGMmhLcHk5OWN6R0ZJU0JrUVVHQXh2c1Jta05VUWc4OTFIZHVKUDAv?=
 =?utf-8?B?WE02NERhS0Uxa3JGSGhTMVNkYVgxNU1lYUEwb0Y5dUtyWlZkSENmOVdhYWhW?=
 =?utf-8?B?VmdTeFVabVdNQ1F2NWlXV2NHWXV5RTZKRjY5djZUZFVxMUNQSE93RkVJRmVG?=
 =?utf-8?B?ZWhKQWN6UGRVSk1UMC9vR3labHVMWDAzamhrRjdZaGxMWjRyOGNjRk83Y01G?=
 =?utf-8?B?UVczdG9MT3U1Vmo4R1FpQnlBVnNWZk5OaXRFZjUxZ0Nya3BFanlwL3ZTUHEr?=
 =?utf-8?B?UTc2NCswdUh2MjMyZXE3My9aOHJvSTkyT2RUOUd5L0pNTzc3ak1VK2F4RDV6?=
 =?utf-8?B?S1MzM1RQWCtybUlYbyt5bnhqV0NSUnVhcG12R2xWVUNRb0Z6OFpJdUJWQjVl?=
 =?utf-8?B?N2ZsOHhQNjlwNGEzTlovZThOV29aVExxWlVjYW4wWFNpTzNOSVBUYllHb1NH?=
 =?utf-8?B?V2t6YmsxR0ZQUk9PcnlzUFpSa3paUmRvbUllVEs5UEFsQnNUalVkc0xsNEtq?=
 =?utf-8?B?ZGdZRHAwRC9wVWk1RjdxditQNkdCSDgwdnJGRTdDVHUwdEtGcnh2OGdBVW4v?=
 =?utf-8?B?Wi9FdnZ4SVQ0czNjbi9kdkhoRGZYTFR1ZldYNmJ4RVNHc2U1NGdLZVNrVUtn?=
 =?utf-8?B?dGQvVW5lcVIrbDN0SnBGQWFUYVlTUGNEak5HYUJScVJuQTg1cEJMOU90OHpG?=
 =?utf-8?B?VlJ1ZjZCV2pPdXhqNTdYOURpbEFRYzRQYjZlNFFCL1RkZ0Z4UTFrWWYwUVNk?=
 =?utf-8?B?Z3c3RVV4TjNoWTBYQURDZHR1SmFTZGFmMjdBZFdpODQxT3VhZlNuNDZNZGpx?=
 =?utf-8?B?a0Qwa2wwWkl4T3pTNWhkKzdBSitFTXM4a1IycEhTTTNDQVJncmtCbGFDaE5N?=
 =?utf-8?B?aHUxaVBXd1dNOGp1Rlkweklmd1Rjd3MrMmNYK1psekp1NjZKVTZ4ajZwOUxN?=
 =?utf-8?B?QThhOTY3Q0FOM3BPNXZCKzdmM3d4dkxPMHQyM2ZzWFhHRWNUY0NMaERoak1p?=
 =?utf-8?B?STVrbEhqTW5acm0xVDUvZHhXWFdmeENZcVN3U0ZydmdOdVBMWXgxaU5qYzNx?=
 =?utf-8?B?N1ZraHZzdXhPM0xrNVErMHZaN09TdW1aNU9kaGJFN0VFMjg0QmFFaVNJMUxK?=
 =?utf-8?B?RERsLytFanVNYktjbnA3OEhXU2kraWRmQndXQWYvRHNJUFdNQjZnOUl0UUlI?=
 =?utf-8?B?ZitsK3ZVeTRHUFozVVZJM0hUTXIvNEtUNVk2N0ZNdStOZXNnL0tUNVM3S0NF?=
 =?utf-8?B?NStDRHZnNlpKRTBUdm0wN0RTTnR0ckRxMVoyb3FBTFJHSEo5THdZYkVyelBS?=
 =?utf-8?B?OWpXMHRoUWZwM2NVN2YzV2RvdFFLdEl3MVVnaEMvNmZBS1kvM1FwaUFiMk8w?=
 =?utf-8?B?L0VLbGhxVnZKcWlVM2hBaVo4RHFkaEFPY3haM29TSWkvRm1VYzU5VEg4eENs?=
 =?utf-8?B?LzE0TVNkc2huQWo0blB4TEp2ZWRlMzFyS2RGSTlDcVc3VTFjY2w5T1o5eWtz?=
 =?utf-8?B?N2htVTdOMzZFZGJUQXNxRko2T2FRYjlaQmtVY2NuVXJNWWdUenlyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ce28b0-6008-4461-db8d-08df23a45aed
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4999.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:21:31.8932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKUp03HGXrqv6UugvKf4UXaNOcUoqmn95+HD3OvdVouj4IngfCRN8vQ6F0jWD9U8b2vkPU4M9NNckG+YmlhAtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6208
X-purgate-ID: tlsNG-c1860d/1791289302-D574B87B-6C542CF2/0/0
X-purgate-type: clean
X-purgate-size: 1158

On Tue Oct 6, 2026 at 12:51 PM CEST, Andrew Cooper wrote:
> On 06/10/2026 11:45 am, Orzel, Michal wrote:
> >
> > On 06-Oct-26 12:31, Alejandro Vallejo wrote:
> >> While today they don't implement fencing in a way that would block
> >> speculation, once/if they do they'll absolutely need to be inlined, ev=
en
> >> if -fno-inline or -fno-early-inlining are passed.
> >>
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> >
> > but this should be done for Arm, RISCV and PPC at once in which case yo=
u can
> > keep my tag for v2 # for Arm.
>
> I previously had a patch series which made this all common, for these
> kinds of reasons.
>
> I think I'd prefer to kick that over the line, than to keep on taking
> micro-bugfixes like this.

for reference:
    https://lore.kernel.org/all/20240304161041.3465897-1-andrew.cooper3@cit=
rix.com/

I wouldn't mind that, I can R-by it if you resend it. I'll still send a
v2 of this on the grounds that it's a strict improvement over existing
matters and might land faster.

Cheers,
Alejandro

>
> ~Andrew


