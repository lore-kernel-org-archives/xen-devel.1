Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60316606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 04:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=gPM3r190
Received: from list by lists.xenproject.org with outflank-mailman.1461824.1672831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLYwi-0002Pq-Pk; Tue, 27 Oct 2026 04:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461824.1672831; Tue, 27 Oct 2026 04:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLYwi-0002Pj-Mt; Tue, 27 Oct 2026 04:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1461824;
 Tue, 27 Oct 2026 04:37:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xLYwg-0002PX-VW
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 04:37:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLYwf-00F6Vl-Ow
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 05:37:58 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae02a84-e002-0a2a0a5209dd-0a2a4501a05a-12
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 05:37:56 +0100
Received: from [52.101.229.93]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae02aa1-5984-0a2a45010019-3465e55d2bf1-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 05:37:56 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by OSCP286MB5196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:34b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 04:37:49 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 04:37:49 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jl+FF+vLk/5xlOBcO+70QzMiLFCkwqL3n/uJ0HuJV8vnAraWeljKN8dwtmwxnxSUpbSeF1HaHBu9S5ruNLv4Nms8Msq99SdRXwzNP1+EfXQbcfXyPAM+DspDc83lcvc2y8FBedYvsQYuUqmOz8nKpbOsFz90ZNIkXsSpnAK+Ow2pryTdY4W21Da83sGq5mYBgTf8wwTdwPnM08AdLrttTUUYBKYOpy+cmFGFxDLDMXDnrPI28X4emLYTvhN7+A5myZNYpArvSEZBNgtRLOYJ0M/5jigo+FjoLZk2QI4CxpYeFgseZPzBIZi5UH+3yi2zgFofv1RWD6YbtoiuIfKg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7AyfO7OGwR4iO2s1aRgusgKklpML9RkuNBYW53UCV8=;
 b=djFZSOto3doTS7JHo4mDRcCdrf0WS8gBRaWTw5dYkruFjTGVCgcida0eWfRC3InayqRNZAaooXoLSibNhTMS0uzQg3qX2iPBPULwjqQNx0ECQlLrNCLCt6GQ4OZ+3rSD8avXQNoyiNqqoyQ7po9/iZycBUo+xXarE7UbT+txGiBI2iH2oMtRG7i8PJb8OZuWcjVFJPhVoKeao1uPr23UqnGVd7+OwqRbrnAbh95xJdhnu/npm/GXPf9zybWQFwEUW9rrSZABUhptPZnPj+BBdyTMKb/gTHNeaGPLVeAVxK5eEYBe8g2xrPDLQiyn0zSTEmYcxrYEsvP3DPe/vOHt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7AyfO7OGwR4iO2s1aRgusgKklpML9RkuNBYW53UCV8=;
 b=gPM3r1909Tx6bT7k3H16xlXM5FRdfOmXH0/QLridb/YUDmaIv52J3bTgS8gTlYuW3VeWksDLwlKKwn9yrsIkSkt0oUJXbJbr/x9qS9bQ1kMQLTO1JbgOZTTVUt69HlEQA6iLTEbv/tFNhEw0PNwwOurXfM+iCs458x7Xl2xh1PE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: andrew.cooper3@citrix.com
