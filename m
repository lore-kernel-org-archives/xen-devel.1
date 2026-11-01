Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4496606A324
	for <xen-devel@archiver.kernel.org>; Sun,  1 Nov 2026 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=pW0xiT/k
Received: from list by lists.xenproject.org with outflank-mailman.1467093.1676566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNKme-0006tn-LL; Sun, 01 Nov 2026 01:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467093.1676566; Sun, 01 Nov 2026 01:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNKme-0006tf-GI; Sun, 01 Nov 2026 01:54:56 +0000
Received: by outflank-mailman (input) for mailman id 1467093;
 Sun, 01 Nov 2026 01:54:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xNKmc-0006tZ-BJ
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 01:54:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNKmb-00GjsX-HI
 for xen-devel@lists.xenproject.org; Sun, 01 Nov 2026 02:54:53 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae69b5c-8faa-0a2a0a5109dd-0a2a450a9780-24
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 02:54:51 +0100
Received: from [52.101.125.135]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae69be8-f2d2-0a2a450a0019-34657d875f53-3
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 02:54:50 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by TY6P286MB7882.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3a4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sun, 1 Nov
 2026 01:54:46 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0569.010; Sun, 1 Nov 2026
 01:54:46 +0000
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
 b=jI4Cz6b0qjNjo00eoVNVJ8m7iV5vxXO+M/7qyry6kfX8fcrLdvS07BvTl0oxWzKXHrpGgYh4BR7ByRpGiJBEGYwRa9tYt7BOiCiXg6EeDDxDUlsuD0V8RVJHIGn8hj35Jk46ZC+l/iHs3nFzL4L16dNnWjbmqq7XeTOu2yRhoaBG7Zuc+xpWQTmIGdCPJOBTDZNzcxcMAk41vJ0rvgQT/zpMJ37fHwIItqacFxeajxWdpHf9Mc3Hl717Lstm8RN74/dDaqU/njvERrfWj2h0kqwfW8kZn/qcbiJyTnRNTeURANDYCGv4LHw3rblpgZG5mucwPzmO4Gy1NDukmOKd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sL5SxGpPzhzvX7dPFXAB/JSuM8gKeu9uYyfyp54+tP0=;
 b=iJ3sCsIJmIbMVw33ZXLJAz23ErgJfAWo5O6RhdhinRTe7Az0n5NKE86IEhpovfvo82cA5PqRjMb3RqOpDYrpjNJbO6iNDLlv0yn+fCFokoJnJM5ZKusxhM4tOPzVYb5EodmTTi7F1XwEZ4OtbwYH/wihNcA3YRyqS6dgAJh/oIxZ3Rdf694LzUod0W+vnLVYpW3aYE4gihBCbPKNQFZLVsYkHPwLRNjsuXTxccZa1aqM8kTesAB/sYd5Pt2Fe1faW5pteHfqNGrum6ZXxOYazN0lgsm3kRPy6tR2a9WEW2+9Hcou+Fz8grTl1/ioPtfLOjnBtZsuXAEl6V+Vz+HmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sL5SxGpPzhzvX7dPFXAB/JSuM8gKeu9uYyfyp54+tP0=;
 b=pW0xiT/k0yu2y/v8jROX0yA6Zj8xFclXu0zX7t/CT4Uu7AciJ+DcgSQXJhNx43j4m+7vtYPCQlIH74FykQlm5+4Y5ij+TFVeOddRjuJvaFJhphAYKCoc5qSWMbYOu9HJNdYL7/jxwSnY9WtbU/IA/+hrkc7cCo8FLlf76lpYD5k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: jbeulich@suse.com