Cc: xen-devel@lists.xenproject.org
Subject: Re: [RFC 0/5] Introduce dynamic tracer using Livepatch
Date: Tue, 27 Oct 2026 13:37:30 +0900
Message-Id: <20261027043730.60174-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <432e0fba-0765-4c2c-866f-faff8cd04926@citrix.com>
References: <432e0fba-0765-4c2c-866f-faff8cd04926@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0024.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::9) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|OSCP286MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: ade18ff2-38a8-4e69-e434-08df33e40e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261026121527099003|56012099006|261022075727099003|261021121427099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003|6133799003|261026140227099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	YDAZEvN83ThzVdgyn/B/OfCDc9JHqOiU4TAjASm3OyDPr0Rf7dp9VePLLLhWeWEhadDOdZH62Mlv2k+uAqIvMVgk1RcvRtHl6+4bckmxfcR0Q0hn6cx++HehX3AyrPefxmYzcajsVXwtOPSME01NNSxtQlXlgsUY4aGtBmSWlFMx+ty/LcwCa167eqZH4RKU6wlVhDxZzVgek6czYanT1P0/0DLsQcrcfo26oX0mBooq84CscIItmzBuOhK1FGbKjyxArMuv1JkNfGwxiK0Bgvyqn2d9rI7sqbZdB56InZV7jrv82uI5lCK2mhpu+qvMrAZlpARBuooeBJE5WlhD7P4pIBABvxI1NDCVW5kR8kngBVw48wNyj1+LmC6R5YaFwEO1IwYxagB/LMFIUbNxJVrT5L46lR0Fk0+Nr2xvQ/p4ATabuH17GTh01G0SZegX5rzooPg5iyfezvLQIGhGLjVarmqJ4oOw5ctq5Do6OP9Qhb1NcNCgf3v326igHRa0h2ktBRFOsm1AT8b86f2Hoo/fuxsT5E2J83hJnqnelTKQNHHn3A/ii4ucfa6LqItb2LjpbeZLUqRhzwWjTcgL/MNNa8lyCOHfMopftGdYrPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026121527099003)(56012099006)(261022075727099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(261026140227099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oFcp4LKlj0BnWzPHwgBhPNTnJ/EHXxZwLbOfgeabmTEZ64PCinnLHtpLBNEx?=
 =?us-ascii?Q?CXb0/qf+7jqmu4sfZnIwFVVo4aSXr1vXSgiKruS8jWWl/MJnWpS5C1wixYDe?=
 =?us-ascii?Q?BvHoH4gmCPDDfBnIOZtliIz1oTbKtX2pxFy6dxejxOKBC1xlUMZNgtXhZxtL?=
 =?us-ascii?Q?ARA0dfzTXHc8XcORg/McxaNHXe4mqM184YyqB/HByBzT1zBjA6JfGvpwbgds?=
 =?us-ascii?Q?i4iCdAIdgV2+HaBwW5eSvNa3DKjD/ZSaPVMFUobUdYJR1Fu/43icYolyjrdc?=
 =?us-ascii?Q?p5tvMhCi29dgjPY68skenuLgqdPbVlVxfXEswoz07P8xuIGbT2khH34cg6P7?=
 =?us-ascii?Q?iwIDMjlovcxckqHjG2aPrEVjfrVI5Edv8O9ZqFRrzmnKUt7XRfxfWmMFW+ek?=
 =?us-ascii?Q?Y1Y24PuNTzUBuNtvLGd54d2+nV9SRgSo++vbKHiY6zxjwhGGc5DjkWn5v27v?=
 =?us-ascii?Q?ee6ADVbU+ygUxCZTNv12TswItH8MtN2gzz4Md5h+40MNxTB5KW2Wjh0S9Bu8?=
 =?us-ascii?Q?9+yU1EIofXwpAJYzpN6QbNMqgfjcog6rc2+VlaZtgx6Jlz4hBquVu79qQPqT?=
 =?us-ascii?Q?156YtO5EqU3aNN+4p04YI1iT5CId3OdLL4AznT2/s3LMafmkAbCpJK3FW92G?=
 =?us-ascii?Q?b5OVlyQMRSjRqHQ+3tQfJiPDixuu0aJFka6FciPeUQsjZ3PnaScy78XAauiY?=
 =?us-ascii?Q?McJC09NKnsY65clRDqa1dXMMjjGmHmJn5ef/dv5rrs13KX3Oym9p2xvE/ybB?=
 =?us-ascii?Q?XrQH+KT826gzyp+Xf2Q4tFHjjJwYFvtEloxoSnq53EEfGoh/+7AqEbagYcX4?=
 =?us-ascii?Q?V6VduVnltgyImp4qkoh6YYRQUfzn9BC2thSNckblhZ7dSKxfB3UGQS/vzqon?=
 =?us-ascii?Q?Ngqjiv8kGbBCx8nDWFZXYyNfux0D850r6E/V4RpzUt1NGRNSpWYL1bl/PbKr?=
 =?us-ascii?Q?DMi0YaGPSCR5EjLnEOv0ul3/C5g4V7KoMDSYP6nGASFu35855YkUPDc9zSKY?=
 =?us-ascii?Q?K6uEi1ky0l51ZhH9UJ3MW2sTAaxOBhxb8BfpsupQURf8USIpGd4tXMyA0T24?=
 =?us-ascii?Q?eshT577dNJM4dDoZ0+Nnf4k+1wUTou+/BqmdbtBGQxq1pBuWMtTloDfBfJr7?=
 =?us-ascii?Q?NmehqGQSzqXkc7Fwqe5uMtd+Ww9jXHWzJyP4zs+9YeaZfD7Z8v5P4nT0kds1?=
 =?us-ascii?Q?qSM3NvE/xBk67ETwApwgiXCK3GdyxKiekfnZJ+wHimYdtXbruyajlySYqwIt?=
 =?us-ascii?Q?Cvzft6rJcjs1Z0ObZgpTb6jNdcw9zriINxq/vXNUGkqHmcjF2elJU3daXoPW?=
 =?us-ascii?Q?V/c5LKXGqszJw5Vu2bYofPUWbq74TfKZp6eKlI2PMDkVfGG19AP3Ic4GCFEY?=
 =?us-ascii?Q?oOFBlEdaUplB3Bh40LoqjoIEe4q8b+qwsB/9ZSGJq9jEr7jbM7mN6jxGXPs/?=
 =?us-ascii?Q?XVeNr874LeH9jL0dfBND0elSo0teVwSjipQ3sNw2/qCjSkG/71yl3swiVT+s?=
 =?us-ascii?Q?Y0FP7saflcIobCHnUK2/SG2+fvIOKeulnzmdaxc/RYTIoZQYCsghfRhhdwE/?=
 =?us-ascii?Q?e8aS81FBDDxTlDVwzO/gqhaQSCc0VnTVUp7jCHWlxY0CRKtI8Nbk3wuI5uPc?=
 =?us-ascii?Q?jQbs/vdU6L8qIuoZuoaRq04O9nXX/+Zgeueb+dWfowxKcouzRAw3gxGhVrtf?=
 =?us-ascii?Q?nikqn2alRr10PuE1GHn03HyaSfZTh1tds67KxfuuZCTkCTTuPA+49ml7b7nZ?=
 =?us-ascii?Q?PX2dVXUD3w=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ade18ff2-38a8-4e69-e434-08df33e40e2d
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 04:37:49.4180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHKAiIR5GOceDhYWhw4HT8iOZvLReThFcSBPso7yV1miunLmE7tWDyqtaZ/WrSA10cuZzcbuszwT6v7UCgRpTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5196
X-purgate-ID: tlsNG-d62444/1793075876-C495A757-36BC20BF/0/0
X-purgate-type: clean
X-purgate-size: 3075
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew!

On Mon, 26 Oct 2026 09:29:04 +0000, Andrew Cooper wrote:
>On 23/10/2026 5:48 am, Ryo Takakura wrote:
>> # Configuration
>> In addition to Livepatch and HypFS:
>>
>> CONFIG_LIVEPATCH=y
>> CONFIG_HYPFS=y
>>
>> Enable the following configs:
>>
>> CONFIG_ARM64_PATCHABLE_FUNCTION_ENTRY=y
>> or
>> CONFIG_X86_PATCHABLE_FUNCTION_ENTRY=y
>>
>> CONFIG_LIVEPATCH_TRACER=y
>
>
>This ends up having two almost-identical symbols, depending on
>architecture, where really this is a common piece of functionality.  It
>also conflates several different tasks.

Thank you for the feedback in detail. It was very helpful.
The suggested config layout makes much more sense.

>I think what you want is something like this:
>
>In xen/Kconfig, create CC_HAS_PATCHABLE_FUNCTION_ENTRY which performs
>the $(cc-option,-fpatchable-function-entry=0,0) check.

Understood.

>You are also going to need a GCC_PATCHABLE_FUNCTION_ENTRY_BROKEN symbol,
>because of https://godbolt.org/z/sde4faxaz.  See the ASM_GOTO_OUTPUT for
>another example of this pattern.  Just use a plain version check rather
>than tying it to XEN_IBT; this is a new feature and people wanting to
>use it can use a new enough compiler, and it avoids variability
>depending on other options.

I didn't know about the compiler behaviour. Thank you for the detail.
I'll make sure to check the acceptable compiler version and add a version
check as you suggest.

>You also want a HAS_PATCHABLE_FUNCTION_ENTRY in xen/common/Kconfig,
>which you select from the main config x86/ARM/etc in each patch where
>you add the architecture support.

Understood.

>You want the single visible entry LIVEPATCH_TRACER which depends on
>HAS_PATCHABLE_FUNCTION_ENTRY and CC_HAS_PATCHABLE_FUNCTION_ENTRY.  You
>want to make the text architecture-neutral.  Instead of the exact number
>of NOPs, just say "reserves space" which will be entirely fine; the
>target audience for Kconfig text is sysadmins/distro integrators, not
>developers.

Understood.
And I'll revise the feature description as well.

>Finally, you want PATCHABLE_FUNCTION_ENTRY which is selected by
>LIVEPATCH_TRACER, which triggers the Makefile changes.

Understood.

>As a general note, you don't need "default n" lines in Kconfig.  That is
>the default.

I see. I'll make sure to remove them.

>All together, this separates "can the compiler do it?" from "does the
>user want it?" from "what to do when the user wants it".

Understood!
I'll make those changes in the next version.

>Separately, you have a number of MISRA violations which you're
>introducing in your series.  I see you've got cf_check, which suggests
>you have built in GitlabCI.  Have you also run Eclair?

Thank you for pointing this out.
My apologies for the violations. I wasn't aware of the tests
and haven't run either of them. I added the cf_check following
the existing code that I referred to when preparing this series.
I'll make sure to run those tests before sending next version.

Sincerely,
Ryo Takakura