Cc: takakura@valinux.co.jp,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC 0/5] Introduce dynamic tracer using Livepatch
Date: Sun,  1 Nov 2026 10:54:24 +0900
Message-Id: <20261101015424.2736-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7028568e-8b24-417e-9fe8-f0a4d4f8b0a6@suse.com>
References: <7028568e-8b24-417e-9fe8-f0a4d4f8b0a6@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS7PR01CA0175.jpnprd01.prod.outlook.com
 (2603:1096:604:24c::12) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|TY6P286MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 772b6d60-feb7-4f6a-e914-08df37bb1aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|18002099003|22082099003|56012099006|261021121427099003|261021123027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	uPrttFBlPgdJrulRX/NETWjSfuMbyfTRhGEa39SN1kWzlMmdMG7GlucJ7JiqWVVb5UOzg/Bt1oOn5Kkh4VLn8osA/5rKGNYI5VBOrtNAtllQMSlfcWHdd5QowzCGuUZ9DD/jCeilFzRutavAyP8J31cfbsirK6AaSaH/SFlNCjmvulkhkk6tYOo+heUJtFc1wp2yQgogyAq7tT3a2qRbNInanxnTbgRZfKogRovCJ/0Lby7zMimRy6H3zc0IwT7vm02lhbpyW3o8/RqA6ySJjFVVuHKtzokUMx/hphBCNe5WMkd2Ze9SwyqihFGt2T+Pspgov6bHrUKQPQIy8oCgQUQMNu8UosdtJj7+2PhwpKqqJmTM6iBFBTZgP3AcElz05OnKD41wLpveJOcfHX8w3eFSqAAuOvp1qlsr/41DK+SHpA57o2Dg9r4UmRYuA+wQUR4YIZChEcFc7IU2Wgwmqhx+u+ts7p5podoy0nU3bp2lmNtuhgJjbqRn5NsajmUzCV1FIgcR9VAhufJwRkHA/LCw/zJteYmScthnRX9iTWumwvAy7ZjwQIIHTI4SyFBuEzuzcPVa36T5uhFejsu0wHPiqc1aAwiVC84e335qbXVXRy6qLVtmp+YBvASK0E98DxDYHA9PxDm1f43cvr4FZk6MTyxOKu3HW9h41urTPsE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ItLJnYplimx0xz+qx35znC9R4X729PNgLPf1+6iLhToTR+AGCqsjX1h9UW+8?=
 =?us-ascii?Q?7Ls/le9sV9vZOxu1qIbvLRlHEFejeGhkE5s/qUDNJC9BlYL904tYQVhLvv7Z?=
 =?us-ascii?Q?BngyZ5RTDpFTaWGDRTKSY4eA2Rsi/ImZ7cMPFCKigKQVzjxAwW8wcCR+DUN0?=
 =?us-ascii?Q?q7XxpSo9R1o92tnJZqB/VKbBnnvGcLyEG8Qms/FR1F3QrnSAH/ZCdpC1dY42?=
 =?us-ascii?Q?yvaplOCdFqQIwFaOmyiMsw1O48z5h1Bqq8icsNJJWMWK43lLES//+oHbWPGB?=
 =?us-ascii?Q?sOUPtoTjdOUkDseqKYX82kEdmJyQx/W8rvrYl2MCF5/Glv+crlfuAP+Z4hCR?=
 =?us-ascii?Q?cqEhqXpDxjdBITRGRg+PHIgEUhWJ6jUfgORYvK2mm5piabb038ovh0z/ap12?=
 =?us-ascii?Q?plceYtnEKXmNu50k80CVhpzzFcfzwfRxowxJZqcY1o0cgIXmLy/sRv7lOgQY?=
 =?us-ascii?Q?jfmP+d41wdw0+1WeAyjjn5jzgbGfwdNu5AMu57IgyzdVzD99RH2oyLEnPxri?=
 =?us-ascii?Q?+dtLlaHDVT0Z6cpaYiQxgmsI7P42tdY61lTEoMILwE/O7smYXjEE2FNamAdZ?=
 =?us-ascii?Q?W23kw7Yvow/4j2GMR1NgSgPj7D7M10TecW2lmK39qKp+oqwOKmuaw7aWTvN0?=
 =?us-ascii?Q?kNu8wIFHkGWDoW9WPRkTjlXklJSiEr5l9sdz7IFHu/+5koIY/K4VZqRM/ZfU?=
 =?us-ascii?Q?isf48YQ2z7US6OUWoDXZLzMQZu6tVkA9vfiPUT5cFehRu+3AjBatFLZ1Fa6a?=
 =?us-ascii?Q?XP2OyDTrbfD/GpTwzz7sR+6ZvcGYkWyyJz4PNkvCwuQIneTfuErojB+9UNzM?=
 =?us-ascii?Q?ehP2FxKzK1stqtpbECLk9wYbKYvlDB52YPlWC/K/fQwWDbY+O4eXT9k6s+tI?=
 =?us-ascii?Q?WA6xEkb23jsKMRBeCOCOMa/6To974BR4kq+6teS4qYB3TlaoKwgH6gS9WNVw?=
 =?us-ascii?Q?uImcIv/5F8f21gtGwdTetEGrOPSileUaMmt7cTakkloHV9O0ipqE+fbSNGVk?=
 =?us-ascii?Q?11BHFKtTy5re9iFI5uyGFq+R1sD2qhPCqO1HYPDh3j6uIKzrtjDWJv3kmawv?=
 =?us-ascii?Q?gi5BwXkFv40Ya87HRWloyivX9nn41Ig7PwZ/OC2s55uUz/OBRL/Be9RyAny2?=
 =?us-ascii?Q?j8NXovy4HEdCCmv8jFlu15j92xv6hwbGVyeDoHz+e4hgNX86sMvJNzeySyhu?=
 =?us-ascii?Q?E/3WZ1b3160LSXbuHrQgbNy7J7odt7SSS0XS9rVtwK1OYrRH8cSCdsOy9Jf+?=
 =?us-ascii?Q?I2LlGApwMNAZ626+cqwzGcBr2stY+DwB1oEbu3+c8h5IpSjLRAWmSj3s8B0q?=
 =?us-ascii?Q?lhYU3dzMPhA2XkMgyrH+eCi1SU2Y8ItTyEusZ//SHmj7sJCoq2W3Cpe8AB8u?=
 =?us-ascii?Q?QOtnL5dbGPFgzhi3OxnzgrlBcK6ii+yrqfOeBVhtLiCdUjy3EdPXXsrJPGxy?=
 =?us-ascii?Q?/lXL6GG8l7a2jYQLb570L4GGvj6DKHYLuojOugrWw3D3E+RnPEMIM8Lj0tlX?=
 =?us-ascii?Q?GWVDEhmOUVImZqGuOXL//zdbrPLkHh4X1+kKmuP7k/8EE42UTlCBbJXuPrv3?=
 =?us-ascii?Q?HJbMk9hvujoBKe+HHbEENt6/l0pN63ESrYHWqxQC/ijMosc3q+zBxI5M3Z0x?=
 =?us-ascii?Q?xWZ+++YYLlwype0T9mtcKJtPEs2xBAfcjuk0wbDe3rz2q1Eg2hYxYJPzlwWp?=
 =?us-ascii?Q?/DpxqONSKLcec6GppBpRBLsTVLk7y3I9wDO6I6YAPf00Xysf4Ahg/m+TjgeT?=
 =?us-ascii?Q?EQ6DYt+wIg=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 772b6d60-feb7-4f6a-e914-08df37bb1aec
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2026 01:54:46.0739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8fu7Pkh6pbRzwNeh8UED88lkmGpYDmEJEbygYSvnYodPMhJmEDAjbyRSp0UII50AbVsJpWe5655MVJwAIVc+KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY6P286MB7882
X-purgate-ID: tlsNG-4011c0/1793498091-4BCD3CFC-41CD45B8/0/0
X-purgate-type: clean
X-purgate-size: 2110
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Jan!

Thank you for taking a look at the series.

On, Fri, 30 Oct 2026 11:31:23 +0100, Jan Beulich wrote:
>On 23.10.2026 06:48, Ryo Takakura wrote:
>> Ryo Takakura (5):
>>   xen/arm64: livepatch: enable attaching callbacks
>>   xen/livepatch: Allow tracers to schedule livepatch
>>   xen/tracing: prepare a livepatch payload and its controling interface
>>   xen/tracing: Add a function tracer
>>   xen/x86: livepatch: enable attaching callbacks
>> 
>>  xen/arch/arm/Kconfig                  |  13 +
>>  xen/arch/arm/arch.mk                  |   3 +
>>  xen/arch/arm/arm64/Makefile           |   1 +
>>  xen/arch/arm/arm64/insn.c             |   5 +
>>  xen/arch/arm/arm64/livepatch-asm.S    |  68 +++
>>  xen/arch/arm/arm64/livepatch.c        |  39 ++
>>  xen/arch/arm/include/asm/arm64/insn.h |   1 +
>>  xen/arch/arm/xen.lds.S                |   5 +
>>  xen/arch/x86/Kconfig                  |  13 +
>>  xen/arch/x86/Makefile                 |   1 +
>>  xen/arch/x86/arch.mk                  |   3 +
>>  xen/arch/x86/livepatch-asm.S          |  60 +++
>>  xen/arch/x86/livepatch.c              |  33 ++
>>  xen/arch/x86/xen.lds.S                |   5 +
>>  xen/common/Kconfig                    |  12 +
>>  xen/common/Makefile                   |   6 +
>>  xen/common/function_trace.c           | 274 ++++++++++
>>  xen/common/hypfs_trace.c              | 743 ++++++++++++++++++++++++++
>>  xen/common/livepatch.c                | 137 ++++-
>>  xen/include/xen/hypfs_trace.h         |  42 ++
>>  xen/include/xen/livepatch.h           |  14 +
>>  xen/include/xen/livepatch_payload.h   |   7 +-
>>  22 files changed, 1478 insertions(+), 7 deletions(-)
>>  create mode 100644 xen/arch/arm/arm64/livepatch-asm.S
>>  create mode 100644 xen/arch/x86/livepatch-asm.S
>>  create mode 100644 xen/common/function_trace.c
>>  create mode 100644 xen/common/hypfs_trace.c
>>  create mode 100644 xen/include/xen/hypfs_trace.h
>
>Nit: Dashes in favor of underscores please in new files' names.

Understood. I'll rename them in the next version.

Sincerely,
Ryo Takakura

